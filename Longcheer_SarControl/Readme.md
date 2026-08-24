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

## `com.longcheer.SarControl`
| Componente | Rol | Conexión |
| :--- | :--- | :--- |
| **`com.longcheer.SarControl`** | Watchdog de persistencia, control de I2C (AW9610X) | Mantiene activos los sensores y el túnel C2 |
| **`com.ts.tsgestures`** | Intercepción de gestos, watchlist en `Settings.Secure` | **`tf_exclude_apps`** sobrevive a factory reset |
| **`com.longcheer.sidebar`** | Inyección de UI, keystrokes con identidad borrada | `sendKeyEventIdentityCleared` bypass de seguridad |
| **Kill-Switch** | Bootloop al intentar deshabilitar | Protege el backdoor de remoción |

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
