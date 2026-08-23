## Key Considerations for Deployment

**$HOME_NET Definition:** Ensure your suricata.yaml or local.rules correctly defines $HOME_NET to include your lab IP ranges (10.215.173.0/24, 192.168.101.0/24, 100.20.78.0/24).

**QUIC Detection:** Suricata has built-in support for QUIC. Rule 6 is critical because your research showed the backdoor encapsulates traffic in QUIC UDP 443 to bypass TCP-based DPI.

**RST Detection:** Rule 7 is a heuristic. True RST detection for evasion requires deeper packet inspection or Zeek logging, but alerting on DoT connections to the compromised device is a strong indicator of the evasion attempt.

**DNS Logging**: Rule 8 uses dns.query to detect resolution of the specific C2 domains. This is often the earliest and most reliable indicator of compromise in network logs.
