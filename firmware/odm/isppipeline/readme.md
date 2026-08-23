# /system/vendor/odm/etc/isppipeline

**Path:** `/system/vendor/odm/etc/isppipeline/`
**Device:** lion / Moto G04s / Unisoc T606/T616
**ODM:** Unisoc (Shanghai) Technologies Co., Ltd.
**License:** `LicenseRef-Unisoc-General-1.0` (2022-2023)
**Project LION Evidence - Component: ODM Camera ISP Pipeline**

## Content:

- `Pipeline_Linkage.json` (527 lines, 12.5 KB)
- `props.xml` (57 lines, 2.54 KB)
- `Path.md`

## 1. Description

ISP (Image Signal Processor) Pipeline configuration for Unisoc platform. Defines the hardware-accelerated image processing chain from RAW sensor data to final YUV/JPG output.

This is ODM-level vendor configuration located in `/system/vendor/odm/etc/` - loaded by `android.hardware.camera.provider@2.x-service` at boot. It controls how every photo/video frame is processed on the device.

## 2. Technical Analysis

### A) `props.xml` - Runtime Debug / Bypass Interface

Defines 4 capture groups, each with controllable `persist.vendor` properties:

- **Groups:** `Capture`, `Preview`, `UltraRes (valid="0,1")`, `NightPro`
- **Key Properties:**


**Security Relevance:** `afl.bypass` and `iss.enable` allow bypassing auto-focus logic and ISP security checks via `setprop`. Can be used to force RAW dump (`jpg` mode with `dump=1`) - privacy sensitive.

### B) `Pipeline_Linkage.json` - ISP Block Chain

**Header:**
- `DataLicense: LicenseRef-Unisoc-General-1.0`
- `DataCopyright: 2022-2023 Unisoc (Shanghai) Technologies Co., Ltd.`
- `name: Pipeline_Linkage`

**Blocks (RAW domain -> YUV domain):**

| Name | Id | Field | Fix | BypassProp |
| :--- | :--- | :--- | :--- | :--- |
| BLC | 0x4002 | raw | 0 | persist.vendor.cam.pm.blc.bypass |
| RGB_GAIN | 0x4007 | raw | 0 | rgb_gain.bypass |
| AWB | 0x4032 | raw | 1 | awb.bypass |
| PPE | 0x5073 | raw | 0 | ppe.bypass |
| ALSC | 0x402F | raw | 1 | null |
| BPC | 0x5054 | raw | 0 | bpc.bypass |
| BNR | 0x506F | raw | 0 | nlm.bypass |
| IMBALANCE | 0x506E | raw | 0 | imblance.bypass |
| GTM_MAPPING | 0x509C | raw | 0 | gtm.bypass |
| YUV_PRECDN | 0x505D | yuv | 0 | pre_cdn.bypass |
| YNR | 0x5060 | yuv | 0 | ynr.bypass |
| EE | 0x5061 | yuv | 0 | edge.bypass |
| Y_GAMMC | 0x5075 | yuv | 0 | ygamma.bypass |
| UV_CDN | 0x505E | yuv | 0 | uv_cdn.bypass |
| UV_POSTCDN | 0x505F | yuv | 0 | uv_postcdn.bypass |

**Linkage (Processing Order):**


This shows the full hardware pipeline is software-bypassable per block via `persist.vendor.cam.pm.*.bypass` - every denoising, color correction, and sharpness stage can be disabled.

### C) Role in Project LION Supply-Chain

1.  **ODM Config Persistence:** File in `vendor/odm` survives factory reset, signed as part of Unisoc vendor image. Not updated via Play Store.
2.  **Debug Surface Left in Production:** `props.xml` enables `icap.dump=1` and `raw.mode=jpg` with sensor RAW dump disabled (`sensor.raw.enable=0`) but YUV dump enabled - typical for ODM debugging, should be disabled in user builds (`ro.debuggable=0` bypass check fails).
3.  **Bypassable ISP:** 15+ ISP blocks can be bypassed at runtime without root via `persist` props if `vendor.cam` selinux domain is permissive (observed in `lion` sepolicy). This allows forced downgrade of image quality / bypass of anti-tamper.

**Not malicious by itself, but evidence of Unisoc ODM debug pipeline shipped in production Moto G04s firmware, expanding attack surface.**

## 3. IOCs

- Path: `/system/vendor/odm/etc/isppipeline/`

- Path: /system/vendor/odm/etc/isppipeline/Pipeline_Linkage.json
- MD5:63c4f4cc0421c6bef40232533dcd85d2
- SHA-1: c01d089ca6969aacfa8fdec51fc89ed80ff0f2ab
- SHA-256: 4a4d48488983e8d60fb4645634d69d645a715738317827166217f8854cdc8fdc

- Path: /system/vendor/odm/etc/isppipeline/props.xml
- MD5: 556ac8e02b11302400443628764ed094
- SHA-1: 1fab8810149c19d8ddc4d07e712e2854cfe81398
- SHA-256: e1a09801dd1b45af4ee3156a533ba8cbbf8539a662c856087db1ad31963d8927 

- Props: `persist.vendor.cam.pm.*.bypass`, `persist.vendor.cam.iss.enable`
- License String: `LicenseRef-Unisoc-General-1.0`

## 4. Mitigation / Hardening

```sh
# Disable ISP debug dumps
setprop persist.vendor.cam.icap.dump 0
setprop persist.vendor.cam.icap.dump.jpeg.enable 0
setprop persist.vendor.cam.iss.enable 0

# Block bypass (requires root)
for prop in $(getprop | grep pm.*bypass); do setprop $prop 0; done
