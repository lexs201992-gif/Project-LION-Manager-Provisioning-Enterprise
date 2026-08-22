# APE Setup Wizard Scripts (com.ape.setupwizard)

**Location in repository:** `Smali/apesetupwizard/scripts/`

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

## Wizard Scripts Contained in This Folder

The following raw XML scripts control the entire first-boot and post-reset flow. They are executed sequentially by the Setup Wizard:

- `wizard_script.xml` (main entry)
- `wizard_script_account_flow.xml`
- `wizard_script_common_biometric_screen_lock_flow.xml`
- `wizard_script_common_flow.xml`
- `wizard_script_common_personalization_flow.xml`
- `wizard_script_connect_and_update_flow.xml`
- `wizard_script_deferred.xml`
- `wizard_script_finish_cloud_restore_flow.xml`
- `wizard_script_moto_demo_mode_flow.xml`
- `wizard_script_nfc_provision_flow.xml`
- `wizard_script_no_account_flow.xml`
- `wizard_script_no_network_flow.xml`
- `wizard_script_post_account_flow.xml`
- `wizard_script_post_dpm_provision_finalization_flow.xml`
- `wizard_script_post_dpm_user_flow.xml`
- `wizard_script_post_managed_provisioning.xml`
- (and additional related resources)

These scripts handle:
- Network connectivity & OTA update checks
- Google / carrier account binding
- Biometric & screen-lock enrollment
- NFC provisioning
- Device Policy Manager (DPM) / managed provisioning (enterprise / MDM)
- Cloud restore finalization
- Demo-mode activation
- Deferred actions after the user completes the wizard

Because the application runs as a **privileged system app** with permissions including:

- `ACCESS_COARSE_LOCATION` / `ACCESS_FINE_LOCATION`
- `ACCESS_NETWORK_STATE` / `ACCESS_WIFI_STATE` / `CHANGE_WIFI_STATE`
- `CHANGE_NETWORK_STATE` / `CHANGE_CONFIGURATION`
- `BIND_DEVICE_ADMIN`
- `FOREGROUND_SERVICE` / `FOREGROUND_SERVICE_DATA_SYNC`
- `CHANGE_OVERLAY_PACKAGES`

…it has the capability to establish network connections, modify system settings, and interact with other Longcheer / Unisoc components **before** the user can install any security tools or inspect the device.

---

## Role in the Supply-Chain Compromise

1. **First-boot / Post-Rescue-Party Trigger**  
   Android’s Rescue Party and factory-reset mechanisms force a clean start. This wizard is one of the first privileged processes that runs, giving Longcheer a reliable, repeatable execution window.

2. **Provisioning Hook**  
   The scripts can trigger silent installation or activation of other system packages (e.g., `com.motorola.enterprise.adapter.service`, `co.sitic.pp`, overlays, IMS components) and establish initial C2 channels.

3. **Persistence Across Wipes**  
   Because the APK resides in `/system/priv-app/` and is signed by the Longcheer Root CA embedded in the firmware, it survives factory resets and is re-executed after every Rescue Party event.

4. **Living-off-the-Land**  
   The component appears as a legitimate Motorola Setup Wizard, yet its signing certificate and internal package name (`com.ape.setupwizard`) reveal the true ODM origin (Longcheer).

---

## How to Use the Files in This Folder

- The XML scripts can be analyzed statically to map the exact control flow.
- Cross-reference method calls and resource IDs with the full Smali decompilation of `MotoSetupWizard.apk`.
- Correlate network-related actions inside the scripts with the C2 domains / WireGuard tunnels documented elsewhere in the repository.
- Use the certificate serial and package name as high-confidence IOCs in YARA rules and Suricata signatures.

---

## Related Repository Sections

- Certificate analysis and Longcheer Root CA details  
- Rescue Party / Kernel Panic anti-forensic mechanisms  
- Other system packages signed by the same CA (`com.spreadtrum.*`, overlays, etc.)  
- Network captures and C2 indicators from first-boot sessions  

---

**Status:** Active evidence – uploaded and version-controlled as part of the ongoing Longcheer / Unisoc T606-T616 supply-chain investigation (Project LION).

**Author:** Alex de la Cruz (lexs201992-gif)  
**Last updated:** 2026-08-22
