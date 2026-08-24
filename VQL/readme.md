## VQL artifacts for detection in the Init.rc compromise attack
(https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/ac946512463eb31b2521d3eebaceb71219a9ac53/Firmware/etc/init.rc)

### Hallazgos Críticos

| Sección | Hallazgo | Impacto |
| :--- | :--- | :--- |
| **`# Unisoc: create big core process group`** | **Cpuset `top-app-high-perf`** con permisos `system` | Permite al ODM **priorizar procesos** en big cores, ocultando actividad maliciosa |
| **`# Unisoc: create vip sched process group`** | **Cpuctl `vip-sched`** con permisos `system` | **Grupo de scheduling VIP** para procesos del ODM, facilitando C2 |
| **`chown system log /sys/fs/pstore`** | **Acceso a pstore/ramoops** | Permite **exfiltrar logs del kernel** (console-ramoops, pmsg-ramoops) |
| **`chmod 0440 /sys/fs/pstore/console-ramoops`** | **Logs de kernel accesibles** | **Exfiltración de logs** que pueden contener datos sensibles |
| **`write /proc/sys/abi/swp 1`** | **Enable armv8_deprecated** | Habilita instrucciones deprimidas, posiblemente para **compatibilidad con exploits** |
| **`chown system system /sys/power/state`** | **Control de estado de energía** | Permite al ODM **controlar sleep/wake**, ocultando actividad |
| **`chown radio wakelock /sys/power/wake_lock`** | **Wakelocks para radio** | Permite al **módem** mantener el dispositivo activo para C2 |
| **`start logd` antes de otros servicios** | **Logd primero** | **Captura todos los logs**, incluyendo los del backdoor |
| **`start lmkd`** | **Low Memory Killer primero** | Permite al ODM **controlar memoria**, ocultando actividad |
| **`start servicemanager`** | **Service Manager primero** | **Registra servicios** del ODM en el sistema |

**`/sys/fs/pstore` con `chown system log`:** Esto es **crítico**. El `pstore` (persistent store) almacena **logs del kernel** que sobreviven a reinicios. Permisos `system:log` permiten al ODM:
   *   **Exfiltrar logs del kernel** (console-ramoops, pmsg-ramoops)
   *   **Ocultar actividad** borrando logs
   *   **Recopilar datos sensibles** de errores de kernel
