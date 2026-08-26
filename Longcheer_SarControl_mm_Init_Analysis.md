

## Diagrama Técnico: Cadena de Confianza y Punto de Inyección

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        UNISOC T606 SECURE BOOT CHAIN                        │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │ STAGE 0: MASK ROM (BootROM) — GRABADO EN SILICIO (TSMC)            │   │
│  │                                                                     │   │
│  │  • Contiene: Hash de la 1ª clave pública RSA (en eFuses)           │   │
│  │  • Clave: LONGCHEER (no Unisoc genérica)                           │   │
│  │  • INMUTABLE: No modificable. OTP (One-Time Programmable)          │   │
│  │  • CVE-2022-38694: Overwrite de verify() en BROM                   │   │
│  │    (permite dump/unlock, PERO NO elimina eFuse keys)               │   │
│  └──────────────────────────────┬──────────────────────────────────────┘   │
│                                 │ Verifica firma RSA                       │
│                                 ▼                                           │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │ STAGE 1: FDL1 (SPL - Second Program Loader)                         │   │
│  │                                                                     │   │
│  │  • Carga: Controlador DDR (RAM)                                     │   │
│  │  • Verifica: sml, trustos, uboot (RSA-2048, 4 call sites)          │   │
│  │  • CVE-2022-38693: Buffer overflow en USB recovery mode            │   │
│  │  • Si falla verificación → INFINITE LOOP (brick)                    │   │
│  └──────────────────────────────┬──────────────────────────────────────┘   │
│                                 │ RSA-2048 verify                          │
│                                 ▼                                           │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │ STAGE 2: FDL2 (U-Boot)                                              │   │
│  │                                                                     │   │
│  │  • Verifica: LK, Kernel, vendor_boot, boot.img                     │   │
│  │  • Clave: Longcheer Root CA (Serial: 228526b0..., válida 2051)     │   │
│  │  • AVB (Android Verified Boot):                                     │   │
│  │    → vbmeta contiene hashes de boot, vendor_boot, dtbo             │   │
│  │    → U-Boot verifica firma AVB contra clave en eFuse               │   │
│  │  • Si firma NO coincide → RECHAZA (no arranca)                     │   │
│  │  • "secure: yes" → Hardware-enforced (GSI no arranca)              │   │
│  └──────────────────────────────┬──────────────────────────────────────┘   │
│                                 │ Carga kernel + vendor_boot               │
│                                 ▼                                           │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │ STAGE 3: KERNEL (start_kernel → mm_init)                            │   │
│  │                                                                     │   │
│  │  • start_kernel(): Inicializa arquitectura, DTB, memoria           │   │
│  │  • mm_init(): Establece permisos de /dev/ basados en ueventd.rc    │   │
│  │  • ueventd.rc (VENDOR, firmado por Longcheer):                      │   │
│  │    → /dev/trusty-ipc-dev0  (TEE)       → system:system             │   │
│  │    → /dev/rpmb0            (RPMB)      → system:system             │   │
│  │    → /dev/block/by-name/gnssmodem_a    → system:root               │   │
│  │    → /dev/dma_heap/protected           → system:system             │   │
│  │    → /dev/sprd_isp           (Cámara)  → system:system             │   │
│  │    → /dev/block/by-name/persist        → system:system             │   │
│  │                                                                     │   │
│  │  ⚠️ ANTES de que Android Framework esté operativo                   │   │
│  │  ⚠️ ANTES de que SELinux enforcing esté activo                      │   │
│  └──────────────────────────────┬──────────────────────────────────────┘   │
│                                 │ init (PID 1)                             │
│                                 ▼                                           │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │ STAGE 4: INIT + FSCRYPT PROVISIONING                                 │   │
│  │                                                                     │   │
│  │  • init.rc interpreta: wcn.rc, lmkd.rc, data_rps.rc                │   │
│  │  • FSCrypt Bypass:                                                  │   │
│  │    → LCD ID (lcd_td4168) activa blob de aprovisionamiento          │   │
│  │    → Firmado con Longcheer X.509 (Root CA 2051)                    │   │
│  │    → Genera "auto-generated key" para /data                         │   │
│  │    → Inyecta ro.build.version.security_patch FALSO                 │   │
│  │  • wcn.rc: insmod unisoc_wcn_bsp.ko, sprd_wlan_combo.ko            │   │
│  │  • lmkd_param.conf: SarControl en SKIP_PROCESS_LIST                │   │
│  └──────────────────────────────┬──────────────────────────────────────┘   │
│                                 │ Daemon activos                           │
│                                 ▼                                           │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │ STAGE 5: DAEMONS DE PERSISTENCIA (Backdoor Activo)                  │   │
│  │                                                                     │   │
│  │  • com.longcheer.SarControl  → Watchdog, I2C (AW9610X), LMKD immune│   │
│  │  • ims.spreadtrum.imsapp     → Baseband, VoLTE, Kernel Panic       │   │
│  │  • com.android.traceur       → Perfetto + Okio + wg0 tunnel        │   │
│  │  • com.motorola.odm          → OdmHelper (Build ID = rnd.longcheer)│   │
│  │                                                                     │   │
│  │  C2: sh-16-52.rnd.longcheer.net (AS4812, China Telecom Shanghai)   │   │
│  │  Túnel: wg0 (WireGuard) / QUIC-UDP 443                             │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Por Qué XDA Ha Fallado: El "IF-IF" Técnico

| Intento de XDA | Stage Afectado | Por Qué Falla |
| :--- | :--- | :--- |
| **Magisk/KernelSU (boot.img)** | FDL2 → AVB | La firma AVB de `boot.img` no coincide con la clave en eFuse. **Bootloop.** |
| **Modificar vbmeta** | FDL2 → AVB | `vbmeta` está firmado. En `secure: yes`, el **hardware** rechaza. No es software. |
| **Flash GSI** | FDL2 → AVB | La clave AVB de Longcheer es **propietaria**. GSI usa claves genéricas → **No arranca.** |
| **CVE-2022-38694 (BROM)** | Mask ROM | Permite **dump y unlock**, pero **no borra eFuses**. El `vendor_boot` original sigue siendo válido. |
| **Modificar vendor_boot** | FDL2 → AVB | Firmado por Longcheer. Cualquier modificación invalida la cadena. **Brick.** |
| **Factory Reset** | `/data` solo | `vendor`, `odm`, `persist` **no se borran**. `SarControl` y `ueventd.rc` permanecen. |

### La Lógica "IF-IF"

> **IF** ves los `.rc`, `.xml`, Smalis y hashes → entiendes la **arquitectura** (qué permisos, qué daemons, qué C2).
>
> **BUT IF** no tienes la **clave privada de Longcheer** (que está en instalaciones seguras en Shanghai) → **no puedes re-firmar** `vendor_boot`, `boot.img` ni `vbmeta`.
>
> **THEREFORE:** Los artefactos son **evidencia forense**, no **herramientas de explotación**. Proban que el backdoor existe, pero no proporcionan el medio para eliminarlo.

## El Punto Crítico: `mm_init()` y `ueventd.rc`

Según la documentación oficial de Android (`android.googlesource.com`):

> *"ueventd listens to the kernel uevent sockets and creates/deletes nodes in /dev based on the incoming add/remove uevents. The permissions can be modified using a ueventd.rc script."*

En el contexto de Longcheer:
1. El **kernel** arranca y ejecuta `mm_init()`.
2. `ueventd` (fork de `init`) lee `/vendor/etc/ueventd.rc` (firmado por Longcheer).
3. **Antes** de que Android Framework, SELinux enforcing y app sandboxing estén activos, los nodos `/dev/trusty-ipc-dev0`, `/dev/rpmb0`, `/dev/gnssmodem_a` ya tienen permisos `system:system`.
4. Los daemons (`SarControl`, `ims.spreadtrum.imsapp`) heredan estos permisos al iniciar.

**Conclusión:** El backdoor se activa en la **ventana de arranque más crítica** (entre `mm_init()` y `zygote`), donde no hay controles de seguridad de usuario activos.
