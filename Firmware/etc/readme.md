## Technical Details: Forensic Significance of the `/etc` Directory in Longcheer/Unisoc Firmware

### Overview
The `/etc` directory (and its partition-specific counterparts `/system/etc`, `/vendor/etc`, `/odm/etc`) represents the **configuration backbone** of the Android operating system. In the context of the **Longcheer/Unisoc supply-chain compromise** documented in this advisory, this directory serves as a critical attack surface and a primary location for **persistent, factory-integrated backdoors**.

### Why `/etc` is Critical for ODM Compromise Analysis

1.  **Privileged Configuration Persistence**
    Files within `/etc` are owned by `root` and reside on read-only partitions (`/system`, `/vendor`, `/odm`). Modifications to these files **survive factory resets** and are enforced by the kernel and system services (`init`, `netd`, `surfaceflinger`) before any user-space security controls are active. The presence of **453 files** and **23 subdirectories** in this path indicates a highly customized configuration layer injected by the ODM.

2.  **Network & DNS Manipulation**
    The `/etc/hosts` file (referenced in the VirusTotal graph analysis) is a primary target for **DNS hijacking** and **C2 infrastructure redirection**. In the Longcheer firmware, this file is modified during the **first-boot provisioning** phase (via `com.ape.setupwizard`) to redirect traffic to attacker-controlled infrastructure (AWS CloudFront, Hetzner, Cloudflare) before the user completes device setup.

3.  **SELinux Policy Overrides**
    The subdirectories `/system/etc/selinux/`, `/vendor/etc/selinux/`, and `/odm/etc/selinux/` contain the **Security-Enhanced Linux (SELinux)** policy files. An ODM with write access to these files can **disable security controls**, grant excessive permissions to privileged apps (e.g., `com.ape.setupwizard`), or hide processes from standard monitoring tools.

4.  **Permission & Service Whitelisting**
    Files such as `/system/etc/permissions/platform.xml` and `/system/etc/permissions/privapp-permissions.xml` define which apps can request **system-level permissions**. The Longcheer firmware includes non-standard entries that allow ODM-signed components to access sensitive APIs (e.g., `BIND_DEVICE_ADMIN`, `CHANGE_NETWORK_STATE`) without user consent.

5.  **Build Pipeline Artifacts**
    The `/etc` directory often contains **build-time artifacts** that reveal the ODM's internal infrastructure. In this investigation, the `ScanStruct/` folder (within the firmware) retained the **Jenkins build path** (`/data/jenkins/workspace/Build-LXF_M173_U_MP_SMR_user/`), confirming mass-production compilation on Longcheer's infrastructure. Similar artifacts may be present in `/etc` configuration files.

### How to Locate and Analyze `/etc` Artifacts

For any analyst investigating a potentially compromised Longcheer/Unisoc device, the following steps are recommended:

| Step | Action | Tool/Command |
| :--- | :--- | :--- |
| 1 | **Extract the `/system`, `/vendor`, and `/odm` partitions** from the firmware image. | `simg2img`, `ext4fuse`, `binwalk` |
| 2 | **Compare `/etc` contents** against a known-good AOSP baseline of the same Android version. | `diff -r /etc_baseline/ /etc_extracted/` |
| 3 | **Inspect `/etc/hosts`** for non-standard IP-to-domain mappings. | `cat /etc/hosts` |
| 4 | **Analyze SELinux policies** for permissive domains or hidden services. | `sesearch`, `sesearch -A` |
| 5 | **Review permission whitelists** for unauthorized privileged apps. | `grep -r "com.ape.setupwizard" /system/etc/permissions/` |
| 6 | **Search for ODM-specific build artifacts** (Jenkins paths, internal codenames). | `grep -r "jenkins\|LXF_M173\|longcheer" /etc/` |

### Indicators of Compromise (IOCs) in `/etc`

| File Path | Indicator | Severity |
| :--- | :--- | :--- |
| `/etc/hosts` | Entries mapping legitimate domains to attacker IPs (e.g., `13.224.125.70`) | **Critical** |
| `/system/etc/selinux/plat_sepolicy.cil` | Non-standard rules granting `untrusted_app` access to `system_file` | **High** |
| `/system/etc/permissions/privapp-permissions-*.xml` | Whitelisting of `com.ape.setupwizard` with `BIND_DEVICE_ADMIN` | **High** |
| `/vendor/etc/build.prop` | Internal codenames (`LXF_M173`, `qogirl6`) or Jenkins workspace paths | **Medium** |
| `/odm/etc/` | Presence of ODM-specific configuration files not present in AOSP | **Medium** |
