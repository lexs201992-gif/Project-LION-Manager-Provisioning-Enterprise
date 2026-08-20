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

## 4. Historical Context & Geopolitical Risk Assessment
4.1. Evidence of a 20+ Year Network Management Architecture
The "Dialer/Splitter" and remote network management architecture documented in this advisory is not a recent anomaly but a systemic design pattern maintained by Longcheer for over two decades.

Linux Kernel & ModemManager Integration:
The official Linux kernel repository contains a device tree for the Longcheer L8150 board (arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts), proving Longcheer's deep integration into OEM hardware design for over a decade.
The ModemManager project includes a dedicated plugin (77-mm-longcheer-port-types.rules) for handling Longcheer modem ports. This confirms that Longcheer's "Dialer/Splitter" logic—where the device acts as a gateway managing multiple virtual network interfaces—has been a standard feature in their modem firmware since the early 2010s.
Carrier Lock/Unlock Opacity:
Forensic forums (e.g., Martview, DC-Unlocker) have documented persistent issues with Longcheer modem unlock procedures since 2010–2015. Reports of "credits deducted" but "unlock failed" indicate a server-side dependency for network management.
This historical reliance on remote servers for basic network state (lock/unlock) establishes the architectural foundation for the C2 infrastructure observed in the current compromise. The "Dialers" and "Splitters" are the same components used to manage carrier locks, now weaponized for exfiltration. 
4.2. Impact on Global Brands Assembled by Longcheer
Longcheer is a Tier-1 ODM for major global brands. The compromise of Longcheer's firmware pipeline implies a systemic risk to all devices assembled by the ODM, including:

Motorola (Lenovo): ~89% of Motorola's smartphone shipments are ODM-designed. The lion board (Moto G04s) is a direct product of this partnership. 
Nokia (HMD Global): ~88% of Nokia's shipments are ODM-designed. Longcheer is a primary supplier for Nokia's entry-level devices. 
Samsung: ~22% of Samsung's shipments are outsourced to ODMs, including Longcheer for specific regional markets. 
Xiaomi/OPPO/Vivo: Longcheer holds ~28% of the global ODM market share, serving as a primary design and assembly partner for these brands in emerging markets. 
Critical Implication: The use of sandclowd.com (a Motorola-owned domain) as a C2 channel suggests that the compromise may extend beyond Longcheer's own firmware to the OEM's proprietary services. If Longcheer's pipeline is compromised, it could potentially inject backdoors into the firmware of any brand they assemble, using that brand's own legitimate domains for C2.

4.3. The Dixon-Longcheer Joint Venture: A Critical Escalation
In March 2026, Dixon Technologies (India) and Longcheer Intelligence finalized a joint venture, Dixtel Infocomm (74% Dixon / 26% Longcheer), to manufacture smartphones, AI PCs, and automotive electronics in India. 

Strategic Context: The JV was approved by India's Ministry of Electronics and Information Technology (MeitY) under a policy allowing minority stakes from bordering countries for technology transfer. 
Security Risk Assessment:
Supply Chain Expansion: The JV will localize the production of Longcheer-designed devices in India. If the firmware compromise is embedded in Longcheer's design and manufacturing pipeline, it will be replicated in Indian-manufactured devices.
Geopolitical Implications: The presence of a compromised Chinese ODM in India's strategic electronics manufacturing hub raises significant national security concerns. The "Dialer/Splitter" architecture, which allows for remote network control and data exfiltration even in Airplane Mode, poses a direct threat to the integrity of India's digital infrastructure.
Recommendation: CISA, India's CERT-In, and the MeitY should conduct an immediate audit of the Dixtel Infocomm production line to verify the integrity of the firmware pipeline. The IOCs documented in this advisory should be used to scan all devices produced by the JV. 
Conclusion
The evidence presented in this advisory demonstrates that Longcheer's network management architecture, while historically used for carrier lock/unlock, has been weaponized into a persistent, multi-layered backdoor. The recent Dixon-Longcheer Joint Venture represents a critical escalation, as it brings this compromised ODM pipeline into India's strategic manufacturing sector. Immediate action is required to audit the JV's production line and mitigate the risk to global brands assembled by Longcheer. 

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
