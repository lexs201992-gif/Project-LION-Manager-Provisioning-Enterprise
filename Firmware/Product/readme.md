# Product Partition: `/system/product/etc`

This directory contains **product-level configuration** that defines carrier support, roaming behavior, and build metadata.

## Key Files

| File | Forensic Significance |
| :--- | :--- |
| `apns-conf.xml` | APN configurations for **multi-national carriers** (MCC/MNC: 334xxx Mexico, 22201 Italy, 50503 Australia). Confirms the device is designed for **global carrier-specific activation**. |
| `old-apns-conf.xml` | Previous APN configuration. Enables **differential analysis** to identify which APNs were added/modified in the compromised firmware. |
| `roamingbroker_file.xml` | Manages **international roaming**. Confirms the device is designed to operate across multiple countries, supporting the LATAM/Global distribution hypothesis. |
| `countryIso-conf.xml` | Country ISO code mapping. Documents the **geographic targeting** of the firmware. |
| `build.prop` | **Critical**: Shows `ro.product.build.date=Wed Mar 18 15:42:41 CST 2026` while the UI reports "April 5, 2026" – **patch level falsification**.  Also contains `oem_trusted_certificate` and `oem_trusted_authority` (Unisoc provider). |

## Carrier-Specific Activation

The `software channel amxmx` (América Móvil / Mexico) combined with multi-national APN support confirms that the firmware is **not generic**. It is **tailored per carrier and region**, with the backdoor activation logic tied to specific MCC/MNC codes.

| Archivo | Path | Ticket | Función |
| :--- | :--- | :--- | :--- |
| `shutdown_detect_log.rc` | `/system/system_ext/etc/init/` | `SR.599.001866.006639` (implícito) | **Daemon** de detección de shutdown |
| `shutdown_detect_config.xml` | `/system/product/` | **`SR.599.001866.006639`** (explícito) | **Configuración** del feature |

| Elemento | Detalle | Impacto |
| :--- | :--- | :--- |
| **`/proc/shutdown_detect`** | **Device node** de shutdown | **Monitorea** cuándo el dispositivo se apaga |
| **`chmod 777`** | **World-writable** | **Cualquier proceso** puede interactuar |
| **`ro.debuggable=1`** | **Solo en debug** | **Inactivo en producción** (MP) |
| **`timeout_val="0x5AFF"`** | **23,295 ms** (~23 seg) | **Ventana de tiempo** para exfiltración antes del shutdown |
| **`main_on="1"`** | **Habilitado** | El feature está **activo** |
| **`seclabel u:object_r:shutdown_detect_log_exec:s0`** | **SELinux context** | **Control de acceso** al binary |

## Anonymization Note

Sensitive proxy/portal URLs in APN configurations have been **redacted** to protect C2 IOCs until blocked by CISA/Motorola.

---
*Author: Alexis Michel De La Cruz Correa (lexs201992-gif)*   
