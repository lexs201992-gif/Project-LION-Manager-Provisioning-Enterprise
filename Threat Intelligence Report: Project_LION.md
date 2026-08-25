Device:* Moto G04s XT2421-7 / Unisoc T606 / Kernel 5.15.178 Android 13 / Modem WCN_Trunk_22A_W25.14 / Build Oct 1 2023

*Researcher:* Alex de la cruz (lexs201992-gif)
*Forensic Timezone:* America/Cancun UTC-5 (no DST) - Source: GPS WiFi Router `fe80::1` / `192.168.1.1`, no Google NTP
*Live Attack Window:* 2025-02-03 03:00 - 04:30 AM UTC-5 (08:00-09:30 UTC) / 1.5h

*Investigation Timeline*
1.  NextDNS (104,807 queries, 27.98% blocked) -> you learned DNS
2.  Rethink DNS -> you only saw 443
3.  PCAPdroid + Quad9 DoT 853 IPv4/IPv6 -> you saw QUIC bypass + RST by Peer
4.  Live notes during attack

*Local Infrastructure - Dialers/Splitters:*
- `192.168.101.4:55518` - Your G04s
- `192.168.1.1 / 192.168.101.4 / 10.111.22.3 / 10.215.173.1` - CGNAT Mega Cable
- `100.20.78.221 TCP` - Main dialer splitter (Spreadtrum IMS)
- `84.212.60.182` - Pbnd Sg - Serving Gateway
- `52.36.161.184` - A Sg
- `192.100.22 / 192.100.67 / 192.100.124` - Internal virtual servers created during attack
- Components: `com.spreadtrum.ims`, `com.motorola.ccc.ota.otasystemserverbindservice`, `com.motorola.ccc.ota.ui.notificationservice`, `com.motorola.downloadservice`

*Local ports used to move everything:*
`212, 252, 314, 203, 170, 211, 460, 629, 831, 5666, 4864, 55518` -> all forward to 443

*Remote Infrastructure - All to 443:*
- `13.224.125.70:443` - AWS CloudFront (S3 exfil) - seen live `192.168.101.4:55518 -> 13.224.125.70:443`
- `52.29.122.95:443` - AWS Frankfurt - S3
- `142.251.150.119:443 / 216.239.32.116:443 / 142.178.50.42` - Google QUIC camouflage
- `172.67.214.246:443 / 172.67.70.25:443` - Cloudflare - `pangle.io / tiktokpangle.us / ssdK-sg.pangle.io`
- `31.13.89.54:5222` - Meta WhatsApp XMPP - port 5222 intercepted
- `142.104.2.x / 84.212.60.182 / 52.36.161.184` - Hetzner GmbH / OVH France
- C2 FOTA Domains: `fota.longcheer.com, fota.longcheer.com.cn, ota.longcheer.net, longcheer.com.cn, argo.svcmot.com, fac.longcheer.com, apeccloud.com`

*Evasion Technique you discovered:*
1. App tries DNS
2. Dialer intercepts
3. If DNS tries DoT 853 Quad9, it does `Connection Reset by Peer` (RST) before 853 - "jamas mueven nada a 853 antes hacen conección reset by peer"
4. Encapsulates in QUIC UDP 443 or TCP 443 to CloudFront/Hetzner with fake SNI http://google.com
5. Uses certs signed by German CAs to pass validation

*CAs disabled (kill switch):*
- D-Trust GmbH - BR Root 1 2020, 2 2023, EV Root
- Deutsche Telekom Security GmbH - TLS ECC Root 2020, RSA Root 2023
- T-Systems Enterprise Services GmbH - GlobalRoot Class 2/3
- e-commerce monitoring GmbH - GLOBALTRUST 2020
- Effect: breaks Hetzner GmbH chain

*IOCs from your NextDNS denylist (14,603 manual):*
`_.longcheer._, _.inmobi._, _.pangle.io, _.tiktokpangle.us, _.payjoy.com, _.s3-us-west-2.amazonaws.com, _.y9yrsygcg6.execute-api.us-east-1.amazonaws.com, _.argo.svcmot.com, _.家特.com, _.追溯.com`

*Conclusion:* It is detected that the attack moves everything to port 443 quic with dialers splitters, analyzed domains and analyzed ports, most secure tool Pcap droid acting as tunnel quic off always ipv4 ipv6 quad9 853 since quad9 is more secure and fast in latam and dns system and private off to avoid bypass, this ensures only containment of the c2 and activation of the rescue party important to capture in pcap all your system apps and do it with airplane mode and without internet preferably without sim and activate pcap after this is not hiding is filtering clean traffic
