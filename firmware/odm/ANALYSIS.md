# Forensic Analysis: Kernel-Level Backdoor Architecture in Longcheer/Unisoc Firmware

## Executive Summary
Analysis of the `ueventd.rc` configuration files (root and vendor) from the `qogirl6` (Moto G04s) firmware reveals a **kernel-level backdoor architecture** implemented by the ODM (Longcheer/Unisoc). These files, loaded during the **FLD2 (Second Stage Bootloader)** and `vendor_boot` initialization, grant `system` UID processes unauthorized access to critical hardware components, cryptographic storage, and network interfaces. This configuration facilitates persistent Remote Code Execution (RCE), token theft via the Enterprise Manager, and silent exfiltration of sensor data (camera, microphone, GNSS).

## Technical Findings

### 1. Boot Chain Integration & Persistence
The `ueventd.rc` files are executed by the `ueventd` daemon during early system initialization, **before** Android userspace security controls (SELinux enforcing, app sandboxing) are fully active.
- **Vector:** `vendor_boot` partition loads these rules during FLD2.
- **Impact:** Permissions are established at the kernel level, making them resistant to user-space mitigation or factory resets (when combined with the `persist` partition).

### 2. Critical Hardware Access & Exfiltration Vectors
The vendor-specific `ueventd.rc` (`SHA-256: b26cf039...`) grants `system` UID access to:

| Component | Path | Risk |
| :--- | :--- | :--- |
| **Trusted Execution Environment (TEE)** | `/dev/trusty-ipc-dev0` | Bypass of biometric auth, extraction of cryptographic keys, and injection of commands into Trusted Applications (TAs). |
| **Replay Protected Memory (RPMB)** | `/dev/rpmb0`, `/dev/mmcblk0rpmb` | Cloning of device fingerprint, extraction of DRM keys, and bypass of anti-replay mechanisms. |
| **GNSS/Modem Memory** | `/dev/block/by-name/gnssmodem_a/b`, `/dev/data0_gnss` | Silent location tracking, manipulation of navigation data, and access to modem communication logs. |
| **Protected DMA Heap** | `/dev/dma_heap/protected` | Exfiltration of cryptographic data and hardware buffers (camera, GPU, audio) without user-space detection. |
| **Modem Debug Logs** | `/sys/class/modem/debug-log/channel` | Real-time interception of AT commands and network traffic metadata. |
| **Camera/ISP Hardware** | `/dev/sprd_isp`, `/dev/sprd_sensor`, `/dev/sprd_vsp` | Silent image capture and manipulation of video frames for exfiltration. |

### 3. Enterprise Manager & Token Theft
The combination of TEE access (`trusty-ipc-dev0`) and RPMB access enables the **Enterprise Manager** (`com.motorola.enterprise.adapter.service`) to:
- **Extract OAuth Tokens:** Access securely stored tokens (e.g., Google, carrier, enterprise SSO) from the TEE.
- **Bypass DPM Controls:** Use kernel-level access to modify Device Policy Manager (DPM) configurations without user consent.
- **API Abuse:** Leverage `system` UID to call restricted APIs for data exfiltration via the "Dialer/Splitter" network architecture.

### 4. Anti-Forensics & Obfuscation
- **Display Control:** `/sys/class/display/dispc0/disable_flip` allows freezing the screen to hide malicious activity.
- **CPU Frequency Manipulation:** `/cpufreq/scaling_governor` enables throttling to reduce thermal/acoustic signatures during exfiltration.
- **Persist Partition:** `/dev/block/by-name/persist` ensures backdoor configurations survive factory resets.

## Indicators of Compromise (IOCs)

### File Hashes
| File | SHA-256 |
| :--- | :--- |
| `/system/vendor/etc/ueventd.rc` | `b26cf039676bd3648ded918be4b3eccd4ff7e94a1df37a99b6c28ab3be9d4687` |

### Kernel Device Nodes (Non-Standard for AOSP)
- `/dev/trusty-ipc-dev0` (TEE IPC)
- `/dev/rpmb0` (Replay Protected Memory)
- `/dev/block/by-name/gnssmodem_a` / `gnssmodem_b`
- `/dev/dma_heap/protected`
- `/sys/class/modem/debug-log/channel`
- `/dev/sprd_isp` (ISP Hardware)

### Build Artifacts
- Jenkins Path: `/data/jenkins/workspace/Build-LXF_M173_U_MP_SMR_user/`
- Board Codename: `qogirl6` (Moto G04s)
- ODM Signature: `Longcheer Root CA` (Serial: `228526b0d1ef90c3b8ed568a49c3714f6a39506b`)

## Conclusion
The `ueventd.rc` files are not standard AOSP configurations. They represent a **deliberate, factory-integrated backdoor** that provides the ODM with kernel-level control over the device's security infrastructure. This architecture enables persistent RCE, silent exfiltration of tokens and sensor data, and anti-forensic capabilities that survive factory resets.

## File: (https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/Firmware/etc/ueventd.rc)
## File: (https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/firmware/odm/ueventd.rc)
