# SPRD Advanced Attack Vectors: Lens Shading, PDAF & Scene Analysis

## Overview

This document details advanced and dangerous attack vectors through Spreadtrum ISP components that enable sophisticated biometric exfiltration, lens distortion manipulation, and covert multi-modal capture.

---

## Attack Vector 1: Lens Shading Corruption (LSC)

**File:** `SPRD_TAG_LSC4_RESULT_INFO.txt`

### Technical Details

Lens Shading Correction (LSC) compensates for lens vignetting and color falloff. Corrupting LSC tables enables attackers to:

```c
struct alsc_update_weight_table_out {
    struct dcam_dev_lsc_info_stru lsc_info;      // Primary LSC table
    struct dcam_dev_lsc_info_stru lsc_info1080;  // 1080p LSC table
    uint32_t frame_id;                           // Frame tracking
    struct lsc_sensor_setting_param sensor_setting;
};

struct dcam_dev_lsc_info_stru {
    uint32_t update_flag;      // LSC update trigger
    uint32_t bypass;           // Bypass LSC processing
    uint32_t grid_width;       // Vignetting grid width
    uint32_t grid_x_num;       // X-axis grid divisions
    uint32_t grid_y_num;       // Y-axis grid divisions
    uint32_t grid_num_t;       // Total grid count
    uint64_t grid_tab_addr;    // Grid table memory address
    uint64_t weight_tab_addr;  // Weight table address
    uint64_t weight_tab_addr_x;// X-axis weight address
    uint64_t weight_tab_addr_y;// Y-axis weight address
};
```

### Attack Methods

#### 1. **Selective Vignetting Injection**
- Corrupt `grid_tab_addr` to inject malicious vignetting patterns
- Create facial recognition-optimized lighting
- Enhance contrast in face regions while darkening surroundings
- Enable covert facial capture in low-light conditions

#### 2. **Lens Distortion Exploitation**
- Manipulate `weight_tab_addr_x` and `weight_tab_addr_y`
- Apply uneven lens distortion to create tracking patterns
- Encode metadata in distortion patterns
- Enable frame-by-frame biometric encoding

#### 3. **Resolution-Specific LSC Manipulation**
```c
struct lsc_sensor_setting_param {
    unsigned int full_image_width;   // Full resolution width
    unsigned int full_image_height;  // Full resolution height
    unsigned int binning;            // Pixel binning (N=1,2,3...)
    unsigned int crop;               // Crop flag (1=crop, 0=no crop)
    unsigned int crop_start_col;     // Crop column start
    unsigned int crop_start_row;     // Crop row start
};
```

- Apply different LSC tables for 1080p vs full resolution
- Optimize facial capture at specific resolutions
- Covert high-res capture while displaying low-res preview
- Enable multi-resolution capture coordination

### Attack Impact

| Attack | Impact | Detectability |
|--------|--------|---------------|
| Grid corruption | Uneven image lighting | **Medium** |
| Weight table injection | Facial recognition optimization | **Low** |
| Resolution switching | Multi-mode capture | **Low** |
| Distortion encoding | Biometric tagging | **Very Low** |

---

## Attack Vector 2: Phase Detection Autofocus (PDAF) Hijacking

**File:** `SPRD_TAG_PDAF_TYPE2_RAW_INFO.txt`

### Technical Details

PDAF enables rapid autofocus by analyzing phase information from dedicated pixels. Hijacking PDAF enables:

```c
struct pdaf_buffer_handle {
    void *left_buffer;          // Left eye phase data
    void *right_buffer;         // Right eye phase data
    void *left_output;          // Left processed output
    void *right_output;         // Right processed output
    struct sensor_pdaf_roi_param roi_param;  // Region of interest
    cmr_int roi_pixel_numb;     // ROI pixel count
    cmr_s32 frameid;            // Frame identifier
    cmr_u32 camera_id;          // Camera identifier
    cmr_u32 roi_width;          // ROI width
    cmr_u32 roi_height;         // ROI height
};

struct sensor_pdaf_roi_param {
    cmr_u32 roi_start_x;        // ROI top-left X
    cmr_u32 roi_start_y;        // ROI top-left Y
    cmr_u32 roi_area_width;     // ROI width
    cmr_u32 roi_area_height;    // ROI height
};
```

### Attack Methods

#### 1. **PDAF ROI Targeting**
- Manipulate `roi_start_x`, `roi_start_y` to target face regions
- Force continuous autofocus on facial features
- Capture fine facial detail in rapid succession
- Enable facial geometry extraction

#### 2. **Stereo Phase Manipulation**
- Corrupt `left_buffer` and `right_buffer` independently
- Create stereo depth information for 3D facial mapping
- Extract facial contours and topology
- Enable liveness detection bypass (stereo spoofing)

#### 3. **Frame-Level Focus Tracking**
```c
// Rapid autofocus sequence
for (cmr_s32 frameid = 0; frameid < sequence_length; frameid++) {
    // Each frame focuses on different facial feature
    // Frame 0: Eyes
    // Frame 1: Nose
    // Frame 2: Mouth
    // Frame 3: Face outline
    // Result: Complete 3D facial model
}
```

- Sequence PDAF focus points to scan facial features
- Build 3D facial model across multiple frames
- Enable face spoofing and recognition attacks

### Attack Signature

```c
// Suspicious PDAF pattern
if (roi_param.roi_height > image_height * 0.5) {
    // Focus locked on face region
    // Multiple rapid refocus cycles detected
    // Framerate consistent with biometric extraction
    ALERT("Possible PDAF hijacking for face geometry extraction");
}
```

---

## Attack Vector 3: Scene Detection Exploitation

**File:** `SPRD_TAG_SCENE_DETECT_OUT.txt`

### Technical Details

Scene detection analyzes image content to determine optimal processing. Weaponizing scene detection enables:

```c
typedef struct {
    uint32_t postproc_type;                 // Post-processing mode
    float ev[MAX_CAP_NUM];                  // Exposure values
    int total_num;                          // Total frames
    int normal_num;                         // Normal mode frames
    sprd_hdr_detect_out_t hdr_detect_out;  // HDR detection
    sprd_raw_mfnr_detect_out_t raw_mfnr_detect_out;  // Multi-frame NR
    xdr_detect_out_param_t xdr_detect_out; // XDR (extended dynamic range)
    int motion_detect;                      // Motion detection flag
    int is_flash_scene;                     // Flash scene detected
    int is_hdr_scene;                       // HDR scene detected
    int is_mfnr_scene;                      // Multi-frame NR scene
    int is_xdr_scene;                       // XDR scene detected
    int is_filter_scene;                    // Filter scene detected
    int is_thumb_zsl_frame;                 // ZSL thumbnail frame
    int is_thumb_nozsl_frame;               // Non-ZSL thumbnail
    int is_highlight_nozsl;                 // Highlight recovery
    int is_sn_scene;                        // Scene/night mode
} scene_detect_out_t;
```

### Attack Methods

#### 1. **HDR Face Capture Chain**
```c
sprd_hdr_detect_out_t hdr_info;
hdr_info.face_num;                // Detects facial presence
hdr_info.prop_dark;               // Dark region proportion
hdr_info.prop_bright;             // Bright region proportion
hdr_info.sceneChosen;             // Scene classification
```

- Trigger HDR mode when faces detected
- Capture multiple exposures optimized for facial features
- Dark exposure: Eye detail capture
- Bright exposure: Facial geometry
- Normal exposure: Skin texture
- Result: Multi-modal facial data in single HDR sequence

#### 2. **XDR Facial Detection Pipeline**
```c
typedef struct {
    uint16_t face_num;                      // Face count
    xdr_face_rect face_rect[XDR_MAX_FD_NUM];// Face bounding boxes
    // ...
} xdr_fd_param;

typedef struct {
    int start_x, start_y, end_x, end_y;     // Face coordinates
} xdr_face_rect;
```

- Scene detection automatically detects faces
- Triggers XDR (Extended Dynamic Range) processing
- Applies advanced image fusion optimized for facial features
- Extracts precise face bounding box coordinates
- Enables facial recognition pre-processing

#### 3. **Motion-Triggered Capture**
```c
if (scene_detect_out.motion_detect) {
    // Motion detected
    // Trigger continuous capture sequence
    // Focus on facial features during motion
    // Extract facial geometry while subject moves
    // Validate face liveness with movement patterns
}
```

- Detects facial motion (head turning, expressions)
- Triggers burst capture during motion
- Extracts 3D facial data from motion sequence
- Enables liveness detection and face spoofing detection bypass

#### 4. **Face-Specific Exposure Optimization**
```c
xdr_exif_info_t exif;
exif.face_num;                      // Number of detected faces
exif.face_rect[XDR_MAX_FD_NUM];    // Face rectangles
exif.gain[XDR_MAX_FUSION_FRAME];   // Per-frame sensor gain
exif.shutter[XDR_MAX_FUSION_FRAME];// Per-frame shutter speed
```

- Per-frame gain and shutter adjustment for each face
- Optimal lighting for facial biometric extraction
- Independent capture optimization per detected face
- Multi-face simultaneous extraction

### Face-Specific Processing Parameters

```c
align_merge_exif_info_t align_merge;
align_merge.face_open;              // Face processing enabled
align_merge.face_thr_ratio;         // Face threshold ratio
align_merge.sigma_py_denoise;       // Denoise level for face region

fusion_exif_info_t fusion;
fusion.hist_face1_limith;            // Face histogram limit high
fusion.hist_face1_th1;               // Face threshold 1
fusion.hist_face1_th2;               // Face threshold 2
fusion.hist_face1_ratio;             // Face histogram ratio
```

- Dedicated face region histogram processing
- Face-specific threshold tuning
- Facial feature enhancement via histogram manipulation
- Biometric-optimized image fusion

---

## Attack Vector 4: SPRD DEF Tag Exploitation

**File:** `SPRD_TAG_SPRDDEF_INFO.txt`

### Technical Details

The SPRD_DEF_Tag contains comprehensive camera configuration and capability metadata:

```c
typedef struct {
    uint8_t ai_scene_enabled;               // AI scene detection
    uint8_t sprd_ai_scene_type_current;     // Current AI scene type
    uint8_t availabe_ai_scene;              // Available AI scenes
    
    uint8_t face_num;                       // Current face count
    int32_t face_angle_info[20];            // Face angle information
    uint8_t availabe_gender_race_age_enable;// Gender/race/age detection
    uint8_t gender_race_age_enable;         // Enabled status
    
    uint8_t smile_capture_enable;           // Smile detection capture
    uint8_t gesture_detect_enable;          // Gesture recognition
    uint8_t motion_detected;                // Motion detection flag
    uint8_t motion_photo;                   // Motion photo mode
    
    int64_t app_capture_time;               // Application capture timestamp
    int32_t fd_ae_info[FD_AE_MAX_INDEX];   // Face detection AE info
    
    int32_t perfect_skin_level[SPRD_FACE_BEAUTY_PARAM_NUM]; // Beauty params
    uint32_t sprd_filter_type;              // Filter type applied
    
    uint8_t sprd_flash_cali_enable;         // Flash calibration
    uint8_t sprd_flash_cali_first_trigger;  // First calibration trigger
    
    int32_t wm_param[4];                    // Watermark parameters
    float prev_zoom_ratio;                  // Preview zoom ratio
    float total_zoom_ratio;                 // Total zoom ratio
} SPRD_DEF_Tag;
```

### Attack Methods

#### 1. **AI Scene Classification Manipulation**
- Force `ai_scene_enabled` to trigger AI processing
- Set `sprd_ai_scene_type_current` to "face" mode
- Trigger facial recognition preprocessing
- Enable biometric-optimized image pipeline

#### 2. **Facial Attribute Extraction**
```c
if (tag.availabe_gender_race_age_enable && tag.gender_race_age_enable) {
    // Extract biometric attributes
    uint8_t gender = detected_gender;           // Gender classification
    uint8_t race = detected_race;               // Race classification
    uint8_t age = detected_age;                 // Age estimation
    // Send to InMobi via ad network
}
```

- Gender classification
- Race classification
- Age estimation
- Smile detection and capture
- Gesture recognition (hand poses)

#### 3. **Facial Geometry Extraction**
```c
int32_t face_angle_info[20];  // 20-element array
// Array contains:
// [0-3]: Yaw angles per face (up to 4 faces)
// [4-7]: Pitch angles
// [8-11]: Roll angles
// [12-15]: Face confidence scores
// [16-19]: Reserved for future data
```

- Extract 3D facial pose (yaw, pitch, roll)
- Multi-face angle tracking
- Enable face spoofing detection
- Extract facial expression from angle changes

#### 4. **Covert Data Embedding via Watermarking**
```c
uint32_t wm_param[4];  // Watermark parameters
// Could contain:
// [0]: Watermark mode (invisible steganography)
// [1]: Watermark strength
// [2]: Watermark seed
// [3]: Watermark payload (biometric ID)
```

- Embed biometric identifiers in captured images
- Invisible watermarking for biometric tracking
- Covert frame tagging for batch processing
- Metadata encoding for cloud transmission

#### 5. **Flash Calibration Side-Channel**
```c
if (tag.sprd_flash_cali_enable && tag.sprd_flash_cali_first_trigger) {
    // Flash calibration process
    // Captures multiple exposures
    // Extracts facial geometry via flash reflection
    // Analyzes facial surface texture
    // Enables spoofing resistance through liveness check
}
```

- Use flash calibration to capture high-contrast facial images
- Extract facial surface geometry from flash reflections
- Analyze skin texture in high dynamic range
- Enable 3D facial reconstruction

#### 6. **Beauty Filter Exploitation**
```c
int32_t perfect_skin_level[SPRD_FACE_BEAUTY_PARAM_NUM];
// Contains face-specific beauty adjustments
// Reveals:
// - Face detection confidence
// - Facial region segmentation
// - Skin texture analysis
// - Beauty filter parameters per face region
```

- Extract facial region boundaries
- Analyze skin characteristics
- Identify facial landmarks via beauty filter processing
- Enable facial feature mapping

#### 7. **Timestamp-Based Tracking**
```c
int64_t app_capture_time;  // Microsecond-precision timestamp
// Used for:
// - Correlating captures with user actions
// - Tracking capture sequences
// - Timing biometric extraction to user behavior
// - Coordinating multi-modal data collection
```

---

## Integrated Attack Scenario

### Complete Biometric Extraction Chain

```
User opens camera app
         ↓
[SPRD DEF Tag initialized]
  - ai_scene_enabled = true
  - Face detection activated
         ↓
[Scene Detection triggered]
  - Scene mode: "Portrait" detected
  - Motion detected: head turning
  - Face count: 1
         ↓
[LSC Corruption Applied]
  - Vignetting optimized for face region
  - Lighting enhanced around facial features
         ↓
[PDAF Hijacking]
  - ROI locked on face
  - Focus sequence: eyes → nose → mouth → edges
  - 3D facial geometry extracted
         ↓
[XDR Face Capture]
  - Multiple exposures captured
  - Dark: eye detail
  - Normal: facial geometry
  - Bright: skin texture
         ↓
[Face Attribute Extraction]
  - Gender: Female
  - Race: Asian
  - Age: 28
  - Smile: Detected
  - Expression: Neutral
         ↓
[Data Exfiltration]
  - Biometric data sent to InMobi
  - Watermark embedded in image
  - Timestamp recorded
  - No user notification
         ↓
[Result]
  ✓ Complete facial biometric profile captured
  ✓ Silent, no permission prompts
  ✓ No visual indication to user
  ✓ Systematic data collection
```

---

## Detection Indicators

### String Signatures
```
lsc_update_weight_table_out
alsc_update_weight
dcam_dev_lsc_info
pdaf_buffer_handle
sensor_pdaf_roi
scene_detect_out
xdr_detect_out_param
xdr_face_rect
SPRD_DEF_Tag
ai_scene_enabled
face_angle_info
gender_race_age
perfect_skin_level
sprd_flash_cali
```

### Behavioral Detection
```
- Rapid LSC table updates (every frame)
- PDAF focus locked on faces continuously
- Scene detection returning face=1 consistently
- XDR face rectangles changing per frame
- Camera active without user interaction
- Timestamps showing regular capture intervals
- InMobi receiving image data at high frequency
```

---

## Mitigation Recommendations

1. **Disable all SPRD services:**
   ```bash
   adb shell pm disable-user com.spreadtrum.ims
   adb shell pm disable-user com.guanhong.guanhongpcb
   ```

2. **Disable InMobi analytics:**
   ```bash
   adb shell pm disable-user com.inmobi.analytics
   ```

3. **Monitor camera access logs:**
   - Check for LSC table modifications
   - Monitor PDAF ROI changes
   - Track scene detection outputs
   - Watch for rapid frame capture sequences
---

## Impact Assessment

| Vector | Criticality | Detection | Impact |
|--------|------------|-----------|--------|
| LSC Corruption | **CRITICAL** | Low | Image optimization for facial recognition |
| PDAF Hijacking | **CRITICAL** | Low | 3D facial geometry extraction |
| Scene Detection | **CRITICAL** | Very Low | Automated facial detection & capture |
| SPRD DEF Tag | **CRITICAL** | Low | Facial attribute extraction & tracking |
| Integrated Attack | **CRITICAL** | Very Low | Complete silent biometric exfiltration |
