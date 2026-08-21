# ODM Partition: `/system/vendor/odm`

This directory contains the **ODM-specific configuration** for the Unisoc T606 chipset, managed by Longcheer.

## Key Files

| File | Forensic Significance |
| :--- | :--- |
| `etc/init/wcn.rc` | Defines `wcnss_service` – the driver responsible for **kernel-level network injection** (UID -1) that bypasses VPN and Airplane Mode. |
| `etc/init/init.usb.configfs.rc` | Manages USB MUX, enabling **JTAG exposure over USB** for protected memory rewrite. |
| `etc/sw_config.xml` | **TEE (Trusted Execution Environment)** configuration. Contains debug options (`data_dumping`) in a production firmware – anomalous and enables biometric data exfiltration. |
| `etc/vintf/vendor_manifest.xml` | Registers Unisoc security HALs (`ifaa`, `soter`, `tui`) with `override="true"`, confirming Longcheer **overrides Android's standard biometric authentication stack**. |

## Integridad

| File | SHA-256 |
| :--- | :--- |
| `etc/init/wcn.rc` | `[INSERT]` |
| `etc/init/init.usb.configfs.rc` | `[INSERT]` |
| `etc/sw_config.xml` | `[INSERT]` |
| `etc/vintf/vendor_manifest.xml` | `[INSERT]` |

### `wcn.rc` – Regional Activation Logic (Part 2)

The second half of `wcn.rc` reveals a **region-specific activation system**:

| Property | SKU | Script | Region |
| :--- | :--- | :--- | :--- |
| `persist.sys.longcheer.wifisar=1` | `1, 2, 3, 4, 7, 8, 9, 10` | `wifisar1eu` | Europe/Global |
| `persist.sys.longcheer.wifisar=2` | `1, 2, 3, 4, 7, 8, 9, 10` | `wifisar2eu` | Europe/Global |
| `persist.sys.longcheer.wifisar=6` | `1, 2, 3, 4, 7, 8, 9, 10` | `wifisar6eu` | Europe/Global |
| `persist.sys.longcheer.wifisar=1` | `6, 11` | `wifisar2anz` | Asia/NZ/Australia |
| `persist.sys.longcheer.wifisar=2` | `6, 11` | `wifisar3anz` | Asia/NZ/Australia |
| `persist.sys.longcheer.wifisar=3` | `6, 11` | `wifisar4anz` | Asia/NZ/Australia |
| `persist.sys.longcheer.wifisar=6` | `6, 11` | `wifisar6anz` | Asia/NZ/Australia |

**Critical Findings:**
1. **`persist.sys.longcheer.wifisar`** is a **remote kill-switch** that allows Longcheer to activate/deactivate specific hardware modules.
2. **SKU Segmentation:** The firmware is **not generic**. It contains **11+ region-specific configurations**, proving that Longcheer tailors the backdoor behavior per market.
3. **Dixon-Longcheer JV Implication:** The India JV will likely introduce a **new SKU** (e.g., `12`) with its own activation logic, replicating this architecture in India's strategic manufacturing hub.   

### `init.sunwave.rc` – TEE & Fingerprint Compromise

| Element | Forensic Significance |
| :--- | :--- |
| `gf_spi_tee.ko` | **Goodix fingerprint driver loaded in TEE** – direct access to biometric templates in Secure World |
| `on factorytest` | Driver loaded during **factory validation** – backdoor survives factory reset |
| `/dev/goodix_fp` (0666) | **World-readable/writable** – allows any process to access the fingerprint sensor node |

**Conclusion:** The fingerprint sensor is managed in the **TEE** with **insecure permissions (0666)**, enabling biometric data exfiltration or spoofing by compromised components (`co.sitic.pp`, `com.motorola.enterprise.adapter.service`).   
---
*Author: Alexis Michel De La Cruz Correa (lexs201992-gif)*   
