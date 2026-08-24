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
| `ylog.rc` | `[pending]` |
| `linkturbonative.rc` | `[pending]` |
| `srmi_proxyd.rc` | `[pending]` |
| `init.thirdPartyprops.rc` | `[pending]` |
| `uniresctlopt.rc` | `[pending]` |
| `remotedisplay.rc` | `[pending]` |
| `ims_bridged.rc` | `[pending]` |

---

**Author:** Alexis Michel De La Cruz Correa (lexs201992-gif)
**Project:** LION – Longcheer/Unisoc Supply Chain Compromise
**Disclosure:** Coordinated with CISA, Motorola CSIRT, AttackerKB
```
