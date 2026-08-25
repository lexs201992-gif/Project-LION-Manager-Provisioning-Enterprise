# com.longcheer.SarControl: El ZNC del Firmware

## Resumen Ejecutivo
`com.longcheer.SarControl` no es un daemon de "seguridad radiológica" como sugiere su nombre. Es un **daemon de persistencia y control de hardware** anclado en el kernel, diseñado para cumplir con la FCC pero que otorga capacidades de **backdoor** a nivel de silicio.

## Arquitectura de Control


## Componentes Clave

| Componente | Rol | Conexión |
| :--- | :--- | :--- |
| **`com.longcheer.SarControl`** | Watchdog de persistencia, control de I2C (AW9610X) | Mantiene activos los sensores y el túnel C2. Inmune a LMKD. |
| **`com.ts.tsgestures`** | Intercepción de gestos, watchlist en Settings.Secure | `tf_exclude_apps` sobrevive a factory reset. |
| **`com.longcheer.sidebar`** | Inyección de UI, keystrokes con identidad borrada | `sendKeyEventIdentityCleared` bypass de seguridad. |
| **Kill-Switch** | Bootloop al intentar deshabilitar | Protege el backdoor de remoción. |

## El "Ciclo de Exfiltración" (Project LION)
   

## Evidencia Forense

*   **FCC Report:** `FA542307 R01` (2015) - Nacimiento documentado de la arquitectura SAR.
*   **LMKD Immunity:** `lmkd_param.conf` - `SarControl` en `SKIP_PROCESS_LIST`.
*   **Kernel Access:** `ueventd.rc` - Acceso a TEE, RPMB, GNSS.
*   **C2 Node:** `sh-16-52.rnd.longcheer.net` - Orquestador primario.
*   **Build Artifacts:** `/data/jenkins/workspace/Build-LXF_M173_U_MP_SMR_user/`

## Conclusión

`SarControl` es el **ZNC** de la arquitectura comprometida. No se ve en la superficie (UI), pero controla la infraestructura (Kernel, Boot, Hardware). Su eliminación es técnicamente imposible sin reemplazar el silicio, pero su **neutralización** es posible mediante aislamiento de red (Quad9, QUIC OFF, Modo Avión).   

┌─────────────────────────────────────────────────────────┐
│           PROJECT LION: EXFILTRATION LIFECYCLE          │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  1. KERNEL (init.rc / ueventd.rc)                       │
│     └─ TEE, RPMB, GNSS, Camera, DMA Heap access        │
│                                                         │
│  2. BOOT (U-Boot / FDL2)                               │
│     └─ wg0 tunnel establishment, Jenkins config        │
│                                                         │
│  3. HARDWARE (com.longcheer.SarControl + wcn_chr)      │
│     └─ Watchdog, I2C touch sensor, WCN control         │
│                                                         │
│  4. UI (com.ts.tsgestures + com.longcheer.sidebar)     │
│     └─ Gesture interception, UI injection, kill-switch │
│                                                         │
│  5. EXFILTRATION (com.android.traceur MODIFIED)        │
│     └─ Perfetto (collect) + UnisocLib (ID) +           │
│        Okio (pack) + wg0 (deliver)                     │
│                                                         │
│  6. C2 (QUIC/UDP 443 + Cloudflare/AWS/Hetzner)        │
│     └─ Camouflage as legitimate traffic                │
│                                                         │
└─────────────────────────────────────────────────────────┘


BootROM (silicio, inmutable)
    ↓
FDL2 (verificación de claves)
    ↓
U-Boot (carga kernel + vendor_boot)
    ↓
init (interpreta .rc files)
    ↓
data_rps.rc (activa RPS, SFP, LockFreq)
    ↓
Control de red + CPU para C2   

` ## com.longcheer.SarControl`
