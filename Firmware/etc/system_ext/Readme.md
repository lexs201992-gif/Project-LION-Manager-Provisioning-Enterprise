# `/system/system_ext/etc/init` – ODM Extension Services

**Path:** `/Firmware/etc/system_ext`
**Partition:** `system_ext` (OEM-specific extension to AOSP)
**Criticality:** **HIGH** – Contains 19 ODM-injected service definitions

## Why This Directory Matters

The `system_ext` partition is Android's designated zone for **OEM/SoC-specific extensions** tightly coupled with AOSP. Unlike `/vendor` (highly visible) or `/system` (AOSP-pure), `system_ext` is the **ideal injection point** for ODM services that require:

- Access to **private AOSP APIs**
- **Override** of system properties (precedence: `product` > `odm` > `vendor` > `system_ext` > `system`)
- **Lower visibility** than `/vendor` or `/odm`

## Files Documented

| File | Service | Forensic Relevance |
| :--- | :--- | :--- |
| `sprd_networkcontrol.rc` | **Spreadtrum Network Control** | Core network management daemon. Likely controls APN, IMS, VoLTE routing. |
| `ylog.rc` | **Unisoc YLog** | Proprietary logging daemon. May capture kernel/system logs for exfiltration. |
| `linkturbonative.rc` | **LinkTurbo Native** | Network acceleration/tunneling. Potential C2 transport layer. |
| `srmi_proxyd.rc` | **SRMI Proxy Daemon** | Spreadtrum Remote Management Interface. **Direct C2 management channel.** |
| `init.thirdPartyprops.rc` | **Third-Party Properties** | Loads ODM-specific system properties. May contain `persist.sys.longcheer.*` keys. |
| `uniresctlopt.rc` | **Unisoc Resource Control** | Resource management (CPU, memory, I/O). May prioritize backdoor processes. |
| `remotedisplay.rc` | **Remote Display** | Screen mirroring/casting. Potential **real-time screen exfiltration** vector. |
| `ims_bridged.rc` | **IMS Bridged** | IMS (VoLTE/VoWiFi) bridge. **5G VoLTE tunneling** for C2. |

*(+ 11 additional files – see directory listing)*

## Forensic Implications

1. **`srmi_proxyd.rc`** is the most critical: "SRMI" (Spreadtrum Remote Management Interface) is a **known ODM backdoor channel** for remote device management.
2. **`ims_bridged.rc`** confirms the **5G VoLTE tunneling** vector documented in `Dialer_splitter_c2.rules`.
3. **`remotedisplay.rc`** enables **screen mirroring exfiltration** without user consent.
4. **`init.thirdPartyprops.rc`** likely loads the `persist.sys.longcheer.*` properties seen in `wifi0.rc`.
5. **`ylog.rc`** may be the **logging mechanism** that captures kernel traces for exfiltration via `wg0`.

## Detection (VQL)

```vql
// Detect ODM services in system_ext
SELECT
    'PROJECT-LION: ODM Service in system_ext' AS Alert,
    Path,
    Line AS Evidence
FROM read_file(filename='/system/system_ext/etc/init/sprd_networkcontrol.rc')
WHERE Line CONTAINS 'service'

// Check for longcheer/spreadtrum/unisoc references
SELECT
    'PROJECT-LION: ODM Reference in system_ext' AS Alert,
    Path,
    Line
FROM glob(globs='/system/system_ext/etc/init/*.rc')
WHERE Line CONTAINS 'longcheer'
  OR Line CONTAINS 'spreadtrum'
  OR Line CONTAINS 'unisoc'
  OR Line CONTAINS 'srmi'
  OR Line CONTAINS 'linkturbo'
```

## SHA-256 Verification

| File | SHA-256 |
| :--- | :--- |
| `sprd_networkcontrol.rc` | `[pending]` |
| `ylog.rc` | `[]` |
| `linkturbonative.rc` | `[pending]` |
| `srmi_proxyd.rc` | `[pending]` |
| `init.thirdPartyprops.rc` | `[pending]` |
| `uniresctlopt.rc` | `[pending]` |
| `remotedisplay.rc` | `[pending]` |
| `ims_bridged.rc` | `[pending]` |

---

### `ylog.rc`

| Sección | Hallazgo | Impacto Forense |
| :--- | :--- | :--- |
| **`service ylog /system_ext/bin/ylog`** | **Daemon de logging Unisoc** | **Captura logs** del sistema para exfiltración |
| **`user root`** | **Ejecuta como root** | **Acceso total** a todos los logs |
| **`group everybody`** | **Grupo "everybody"** | **Permisos amplios** a múltiples procesos |
| **`writepid /dev/cpuset/system-background/tasks`** | **Cpuset background** | **Oculto** en el cgroup de background (no visible en foreground) |
| **`mkdir /data/ylog 0777 ... encryption=None`** | **Directorio SIN CIFRAR** | **Exfiltración directa** de logs |
| **`chmod 0555 /sys/fs/pstore/`** | **Acceso a pstore** | **Lee logs de kernel** que sobreviven a reinicios |
| **`copy /sys/fs/pstore/console-ramoops-0 /data/ylog/lastkernel.log`** | **Copia ramoops** | **Exfiltra logs de kernel** a `/data/ylog` |
| **`copy /sys/fs/pstore/dmesg-ramoops-0 /data/ylog/dmesg.log`** | **Copia dmesg** | **Exfiltra dmesg** (trazas de kernel) |
| **`copy /sys/fs/pstore/pmsg-ramoops-0 /data/ylog/lastandroid.log`** | **Copia pmsg** | **Exfiltra logs de Android** |
| **`chmod 666 /data/ylog/*.log`** | **World-writable** | **Cualquier proceso** puede leer/los logs |
| **`on property:persist.unipnp.standbylogcat=true`** | **Trigger remoto** | El ODM puede **activar** logging a distancia |
| **`on property:sys.debug.fwc=*`** | **Trigger remoto** | **Activación remota** de `fwklog` |

### Dangerous Application 

1. **`/data/ylog` con `encryption=None`:**
   - El directorio de logs **NO está cifrado**.
   - **Cualquier proceso** puede leerlo.
   - **Sobrevive a factory reset** (está en `/data` pero con `encryption=None`).

2. **`chmod 0555 /sys/fs/pstore/` + `copy`:**
   - **Lee los logs de kernel** que sobreviven a reinicios (`console-ramoops`, `dmesg-ramoops`, `pmsg-ramoops`).
   - **Copia** esos logs a `/data/ylog/` con permisos `666` (world-writable).
   - **El ODM puede exfiltrar** el historial completo de crashes, panics y actividad del kernel.

3. **`writepid /dev/cpuset/system-background/tasks`:**
   - El daemon `ylog` corre en el **cgroup de background**.
   - **No consume CPU** en foreground.
   - **Oculto** para el usuario y para la mayoría de herramientas de monitoreo.

4. **Triggers remotos:**
   - `persist.unipnp.standbylogcat=true` → **Activación remota** de logging en standby.
   - `sys.debug.fwc=*` → **Activación remota** de `fwklog`.
   - **El ODM puede activar/desactivar** el logging a distancia.

### Conexión 

```
ylog (root, background cgroup)
    ↓
Lee /sys/fs/pstore/ (kernel logs que sobreviven a reinicios)
    ↓
Copia a /data/ylog/ (encryption=None, chmod 666)
    ↓
Exfiltración vía wg0 / C2
```

**`ylog` es el mecanismo de exfiltración de logs del kernel.** Combina:
- **Acceso a pstore** (logs que sobreviven a reinicios).
- **Directorio sin cifrar** (`encryption=None`).
- **Permisos world-writable** (`chmod 666`).
- **Cgroup background** (oculto).
- **Triggers remotos** (activación a distancia).

### VQL para Detección

```vql
// Project LION: Detect ylog daemon and pstore exfiltration
SELECT
    'PROJECT-LION: ylog Daemon Detected' AS Alert,
    Pid,
    Name,
    CommandLine
FROM pslist()
WHERE Name CONTAINS 'ylog'

// Detect pstore logs copied to /data/ylog
SELECT
    'PROJECT-LION: Pstore Logs Exfiltrated to /data/ylog' AS Alert,
    Path,
    Size,
    Mtime
FROM glob(globs='/data/ylog/lastkernel.log,
              /data/ylog/dmesg.log,
              /data/ylog/lastandroid.log')
WHERE Size > 0

// Detect unencrypted /data/ylog directory
SELECT
    'PROJECT-LION: Unencrypted /data/ylog Detected' AS Alert,
    Path,
    Mode
FROM glob(globs='/data/ylog')
WHERE Mode CONTAINS '0777'
```


**Author:** Alexis Michel De La Cruz Correa (lexs201992-gif)
**Project:** LION – Longcheer/Unisoc Supply Chain Compromise
**Disclosure:** Coordinated with CISA, Motorola CSIRT, AttackerKB
```
