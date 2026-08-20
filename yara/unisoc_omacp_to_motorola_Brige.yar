rule Unisoc_Omacp_To_Motorola_Bridge {
    meta:
        description = "Detects interaction between Unisoc OMA CP, Motorola Enterprise Service, and sysDLL"
        author = "lexs201992-gif"
        date = "2026-08-20"
        severity = "HIGH"
        type = "Behavioral"
    
    strings:
        $unisoc_receiver = "com.sprd.omacp.transaction.OtaOmaReceiver" ascii wide
        $moto_adapter = "com.motorola.enterprise.adapter.service" ascii wide
        $sysdll_package = "co.sitic.pp" ascii wide
        $intent_ota = "com.motorola.ccc.ota.UPGRADE_ASC_UPDATE_REQUEST" ascii wide
        $permission_asc = "com.motorola.enterprise.asc.permission.INTERACT_ASC_SERVICE" ascii wide
        $fcm_event = "com.google.firebase.MESSAGING_EVENT" ascii wide
        
    condition:
        ($unisoc_receiver in file) and 
        ($moto_adapter in file) and
        (any of ($intent_ota, $permission_asc, $fcm_event, $sysdll_package))
}   
