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

---
*Author: Alexis Michel De La Cruz Correa (lexs201992-gif)*   
