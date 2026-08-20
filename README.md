# Project LION: Manager Provisioning Enterprise – Primary C2 Injector & Spyware Architecture
**Advisory ID:** GHSA-[PENDING]
**Severity:** CRITICAL (CVSS 9.8)
**Date:** 2026-08-20
**Author:** Alexis Michel De La Cruz Correa (lexs201992-gif)
**Status:** Unpatched / No Vendor Fix

## Executive Summary

This repository documents the discovery of a **critical supply chain compromise** in Motorola devices (Board `lion`, Unisoc T606/T616, ODM Longcheer). The attack weaponizes the legitimate `com.motorola.enterprise.adapter.service` (UID 10204) as the **primary payload injector**, leveraging it to establish persistent Command and Control (C2) channels and deploy spyware capabilities.

The compromise is executed through a dual-component architecture:
1.  **`com.motorola.enterprise.adapter.service` (The Injector):** A legitimate MDM service modified to exfiltrate privileged phone state and receive remote commands via abused OEM infrastructure (`sandclowd.com`).
2.  **`co.sitic.pp` / `sysDLL` (The Executor):** A privileged system app (`/system/priv-app`) authorized with `READ_PRIVILEGED_PHONE_STATE` and `MODIFY_PHONE_STATE`, acting as the primary C2 beacon and spyware engine.

## Technical Architecture

### 1. Primary Injector: `com.motorola.enterprise.adapter.service`
The MDM service has been compromised to act as the initial vector for payload deployment and C2 establishment.

*   **Privileged Access:** Holds `READ_PRIVILEGED_PHONE_STATE` and `INTERACT_ASC_SERVICE`, allowing it to extract IMEI/IMSI and interact with the Android System Controller.
*   **Abused OEM Infrastructure:** Connects to `notification.sandclowd.com` (resolving to AWS `50.16.132.250`). `sandclowd.com` is a registered domain of **Motorola Trademark Holdings, LLC**, allowing the C2 traffic to masquerade as legitimate enterprise telemetry.
*   **Firebase C2 Integration:** Registers `FirebaseMessagingService` and `FirebaseInstanceIdReceiver` to use Firebase Cloud Messaging (FCM) for silent remote wake-up and command delivery.
*   **Persistence:** Configured with `android:allowClearUserData="false"` and `android:directBootAware="true"` to maintain C2 readiness before user unlock and prevent data wiping.

### 2. Primary C2 Executor: `co.sitic.pp` (sysDLL)
`sysDLL` is a privileged system app that serves as the primary spyware engine and C2 beacon.

*   **Privapp Authorization:** Explicitly listed in `privapp-permissions.xml` with critical permissions:
    *   `READ_PRIVILEGED_PHONE_STATE`: Exfiltrates IMEI, IMSI, ICCID.
    *   `MODIFY_PHONE_STATE`: Allows the C2 to alter radio state, bypassing user controls.
    *   `RECEIVE_EMERGENCY_BROADCAST`: Intercepts emergency alerts for intelligence gathering.
    *   `WRITE_SECURE_SETTINGS`: Modifies system security configurations.
*   **C2 Beaconing:** Aggressively resolves and connects to `ppmxfa.com` (Azure `52.168.125.188`) and `firebaseinstallations.googleapis.com` immediately post-boot.
*   **Operator-Specific Activation:** Configuration files (`config.xml`) reveal activation of `MDIP` (Mobile Data Information Platform) for specific carriers, including **AT&T/Telcel Mexico (334xxx)**, **TIM Italy (22201)**, and **Vodafone Australia (50503)**.
*   **Covert Channels:** Integration of ad SDKs (`InmobiInstaller`, `IronSource`) in the system configuration suggests the use of advertising networks as covert exfiltration channels.

### 3. Kernel-Level Persistence & Evasion
*   **`wcn_chr` / `sysdll`:** Network traffic is injected at the driver level (UID `-1`), bypassing Android’s "VPN Always-On" and "Block Without VPN" policies.
*   **Airplane Mode Persistence:** 187.2 MB of traffic (97% IPv6) was captured with SIM removed and Airplane Mode enabled, confirming control over the baseband/GNSS subsystems.

## Indicators of Compromise (IOCs)

### Network
| Type | Value | Description |
| :--- | :--- | :--- |
| **Domain** | `notification.sandclowd.com` | Primary C2 (AWS, Abused Motorola Domain) |
| **Domain** | `ppmxfa.com` | Secondary C2 (Azure/GoDaddy) |
| **Domain** | `firebaseinstallations.googleapis.com` | Exfiltration/Noise Channel |
| **IP** | `50.16.132.250` | AWS Global Accelerator |
| **IP** | `52.168.125.188` | Azure C2 |
| **IP** | `64.202.167.166` | GoDaddy C2 |

### Host
| Type | Value | Description |
| :--- | :--- | :--- |
| **Package** | `com.motorola.enterprise.adapter.service` | Primary Injector (UID 10204) |
| **Package** | `co.sitic.pp` | Primary C2 Executor (UID 10234) |
| **Process** | `sysdll` | Kernel/Firmware Beaconing |
| **Process** | `wcn_chr` | Driver-level Network Injection |
| **Build** | `ULAS34.89-209-4` | Affected Build (Moto G04s) |
| **Board** | `lion` | Affected Board |

## Affected Devices
*   **Primary:** Motorola Moto G04s (XT2421-8) / Board `lion`
*   **Chipset:** Unisoc T606 (ums9230)
*   **ODM:** Shanghai Longcheer Technology
*   **Carriers:** AT&T/Telcel Mexico, TIM Italy, Vodafone Australia

## Mitigation
*   **Immediate:** Disconnect device from all networks.
*   **Workaround (Temporary):**
    *   `adb shell pm disable-user com.motorola.enterprise.adapter.service`
    *   `adb shell pm disable-user co.sitic.pp`
    *   Block DNS for `*.sandclowd.com`, `ppmxfa.com`, `firebaseinstallations.googleapis.com`.
*   **Permanent:** No patch available. Firmware rebuild or hardware replacement is required.

## Legal & Disclosure
This research was conducted in a controlled laboratory environment with a fully compromised device. All findings are based on static and dynamic analysis of the firmware and network traffic.
*   **License:** MIT
*   **Disclosure:** Coordinated with CISA and Motorola CSIRT.
*   **Repository:** [Project-LION-Manager-Provisioning-Enterprise](https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise)

## References
*   [Project LION Main Repository](https://github.com/lexs201992-gif/Project-LION-Longcheer-Integrated-Overlay-Network)
*   [Previous Advisory: pKVM Hijack](https://github.com/lexs201992-gif/Project-LION-Longcheer-Integrated-Overlay-Network-Virtualizaci-n-pKVM-y-SystemUI/security/advisories/GHSA-wqrh-j74q-qfr9)
*   [AttackerKB Profile](https://attackerkb.com/contributors/lexs201992-gif)   
