# Laboratory Device Technical Sheet

## Identification

| Field | Value |
| :--- | :--- |
| **Model** | Motorola Moto G04s (**XT2421-7 PVT**) |
| **Board** | `lion` / `lion_g` |
| **Chipset** | Unisoc T606 (`ums9230`) |
| **Serial** | `ZL7324QT9R` |
| **IMEI** | [REDACTED – Lab Device] |
| **Hardware Version** | **PVT** (Prototype/Validation) |
| **Software Channel** | `amxmx` (América Móvil / Mexico) |
| **Carrier** | `oversea` |
| **Customer ID** | `global` |
| **Base Build** | `noah` |
| **Build ID** | `ULAS34.89-209-4` |
| **Build Date (Real)** | **Wed Mar 18 15:42:41 CST 2026** |
| **UI Security Patch (Falsified)** | April 5, 2026 |
| **Android Version** | 14 (SDK 34) – `odm_dlkm`: 13 (SDK 33) |
| **Kernel** | `5.15.178-android13-8-00006-g0c6055fd2d8b` |
| **Baseband** | `4G_MODEM_22B_W24.02.3_P17\|qogirl6_modem` |
| **WCN** | `WCN_TRUNK_22A_W25.14.1\|uww2631_qogirL6` |
| **Secure Boot State** | `1` (Orange/Unlocked) |
| **OEM Trusted Cert** | `27196E386B875E76ADF700E7EA84E4C6EEE33DFA` |
| **OEM Trusted Authority** | `com.sprd.android.USCPhotosProvider.providers.SpecialTypesProvider` |

## Chain of Custody

| Field | Value |
| :--- | :--- |
| **Owner** | Alexis Michel De La Cruz Correa |
| **Acquisition** | Legal purchase via **Radio Dipsa** (Telcel official distributor, Mexico) |
| **Invoice** | `radiomovil-dipsa-s.a.-de-c.v.` |
| **IFT Registration** | Folio `510100018869585201` (25-06-26) |
| **Acquisition Date** | October 30, 2025 |
| **Original Purpose** | Investigation of MITM attacks observed in a corporate hotel environment |

## Why This Device Has Forensic Value

### 1. PVT Unit in Retail Channel
This is a **Prototype/Validation (PVT)** unit that entered the retail channel via Radio Dipsa. PVT units are **not intended for public sale**. Its presence in the market confirms that the backdoor was **already present in the factory validation phase**, not injected post-production.

### 2. Systematic Deployment, Not an Error
The `software channel amxmx` and multi-national APN support (`334xxx`, `22201`, `50503`) indicate this is **not a random leak**. América Móvil (Telcel/Claro) operates in **22 countries** across LATAM, Central America, and Europe. The firmware is designed to:
- **Geo-locate the backdoor** at first boot via SystemUI and APE Setup Wizard.
- **Activate carrier-specific modules** based on MCC/MNC.
- **Report status** to C2 infrastructure (`ppmxfa.com`, `sandclowd.com`) upon network registration. 

### 3. LATAM Forensic Gap
Latin America **lacks specialized mobile forensic analysis organizations** capable of auditing ODM firmware at the kernel/BootROM level. The digital forensics market in the region (US$187.4M in 2024) is dominated by **computer forensics**, not mobile supply chain analysis. This gap means:
- No local authority can independently verify the firmware integrity of devices distributed by Telcel/Claro.
- The backdoor operates in a **jurisdictional blind spot** where no CERT or forensic lab can audit the ODM pipeline.
- The **APE Setup Wizard** and **SystemUI** geolocate the device at first boot, allowing the C2 to identify the region and activate the appropriate exfiltration channel. 

### 4. 20-Year ID+T Culmination
The PVT unit represents the **final stage** of a 20-year incremental development cycle:
- **2008-2009**: ModemManager integration (Linux).
- **2010-2015**: Carrier lock/unlock opacity (server-side dependency).
- **2016-2023**: ODM dominance (Motorola, Nokia, Samsung).
- **2024-2026**: Weaponization (CVE-2026-40003) + Dixon-Longcheer JV (India).

This device is the **physical proof** that the "spyware-as-a-service" architecture is now in **production** and distributed across LATAM via América Móvil.

---
*Author: Alexis Michel De La Cruz Correa (lexs201992-gif)*
*Date: August 20, 2026*
*License: MIT*   
