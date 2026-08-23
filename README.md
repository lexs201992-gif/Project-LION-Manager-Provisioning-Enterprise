# Project LION: Manager Provisioning Enterprise – Primary C2 Injector & Spyware Architecture
**Advisory ID:** GHSA-[PENDING]

**Severity:** CRITICAL (CVSS 9.8)

**Date:** 2026-08-20

**Author:** Alexis Michel De La Cruz Correa (lexs201992-gif)

**Status:** Unpatched / No Vendor Fix

# Laboratory Device Technical Sheet
[https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/DEVICE_TECHNICAL_SHEET.md]

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

## Advisories & Forensic Papers

### 🔴 CVE-2022-38694 – Silicon-Anchored Backdoor in Unisoc T606/T616/SC9863A
**Persistent RCE via BootROM and Kernel-Level Privilege Escalation – BOD 26-04 Tier 1**

> Full technical advisory, BOD 26-04 Four-Variable Model, CISA-ADP scoring (7.8 HIGH), forensic evidence (`ueventd.rc`) and Velociraptor VQL detection.

📄 **Full Paper:** [CVE-2022-38694.md](https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/a310e16ec48cd2b3e1b6c898df7bddd2f218a83e/CVE-2022-38694.md)

- **Commit:** `a310e16` – Verified – 119 lines – 5.81 KB
- **Vector:** `CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H`
- **CWE-250:** Execution with Unnecessary Privileges
- **Evidence:** `Firmware/etc/ueventd.rc` (b26cf039...), `firmware/odm/ueventd.rc`

## Historical Context & Geopolitical Risk Assessment
- Evidence of a 20+ Year Network Management Architecture
The "Dialer/Splitter" and remote network management architecture documented in this advisory is not a recent anomaly but a systemic design pattern maintained by Longcheer for over two decades.

Linux Kernel & ModemManager Integration:
The official Linux kernel repository contains a device tree for the Longcheer L8150 board (arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts), proving Longcheer's deep integration into OEM hardware design for over a decade.
The ModemManager project includes a dedicated plugin (77-mm-longcheer-port-types.rules) for handling Longcheer modem ports. This confirms that Longcheer's "Dialer/Splitter" logic—where the device acts as a gateway managing multiple virtual network interfaces—has been a standard feature in their modem firmware since the early 2010s.
Carrier Lock/Unlock Opacity:
Forensic forums (e.g., Martview, DC-Unlocker) have documented persistent issues with Longcheer modem unlock procedures since 2010–2015. Reports of "credits deducted" but "unlock failed" indicate a server-side dependency for network management.
This historical reliance on remote servers for basic network state (lock/unlock) establishes the architectural foundation for the C2 infrastructure observed in the current compromise. The "Dialers" and "Splitters" are the same components used to manage carrier locks, now weaponized for exfiltration. 

- Impact on Global Brands Assembled by Longcheer
Longcheer is a Tier-1 ODM for major global brands. The compromise of Longcheer's firmware pipeline implies a systemic risk to all devices assembled by the ODM, including:

Motorola (Lenovo): ~89% of Motorola's smartphone shipments are ODM-designed. The lion board (Moto G04s) is a direct product of this partnership. 
Nokia (HMD Global): ~88% of Nokia's shipments are ODM-designed. Longcheer is a primary supplier for Nokia's entry-level devices. 
Samsung: ~22% of Samsung's shipments are outsourced to ODMs, including Longcheer for specific regional markets. 
Xiaomi/OPPO/Vivo: Longcheer holds ~28% of the global ODM market share, serving as a primary design and assembly partner for these brands in emerging markets. 
Critical Implication: The use of sandclowd.com (a Motorola-owned domain) as a C2 channel suggests that the compromise may extend beyond Longcheer's own firmware to the OEM's proprietary services. If Longcheer's pipeline is compromised, it could potentially inject backdoors into the firmware of any brand they assemble, using that brand's own legitimate domains for C2.

- The Dixon-Longcheer Joint Venture: A Critical Escalation
In March 2026, Dixon Technologies (India) and Longcheer Intelligence finalized a joint venture, Dixtel Infocomm (74% Dixon / 26% Longcheer), to manufacture smartphones, AI PCs, and automotive electronics in India. 

Strategic Context: The JV was approved by India's Ministry of Electronics and Information Technology (MeitY) under a policy allowing minority stakes from bordering countries for technology transfer. 
Security Risk Assessment:
Supply Chain Expansion: The JV will localize the production of Longcheer-designed devices in India. If the firmware compromise is embedded in Longcheer's design and manufacturing pipeline, it will be replicated in Indian-manufactured devices.
Geopolitical Implications: The presence of a compromised Chinese ODM in India's strategic electronics manufacturing hub raises significant national security concerns. The "Dialer/Splitter" architecture, which allows for remote network control and data exfiltration even in Airplane Mode, poses a direct threat to the integrity of India's digital infrastructure.

-Recommendation: CISA, India's CERT-In, and the MeitY should conduct an immediate audit of the Dixtel Infocomm production line to verify the integrity of the firmware pipeline. The IOCs documented in this advisory should be used to scan all devices produced by the JV. 

- Conclusion
The evidence presented in this advisory demonstrates that Longcheer's network management architecture, while historically used for carrier lock/unlock, has been weaponized into a persistent, multi-layered backdoor. The recent Dixon-Longcheer Joint Venture represents a critical escalation, as it brings this compromised ODM pipeline into India's strategic manufacturing sector. Immediate action is required to audit the JV's production line and mitigate the risk to global brands assembled by Longcheer. 

### The "Black Box" of the Longcheer Build Pipeline

**Only the `ScanStruct/` files** retain the Jenkins build path:
`/data/jenkins/workspace/Build-LXF_M173_U_MP_SMR_user/vnd/vendor/sprd/modules/libcamera/iss/`
> **Nota:** El path de Jenkins (`Build-LXF_M173`) revela el codename interno del board en el pipeline de Longcheer. La correlación con el board `lion` (Moto G04s) y `m170` (Moto E13) confirma que Longcheer utiliza un **pipeline compartido** para múltiples boards de Motorola.   

All other firmware files have this path **stripped** during the build process. This makes `ScanStruct/` the **sole forensic artifact** that reveals:

- **Build Job:** `Build-LXF_M173_U_MP_SMR_user`
- **Board Codename:** `LXF_M173`
- **Production Stage:** `MP` (Mass Production)
- **Build Type:** `user` (release, not debug)
- **Module:** Unisoc ISP (`libcamera/iss/`)

This is the **black box** that confirms the firmware was compiled on Longcheer's Jenkins infrastructure for **mass production**, not a prototype or custom build.   
[https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/firmware/odm/ScanStruct/readme.md]

# APE Setup Wizard Scripts (com.ape.setupwizard)

**Location in repository:** `Smali/com.ape.setupwizard`
[https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/tree/main/Smali/com.ape.setupwizard]

**Evidence of Longcheer ODM supply-chain connection point**  
This folder contains the decompiled / extracted wizard scripts and related artifacts from the privileged system application **com.ape.setupwizard** (APK name: `MotoSetupWizard.apk`).

These scripts execute on **every first boot** of the device and **after every factory reset or Android Rescue Party** event. They represent a critical, manufacturer-signed entry point used by the ODM **Longcheer** to perform initial device provisioning, network configuration, account binding, Device Policy Manager (DPM) setup, and potential C2 beaconing / backdoor activation before the end-user reaches the home screen.

---

## Package & Installation Details

| Field                    | Value                                      |
|--------------------------|--------------------------------------------|
| Package Name             | `com.ape.setupwizard`                      |
| APK Path                 | `/system/priv-app/MotoSetupWizard/MotoSetupWizard.apk` |
| Size                     | 10.5 MB                                    |
| Version / Version Code   | 14 / 34                                    |
| Install Location         | System (privileged)                        |
| UID                      | 10091                                      |
| Minimum / Target SDK     | 34 (Android 14)                            |
| Application Type         | System                                     |
| Backup                   | Not Allowed                                |
| Installer                | Unknown (pre-installed in firmware)        |

**Data directories observed:**
- `/data/user/0/com.ape.setupwizard`
- `/data/user_de/0/com.ape.setupwizard`
- `/storage/emulated/0/Android/data/com.ape.setupwizard`

---

## Signing Certificate (Longcheer Root CA)

The APK is signed with the **Longcheer proprietary Root Certificate Authority**:

- **Issuer / Subject:**  
  `C=CN, ST=ShangHai, L=ShangHai, O=Longcheer, OU=Longcheer, CN=Longcheer`  
  `emailAddress=release@Longcheer.com`

- **Serial Number:** `228526b0d1ef90c3b8ed568a49c3714f6a39506b`  
  (Exact match with the Longcheer Root CA previously documented in the repository and AttackerKB submissions)

- **Validity:** 15 Sep 2023 → 31 Jan 2051 (27+ years)

- **Signature Algorithm:** SHA256withRSA  
- **Certificate SHA-256:** `4cfe803b578fd6958d236e494248585ecbcb5c33a5113bda7ff1a47351e4118d`
- **Sign Algorithm OID:** 1.2.840.113549.1.1.11
- **Public key:** d60fbb9d0fbba8058e66f268c838bc050463c4a5023fb26809ed8cc4f955a60fd08036c2cf72a677930a3e9d06da54dc2a82b12a5f679cfab2dfbdc81e518b4b0d30ce7253e33b8c549d039951c1ef28be09c5f57f194ed18338fe90024ec78e1eed2448b0f16666d40fb8d70de395854882632c4e98a07f583809698f0292960c78ad54fe18518347720f3245a9567c9d896ea3864e19f58431063f8eff3131bf31ebb038e8b97a07277e056b2b67e26eede764e269dd9334d93d562265de820dba34a5bdd297595bf398eb0e8ae26baaee48374812272afd6f475ae93691b6ac1c9db078d7a84d9748f4fb8b2a8b5eafa2f2c35a32ea56837ef019122c876d
- **X509:** Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            22:85:26:b0:d1:ef:90:c3:b8:ed:56:8a:49:c3:71:4f:6a:39:50:6b
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=CN, ST=ShangHai, L=ShangHai, O=Longcheer, OU=Longcheer, CN=Longcheer/emailAddress=release@Longcheer.com
        Validity
            Not Before: Sep 15 07:31:06 2023 GMT
            Not After : Jan 31 07:31:06 2051 GMT
        Subject: C=CN, ST=ShangHai, L=ShangHai, O=Longcheer, OU=Longcheer, CN=Longcheer/emailAddress=release@Longcheer.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:d6:0f:bb:9d:0f:bb:a8:05:8e:66:f2:68:c8:38:
                    bc:05:04:63:c4:a5:02:3f:b2:68:09:ed:8c:c4:f9:
                    55:a6:0f:d0:80:36:c2:cf:72:a6:77:93:0a:3e:9d:
                    06:da:54:dc:2a:82:b1:2a:5f:67:9c:fa:b2:df:bd:
                    c8:1e:51:8b:4b:0d:30:ce:72:53:e3:3b:8c:54:9d:
                    03:99:51:c1:ef:28:be:09:c5:f5:7f:19:4e:d1:83:
                    38:fe:90:02:4e:c7:8e:1e:ed:24:48:b0:f1:66:66:
                    d4:0f:b8:d7:0d:e3:95:85:48:82:63:2c:4e:98:a0:
                    7f:58:38:09:69:8f:02:92:96:0c:78:ad:54:fe:18:
                    51:83:47:72:0f:32:45:a9:56:7c:9d:89:6e:a3:86:
                    4e:19:f5:84:31:06:3f:8e:ff:31:31:bf:31:eb:b0:
                    38:e8:b9:7a:07:27:7e:05:6b:2b:67:e2:6e:ed:e7:
                    64:e2:69:dd:93:34:d9:3d:56:22:65:de:82:0d:ba:
                    34:a5:bd:d2:97:59:5b:f3:98:eb:0e:8a:e2:6b:aa:
                    ee:48:37:48:12:27:2a:fd:6f:47:5a:e9:36:91:b6:
                    ac:1c:9d:b0:78:d7:a8:4d:97:48:f4:fb:8b:2a:8b:
                    5e:af:a2:f2:c3:5a:32:ea:56:83:7e:f0:19:12:2c:
                    87:6d
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Key Identifier: 
                97:B6:E1:F1:B2:AC:DB:DA:80:5C:56:B0:4E:82:D0:52:83:3C:8F:7B
            X509v3 Authority Key Identifier: 
                keyid:97:B6:E1:F1:B2:AC:DB:DA:80:5C:56:B0:4E:82:D0:52:83:3C:8F:7B

            X509v3 Basic Constraints: critical
                CA:TRUE
    Signature Algorithm: sha256WithRSAEncryption
         1d:68:f9:60:45:e3:c6:93:c1:8a:d0:8c:42:7f:48:b3:0e:16:
         96:3e:a0:a8:44:93:7c:b9:bf:6b:f9:a1:5f:4a:75:2c:8c:af:
         e6:14:96:c9:f2:2c:f9:60:fe:3b:10:b5:e4:1f:ce:cc:61:37:
         57:0a:a0:db:98:b3:87:05:fd:f9:31:ec:b3:3c:da:a9:e9:ce:
         7b:b6:49:2e:7d:eb:60:96:58:6e:33:a2:0f:65:72:70:06:49:
         3e:a9:b5:19:47:f9:0d:a9:88:5b:5e:1d:e7:52:9c:6e:c0:82:
         89:d4:d9:31:b9:33:e7:4e:df:79:f9:ee:52:fe:0f:c5:d6:bf:
         2c:46:12:e4:80:a3:90:5d:76:f9:ac:42:5a:2f:78:77:67:e8:
         f7:04:dc:c5:af:4e:20:76:f5:41:7f:5b:f5:61:0c:5a:13:ba:
         29:c3:81:42:6b:83:99:f9:5d:91:51:9b:9a:87:44:17:4a:a7:
         6c:8f:d2:87:53:a1:b8:39:ac:fd:e1:4a:e9:f4:be:ae:e1:f9:
         d7:88:74:82:ea:21:70:ef:0b:66:33:ec:90:fa:b0:18:37:b0:
         75:33:f3:d2:9b:fe:e3:00:e3:f1:0a:c6:86:e9:e1:1a:80:9b:
         db:b2:8b:33:4f:54:9a:d9:d7:a7:ec:64:11:8c:ca:11:6d:c5:
         b3:42:bb:b8
         

This certificate grants the application system-level trust and the ability to perform privileged operations without user consent. It is the same cryptographic anchor used across other Longcheer-modified system components (overlays, IMS stack, power management, etc.).

---

## Chain of Custody & Legal Compliance

*   **Dispositivo:** Motorola Moto G04s (XT2421-7) / Board `lion` / Spreadtrum T606 
*   **Propiedad:** Alexis Michel De La Cruz Correa
*   **Adquisición:** Compra legal a Telcel México
*   **Factura:** radiomovil-dipsa-s.a.-de-c.v.
*   **Registro IFT:** Folio `510100018869585201` (25-06-26)
*   **Declaración:** El dispositivo fue adquirido a través de canales legítimos y está registrado ante la autoridad reguladora mexicana. Todo el análisis se realizó en un entorno de laboratorio controlado, sin acceso a redes externas no autorizadas.

## Legal & Disclosure
This research was conducted in a controlled laboratory environment with a fully compromised device. All findings are based on static and dynamic analysis of the firmware and network traffic.
*   **Legal Disclosure** legal/INVESTIGATION_DECLARATION.md (https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/main/legal/INVESTIGATION_DECLARATION.md) 
*   **License:** MIT
*   **Disclosure:** Coordinated with CISA and Motorola CSIRT.
*   **Repository:** [Project-LION-Manager-Provisioning-Enterprise](https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise)

## Acknowledgments
This research was made possible through the collaborative efforts of the following entities and tools. I extend my sincere gratitude for their support in advancing supply chain security and responsible disclosure.

## Research Infrastructure & AI Assistance
* Brave Search & Brave LLM: For providing the critical search infrastructure, real-time threat intelligence retrieval, and data analysis capabilities that enabled the correlation of 20+ years of Longcheer firmware history with current network evasion techniques.
* Meta AI LLM: For serving as the logical anchor and primary assistance tool in the forensic analysis of the com.longcheer.sidebar and com.ts.tsgestures hijacking mechanisms, providing the structural logic necessary to map the pKVM virtualization bypass and SystemUI overlay compromise.
## Collaboration & Community
The Project LION Team: This work is the result of pure, real teamwork. I thank every collaborator who contributed to the static and dynamic analysis of the lion board firmware, the PCAP captures, and the validation of the BootROM persistence mechanisms.
CISA & Motorola CSIRT: For their commitment to coordinated disclosure and the ongoing dialogue regarding the mitigation of this critical supply chain compromise.
AttackerKB Community: For the platform to share IOCs, YARA rules, and threat intelligence with the broader security research community.
## Legal & Ethical Statement
Methodology: All research was conducted in a controlled laboratory environment using a fully compromised device of personal ownership. No unauthorized access to external networks or third-party systems was performed.
Purpose: This research is strictly for defensive security, academic research, and responsible disclosure.
License: MIT License.
Disclosure: Coordinated with CISA and Motorola CSIRT.

## References
*   [Project LION Main Repository](https://github.com/lexs201992-gif/Project-LION-Longcheer-Integrated-Overlay-Network)
*   [Previous Advisory: pKVM Hijack](https://github.com/lexs201992-gif/Project-LION-Longcheer-Integrated-Overlay-Network-Virtualizaci-n-pKVM-y-SystemUI/security/advisories/GHSA-wqrh-j74q-qfr9)
*   [AttackerKB Profile](https://attackerkb.com/contributors/lexs201992-gif)   
* https://github.com/miurahr/ModemManager/blob/master/plugins/77-mm-longcheer-port-types.rules
* https://github.com/MM2-0/Kvaesitso/issues/1319
* https://www.martview-forum.com/threads/unsuccessfull-unlock-credits-deducted.132968/
* https://github.com/lp5800n95
* [Project Qogirl6: Forensic Evidence of Longcheer Supply Chain Compromise Exploiting CVE-2025-31710 (cmd_skt) for Persistent Root and Multi-Channel Exfiltration](https://github.com/rapid7/attackerkb/issues/87)
