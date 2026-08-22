.class final Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;
.super Ljava/lang/Object;
.source "AscProviderInteractor.java"


# instance fields
.field private final mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-direct {v0, p1}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    return-void
.end method


# virtual methods
.method final getAscInfo()Landroid/os/Bundle;
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    const-string v1, "IS_ASC_DEVICE"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->isAscDevice()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "CAMPAIGN_TYPE"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getCampaignType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "TARGET_VERSION"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getTargetVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ASC_VERSION"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getAscVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "DEPLOYMENT_TYPE"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getDeploymentType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "NETWORK_TYPE"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getNetworkType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getMaintenanceWindow()Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getMaintenanceWindow()Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;->getStart()I

    move-result v1

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    const-string v3, "START_WINDOW"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getMaintenanceWindow()Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getMaintenanceWindow()Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;->getEnd()I

    move-result v2

    :cond_1
    const-string v1, "END_WINDOW"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "BLOCK_SOFTWARE_UPDATE_OVER_RECOVERY_MENU"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getBlockSoftwareUpdateOverRecoveryMenu()Z

    move-result p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method

.method final getAscVersion()Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    const-string v1, "ASC_VERSION"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getAscVersion()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method final getCampaignType()Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    const-string v1, "CAMPAIGN_TYPE"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getCampaignType()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method final getIsAscDevice()Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    const-string v1, "IS_ASC_DEVICE"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->isAscDevice()Z

    move-result p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method

.method final getSystemUpdatePolicy()Landroid/os/Bundle;
    .locals 7

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getCampaignType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ALLOW_LIST"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getDeploymentType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, -0x1

    const-string v6, "WINDOWED"

    sparse-switch v2, :sswitch_data_0

    :goto_0
    move v2, v5

    goto :goto_1

    :sswitch_0
    const-string v2, "POSTPONE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    goto :goto_1

    :sswitch_1
    const-string v2, "AUTOMATIC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    move v2, v4

    goto :goto_1

    :sswitch_2
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_1
    packed-switch v2, :pswitch_data_0

    move v3, v5

    goto :goto_2

    :pswitch_0
    const/4 v3, 0x3

    goto :goto_2

    :pswitch_1
    move v3, v4

    :goto_2
    :pswitch_2
    const-string v2, "DEPLOYMENT_TYPE"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v1, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getMaintenanceWindow()Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    move-result-object v1

    invoke-virtual {v1}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;->getStart()I

    move-result v1

    const-string v2, "START_WINDOW"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getMaintenanceWindow()Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;->getEnd()I

    move-result p0

    const-string v1, "END_WINDOW"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_3
    return-object v0

    :sswitch_data_0
    .sparse-switch
        -0x13d56371 -> :sswitch_2
        0x9da420b -> :sswitch_1
        0x5bd1d096 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method final getTargetVersion()Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    const-string v1, "TARGET_VERSION"

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getTargetVersion()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method final isFotaAutoUpdateOverAnyDataNetworkEnabled()Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getNetworkType()Ljava/lang/String;

    move-result-object p0

    const-string v1, "INDIFFERENT"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    const-string v1, "IS_FOTA_AUTO_UPDATE_OVER_ANY_DATA_NETWORK"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method

.method final isFotaAutoUpdateOverWifiOnlyEnabled()Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getNetworkType()Ljava/lang/String;

    move-result-object p0

    const-string v1, "WIFI"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    const-string v1, "IS_FOTA_AUTO_UPDATE_OVER_WIFI_ONLY"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method

.method final isOtaUpdateDisabled()Landroid/os/Bundle;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/provider/AscProviderInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->retrieveData()Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->getCampaignType()Ljava/lang/String;

    move-result-object p0

    const-string v1, "BLOCK_LIST"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    const-string v1, "IS_OTA_UPDATE_DISABLED"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method
