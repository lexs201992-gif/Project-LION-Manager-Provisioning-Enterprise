rule Unisoc_Motorola_AWS_C2_Traffic {
    meta:
        description = "Detects firmware binaries containing hardcoded C2 domains for sandclowd.com and Motorola Enterprise Service"
        author = "lexs201992-gif"
        date = "2026-08-20"
        severity = "CRITICAL"
        reference = "Project-LION-Manager-Provisioning-Enterprise"
    
    strings:
        $domain_sandclowd = "notification.sandclowd.com" ascii wide
        $domain_metrics = "metrics-server.sandclowd.com" ascii wide
        $moto_package = "com.motorola.enterprise.adapter.service" ascii wide
        $c2_path = "/notification" ascii wide
        $c2_metrics = "/metrics" ascii wide
        
    condition:
        (any of ($domain_sandclowd, $domain_metrics)) and 
        ($moto_package in file) and
        (any of ($c2_path, $c2_metrics))
}   
