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

**`Firmware/etc/atrace.rc` (https://github.com/lexs201992-gif/Project-LION-Manager-Provisioning-Enterprise/blob/688387d49b9b82b029fe46ca550fe9f5c1eaa8dd/Firmware/etc/atrace.rc)

| Sección | Hallazgo | Impacto Forense |
| :--- | :--- | :--- |
| **`chmod 0222 /sys/kernel/debug/tracing/trace_marker`** | **World-writable trace marker** | Permite a **cualquier proceso** inyectar marcas en el buffer de tracing del kernel |
| **`chmod 0666 /sys/kernel/tracing/*`** | **World read/write en tracepoints** | **Acceso total** al sistema de tracing del kernel |
| **`write /proc/sys/kernel/sched_schedstats 1`** | **Scheduler stats habilitados** | **Monitoreo de scheduling** de todos los procesos |
| **`service boottrace /system/bin/atrace`** | **Atrace como servicio root** | **Tracing persistente** desde el boot |
| **`on property:persist.debug.atrace.boottrace=1`** | **Trigger remoto** | El ODM puede **activar/desactivar** tracing a distancia |
| **`write /sys/kernel/tracing/tracing_on 0`** | **Control de tracing_on** | Permite **pausar/reanudar** el tracing del kernel |
