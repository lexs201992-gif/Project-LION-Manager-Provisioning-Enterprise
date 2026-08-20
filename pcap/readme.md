## Evidence: sysDLL (co.sitic.pp) C2 Executor
pcap/report_2_sysdll_c2.csv
Este archivo documenta la actividad de co.sitic.pp (UID 10234), el ejecutor principal del C2. A diferencia del servicio de Motorola (que actúa como inyectador), sysDLL gestiona directamente los canales de exfiltración y comando hacia las infraestructuras de Azure y Google.

## Hallazgos Clave en la Captura:

## Resolución DNS Agresiva:
sysDLL resuelve ppmxfa.com y firebaseinstallations.googleapis.com inmediatamente tras el arranque (23:02:44).
Se observan múltiples consultas DNS en menos de 200ms, indicando un bucle de "beaconing" intensivo.
Conexión C2 Directa a Azure:
Se registran 6 conexiones HTTPS consecutivas a 52.168.125.188 (Azure) en un periodo de 3 segundos.
Volumen de Datos: Cada conexión descarga entre 7.8 KB y 7.9 KB de datos. Este volumen sugiere la descarga de configuraciones de C2, claves criptográficas o módulos de carga adicionales.
Canal de Exfiltración (Firebase):
Una conexión sostenida a 172.217.119.4 (Google Firebase) durante 1 minuto y 1 segundo (23:02:44 - 23:03:45).
Este canal se utiliza para mezclar la exfiltración de datos con la telemetría legítima de Firebase, evadiendo la detección.
IOCs Confirmados en esta Captura:

## Paquete: co.sitic.pp (UID 10234)
Dominios: ppmxfa.com, firebaseinstallations.googleapis.com
IPs: 52.168.125.188 (Azure), 172.217.119.4 (Google)
Puertos de Origen: 41208, 59502, 59514, 47992, 47996, 47998, 48010
Conclusión Técnica:

## Esta captura confirma que sysDLL no es un componente pasivo, sino el orquestador activo del backdoor. Su capacidad para mantener múltiples conexiones C2 simultáneas y su uso de canales de "ruido" (Firebase) demuestran una arquitectura de evasión sofisticada diseñada para persistir y exfiltrar datos de forma continua.
