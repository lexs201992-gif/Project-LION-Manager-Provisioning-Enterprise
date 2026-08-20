# Firmware Evidence

This directory contains system configuration files extracted from the compromised device's `/system/` partition. These files are **factory-baked** and cannot be modified by the user or standard OTA updates without a full firmware rebuild.

## Directory Structure

| Directory | Path | Description |
| :--- | :--- | :--- |
| [`odm/`](./odm/) | `/system/vendor/odm` | ODM-specific configuration (TEE, VINTF, init scripts) |
| [`product/`](./product/) | `/system/product/etc` | Product partition (APN, roaming, build props) |
| [`vendor/`](./vendor/) | `/system/vendor/etc` | Vendor partition (HAL configurations, security) |

## Forensic Value

These files prove that the compromise is **not a user-installed app** but a **firmware-level modification** introduced during the ODM assembly process by Longcheer. Key indicators:

1. **`odm/`**: Contains TEE configuration (`sw_config.xml`), VINTF manifest with Unisoc security HALs (`ifaa`, `soter`, `tui`), and init scripts for `wcn_chr` (network injection driver).
2. **`product/`**: Contains APN configurations for **multi-national carrier support** (MCC/MNC for Telcel/AT&T, TIM, Vodafone), confirming the device is designed for **global deployment** with carrier-specific activation.
3. **`vendor/`**: Contains HAL configurations that bridge the kernel-level drivers to the Android framework.

## Legal Note

All files are extracted from the `/system` partition of a **personally owned device** (Serial: `ZL7324QT9R`, IFT Folio: `510100018869585201`). No user data, credentials, or third-party personal information is included.

---
*Author: Alexis Michel De La Cruz Correa (lexs201992-gif)*
*License: MIT*   
