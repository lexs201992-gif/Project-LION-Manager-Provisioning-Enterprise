# Vendor Partition: `/system/vendor/etc`

This directory contains **vendor-level configuration** for the Unisoc T606 chipset, including HAL definitions and security policies.

## Key Files

| File | Forensic Significance |
| :--- | :--- |
| `[To be added]` | HAL configurations, SELinux policies, and security-related vendor settings. |

## Pending

Additional files to be uploaded from `/system/vendor/etc/` including:
- `vintf/` manifests
- `selinux/` policy files
- `security/` certificate stores

### `lmkd_param.conf` – Kernel-Level Process Persistence

The `lmkd_param.conf` file defines the **Low Memory Killer Daemon (LMKD)** configuration. Processes listed under `TITLE_LMKD_SKIP_PROCESS_LIST` are **exempt from being killed** by the kernel, even under extreme memory pressure.

| Process | Forensic Significance |
| :--- | :--- |
| `com.longcheer.SarControl` | **Longcheer's SAR daemon is immortal** – cannot be killed by the kernel. Ensures **persistent radio/antenna control**. |
| `com.motorola.ccc` | Motorola Customer Care Center – **persistent "support" service** (potential C2 channel). |
| `com.whatsapp` | **Anomalous:** User app exempt from LMKD. Suggests **WhatsApp is used as a covert exfiltration channel** or process disguise. |
| `com.motorola.launcher3` | **Persistent UI** – ensures the compromised launcher (with `com.longcheer.sidebar`) always stays active. |

**Conclusion:** Longcheer has **kernel-level control** over the process lifecycle of its backdoor components. The exemption of `com.longcheer.SarControl` and `com.whatsapp` from the LMKD is a **critical persistence mechanism** that cannot be reversed by the user or standard security tools.   



---
*Author: Alexis Michel De La Cruz Correa (lexs201992-gif)*   
