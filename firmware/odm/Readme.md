## ⚠️ Critical Indicators of Compromise (IOCs)

The firmware analysis reveals a **kernel-level backdoor architecture** in the Longcheer/Unisoc `qogirl6` (Moto G04s) board. The `ueventd.rc` files, loaded during FLD2 boot, grant unauthorized access to TEE, RPMB, GNSS, and camera hardware.

### Key Evidence
- **Kernel Backdoor Config:** [https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/firmware/odm/ANALYSIS.md]
- **Vendor Ueventd Rules:** [`firmware/etc/ueventd_vendor_unisoc_qogirl6.rc`](https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/Firmware/etc/ueventd.rc)
- **Root Ueventd Rules:** [`firmware/etc/ueventd_root.rc`](https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/firmware/odm/ueventd.rc)

### Risk Summary
| Threat | Vector | Impact |
| :--- | :--- | :--- |
| **Remote Code Execution (RCE)** | Kernel-level `system` UID access via `ueventd.rc` | Persistent control over device infrastructure |
| **Token Theft** | TEE Access (`/dev/trusty-ipc-dev0`) + Enterprise Manager | Exfiltration of OAuth, SSO, and cryptographic keys |
| **Sensor Exfiltration** | ISP/Camera Access (`/dev/sprd_isp`) + DMA Heap | Silent capture of images, audio, and GNSS data |
| **Anti-Forensics** | Persist Partition + Display Control | Backdoor survives factory resets; screen can be frozen to hide activity |

### Immediate Action Recommended
1. **Audit** all devices with `qogirl6` board (Moto G04s, E13) for the presence of `/dev/trusty-ipc-dev0` and `/dev/rpmb0` with `system` UID permissions.
2. **Monitor** for network traffic to the C2 IPs documented in [`Dialer_splitter_c2.rules`](https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/Rules/Dialer_splitter_c2.rules)
3. **Report** confirmed compromises to CISA, CERT-In, and the OEM's PSIRT.   
