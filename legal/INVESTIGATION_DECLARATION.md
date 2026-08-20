# Declaración de Investigación Legal y Ética

**Investigador:** Alexis Michel De La Cruz Correa
**Fecha:** 20 de agosto de 2026
**Repositorio:** Project-LION-Manager-Provisioning-Enterprise

## 1. Marco Legal y Cumplimiento Normativo

Esta investigación se ha llevado a cabo estrictamente bajo el marco de la **Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP)** y sus reglamentos, así como la **Ley Federal de Telecomunicaciones y Radiodifusión**.

*   **Propiedad Legal del Dispositivo:** El equipo analizado (Motorola Moto G04s, Board `lion`) fue adquirido a través de **Radio Dipsa**, distribuidor oficial de Telcel en México. Se cuenta con factura de compra y registro exitoso ante el **Instituto Federal de Telecomunicaciones (IFT)** bajo el folio `510100018869585201` (25-06-26).
*   **Ausencia de Datos Personales de Terceros:** Se certifica que la evidencia publicada (firmware, PCAPs, smali) proviene exclusivamente de la partición de sistema (`/system`) del dispositivo de investigación. **No se incluyen, ni se han exfiltrado, datos personales de usuarios finales, credenciales de terceros o información confidencial de operadores** que no sean parte de la arquitectura del backdoor documentado.
*   **Investigación Defensiva:** El objetivo exclusivo de esta investigación es la **seguridad defensiva** y la protección de la infraestructura digital nacional e internacional. No se ha realizado ninguna acción de explotación activa contra redes externas, servidores de C2 o infraestructura de terceros.

## 2. Canal de Divulgación Independiente

Dado que **México no cuenta con un organismo estatal especializado exclusivo para la gestión de divulgación de vulnerabilidades (VDP) a nivel de cadena de suministro de hardware**, esta investigación se divulga a través de:

1.  **GitHub Security Advisories:** Para la asignación de CVEs y notificación directa a los fabricantes (Motorola CSIRT).
2.  **AttackerKB:** Como plataforma de inteligencia de amenazas independiente para la comunidad global de ciberseguridad.
3.  **CISA (EE.UU.) y Talos (Cisco):** Como organismos internacionales de referencia para la mitigación de amenazas críticas de cadena de suministro.

Este canal de divulgación independiente busca compensar la falta de infraestructura estatal de respuesta a incidentes de hardware en la región, asegurando que la información crítica llegue a los actores capaces de mitigar el riesgo a escala global.

## 3. Alcance y Limitaciones

*   **Evidencia de Fábrica:** Los hallazgos confirman que el compromiso se introduce durante el proceso de ensamblaje y firma de firmware por parte del ODM (Longcheer), antes de la distribución por el operador (Telcel/Radio Dipsa).
*   **Riesgo Sistémico:** La información publicada tiene como fin alertar a los reguladores (IFT, ANATEL, etc.) y a los fabricantes sobre la presencia de una arquitectura de vigilancia pasiva en dispositivos de gama media distribuidos masivamente.

## 4. Compromiso Ético

El investigador se compromete a:
*   No comercializar la vulnerabilidad.
*   No utilizar el backdoor para fines de espionaje o daño.
*   Mantener la cadena de custodia de la evidencia física (dispositivo de laboratorio) disponible para auditorías legales o técnicas si es requerido por autoridades competentes.

---
*Esta declaración forma parte integral del repositorio y valida la legitimidad de la investigación presentada.*   
