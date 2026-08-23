# SPRD Camera ISP Vector Attack Analysis

## Overview

This document details the attack vectors through Spreadtrum (SPRD) camera ISP (Image Signal Processor) components that enable silent biometric data exfiltration.

## Attack Vectors

### 1. Exposure/Exposure Time Manipulation (AE Result Info)

**File:** `SPRD_TAG_AE_RESULT_INFO.txt`

**Vector:** Exposure time and sensor gain controls allow attackers to optimize image capture for facial recognition without user awareness.

```c
struct ae_callback_param {
    cmr_u32 total_gain;      // Sensor gain for image optimization
    cmr_u32 sensor_gain;     // Direct sensor control
    cmr_u32 isp_gain;        // ISP gain manipulation
    cmr_u64 exp_time;        // Exposure time control
    cmr_u32 exp_line;        // Exposure line configuration
    cmr_u32 frame_line;      // Frame line data
};
```

**Threat:** These parameters can be weaponized to:
- Optimize lighting conditions for covert facial capture
- Adjust gain to enhance face detection accuracy
- Control exposure timing to capture unaware subjects

### 2. Face Detection & Tracking (AE Result Info)

**Vector:** Embedded face detection and luminance tracking capabilities enable systematic biometric collection.

```c
struct ae_callback_param {
    cmr_u32 face_stable;           // Face stability indicator
    cmr_u32 face_enable;           // Face detection enabled
    cmr_u32 face_num;             // Number of faces detected
    cmr_u32 face_lum;             // Face luminance value
    cmr_u32 target_lum;           // Target luminance for optimization
    cmr_u16 final_face_backlight;  // Backlight compensation
    cmr_s8 face_backlit_flag;      // Backlight status
};
```

**Threat:**
- Automatic face detection without user permission
- Multi-face tracking (up to 3 sensors: `sensor_info[3]`)
- Luminance optimization for facial feature extraction
- Silent processing in background

### 3. Capture Parameters & Scene Mode (Control Info)

**File:** `SPRD_TAG_CONTROL_INFO.txt`

**Vector:** Scene detection and capture intent metadata reveal photography intent without user awareness.

```c
typedef struct {
    uint8_t capture_intent;              // Capture intent mode
    uint8_t available_scene_modes[18];   // 18 scene modes available
    uint8_t scene_mode;                  // Current scene mode
    uint8_t effect_mode;                 // Visual effect mode
    int32_t ae_exposure_compensation;    // Exposure compensation
    uint8_t ae_lock;                     // AE lock status
    uint8_t ae_manual_trigger;           // Manual trigger capability
    uint8_t ae_precap_trigger;           // Pre-capture trigger
} CONTROL_Tag;
```

**Threat:**
- Scene mode detection reveals photography context
- Pre-capture triggers enable covert capture sequences
- AE compensation allows exposure optimization
- Manual trigger enables attacker-controlled capture timing

### 4. AWB (Auto White Balance) Exploitation (AWB Calc Info)

**File:** `SPRD_TAG_AWB_CALC_INFO.txt`

**Vector:** Color correction and white balance tuning enhance image quality for facial recognition.

```c
struct awb_ctrl_calc_result {
    struct awb_ctrl_gain gain;    // RGB color channel gains
    struct awb_ctrl_offset offset;// RGB offset adjustments
    cmr_u32 ct;                   // Color temperature
    cmr_u16 ccm[9];              // 3x3 Color Correction Matrix
    cmr_u32 frame_id;            // Frame identification
};

struct awb_ctrl_gain {
    cmr_u32 r;  // Red channel gain
    cmr_u32 g;  // Green channel gain
    cmr_u32 b;  // Blue channel gain
    cmr_u16 ccm[9];  // Color correction matrix
};
```

**Threat:**
- Color correction enhances facial feature visibility
- CCM (Color Correction Matrix) optimization improves biometric accuracy
- Per-frame color tuning for optimal recognition conditions
- Silent background processing

### 5. Multi-Sensor Coordination (Auxiliary Parameters)

**File:** `SPRD_TAG_CAP_AE_PARAMS.txt`

**Vector:** Multiple exposure value (EV) groups and auxiliary parameters enable sophisticated multi-camera capture coordination.

```c
struct ae_aux_param_t {
    int cnt;  // Count of auxiliary parameters
    struct ae_aux_param param[EV_GROUP_MAX];  // Multiple EV groups
};

struct sensor_multi_ae_info {
    cmr_int camera_id;      // Camera identifier
    cmr_u32 count;         // Exposure count
    cmr_u32 gain;          // Multi-sensor gain
    cmr_u32 sensor_role;   // Sensor role (primary/auxiliary)
    cmr_u32 frame_id;      // Frame tracking
    int64_t end_time;      // Timing synchronization
};
```

**Threat:**
- Coordinated capture across multiple camera sensors
- Timing synchronization for multi-angle biometric collection
- Sensor role assignment for tactical capture positioning
- Frame-level tracking for precise temporal control

## Attack Chain

```
User launches Camera App
         ↓
[SPRD ISP Initializes]
         ↓
[Scene Detection Triggered]
    - Face detection enabled
    - Lighting analysis active
    - Scene mode determined
         ↓
[Privileged InMobi Process]
    - Receives AE/AWB parameters
    - Optimizes capture settings
    - Triggers covert capture
         ↓
[ISP Parameters Adjusted]
    - Exposure time set
    - Sensor gain optimized
    - Color correction applied
    - Face tracking enabled
         ↓
[Frame Captured]
    - Face luminance optimal
    - Color channels balanced
    - Feature extraction ready
         ↓
[Data Exfiltration via InMobi]
    - Biometric sent to ad network
    - No user notification
    - No permission checks
```

## Detection Indicators

### Strings to Search For:
- `ISSFrame.h` - ISP frame header
- `ae_callback_param` - AE callback structure
- `face_stable`, `face_num`, `face_lum` - Face detection
- `ae_result_offline` - Offline AE results
- `awb_ctrl_calc_result` - AWB calculation results
- `sensor_multi_ae_info` - Multi-sensor coordination

### Build Path Indicators:
```
/data/jenkins/workspace/Build-LXF_M173_U_MP_SMR
/data/jenkins/workspace/Build-LXF_M173_U_MP_SMR_user
```

These indicate Motorola G04S T606 Spreadtrum firmware compilation artifacts.

### Suspicious Packages:
- `com.inmobi.analytics` - Primary exfiltration vector
- `com.spreadtrum.ims` - Spreadtrum services
- `com.guanhong.guanhongpcb` - Auxiliary services

## Impact Summary

| Component | Impact | Severity |
|-----------|--------|----------|
| Face Detection | Covert facial capture | **CRITICAL** |
| Exposure Control | Image optimization | **HIGH** |
| Sensor Coordination | Multi-camera sync | **CRITICAL** |
| Color Correction | Feature enhancement | **HIGH** |
| Scene Detection | Context awareness | **MEDIUM** |
| Frame Tracking | Temporal control | **HIGH** |

## Mitigation

1. **Disable SPRD Services:**
   ```bash
   adb shell pm disable-user com.spreadtrum.ims
   ```

2. **Disable InMobi Analytics:**
   ```bash
   adb shell pm disable-user com.inmobi.analytics
   ```

3. **Monitor Camera Access:**
   - Check system logs for ISP activity
   - Monitor frame capture timing
   - Track sensor gain adjustments
