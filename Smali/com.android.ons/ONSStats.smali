.class public Lcom/android/ons/ONSStats;
.super Ljava/lang/Object;
.source "ONSStats.java"


# static fields
.field private static final KEY_DETAILED_ERROR_CODE:Ljava/lang/String; = "_detailed_error_code"

.field private static final KEY_DOWNLOAD_RESULT:Ljava/lang/String; = "_download_result"

.field private static final KEY_OPP_CARRIER_ID:Ljava/lang/String; = "_opportunistic_carrier_id"

.field private static final KEY_PRIMARY_CARRIER_ID:Ljava/lang/String; = "_primary_sim_carrier_id"

.field private static final KEY_PROVISIONING_RESULT:Ljava/lang/String; = "_provisioning_result"

.field private static final KEY_RETRY_COUNT:Ljava/lang/String; = "_retry_count"

.field private static final ONS_ATOM_LOG_FILE:Ljava/lang/String; = "ons_atom_log_info"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mSubscriptionManager:Landroid/telephony/SubscriptionManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/telephony/SubscriptionManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/ons/ONSStats;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/ons/ONSStats;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    return-void
.end method

.method private getSimCarrierId(I)I
    .locals 1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    return v0

    :cond_0
    iget-object p0, p0, Lcom/android/ons/ONSStats;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {p0, p1}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/telephony/SubscriptionInfo;->getCarrierId()I

    move-result v0

    :cond_1
    return v0
.end method

.method private ignoreEvent(Lcom/android/ons/ONSStatsInfo;)Z
    .locals 9

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getProvisioningResult()Lcom/android/ons/ONSProfileActivator$Result;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->isProvisioningResultUpdated()Z

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/android/ons/ONSStatsInfo;->setDetailedErrCode(I)Lcom/android/ons/ONSStatsInfo;

    sget-object v1, Lcom/android/ons/ONSProfileActivator$Result;->DOWNLOAD_REQUESTED:Lcom/android/ons/ONSProfileActivator$Result;

    if-eq v0, v1, :cond_2

    sget-object v1, Lcom/android/ons/ONSProfileActivator$Result;->ERR_NO_SIM_INSERTED:Lcom/android/ons/ONSProfileActivator$Result;

    if-eq v0, v1, :cond_2

    sget-object v1, Lcom/android/ons/ONSProfileActivator$Result;->ERR_DUPLICATE_DOWNLOAD_REQUEST:Lcom/android/ons/ONSProfileActivator$Result;

    if-eq v0, v1, :cond_2

    sget-object v1, Lcom/android/ons/ONSProfileActivator$Result;->ERR_SWITCHING_TO_DUAL_SIM_MODE:Lcom/android/ons/ONSProfileActivator$Result;

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    sget-object v1, Lcom/android/ons/ONSProfileActivator$Result;->ERR_CARRIER_DOESNT_SUPPORT_CBRS:Lcom/android/ons/ONSProfileActivator$Result;

    if-ne v0, v1, :cond_3

    iget-object v1, p0, Lcom/android/ons/ONSStats;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v1}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    invoke-virtual {p1, v1}, Lcom/android/ons/ONSStatsInfo;->setPrimarySimSubId(I)Lcom/android/ons/ONSStatsInfo;

    goto :goto_2

    :cond_2
    :goto_1
    return v3

    :cond_3
    :goto_2
    iget-object v1, p0, Lcom/android/ons/ONSStats;->mContext:Landroid/content/Context;

    const-string v5, "ons_atom_log_info"

    invoke-virtual {v1, v5, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->isProvisioningResultUpdated()Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v5, "_provisioning_result"

    invoke-interface {v1, v5, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eq v5, v6, :cond_5

    goto :goto_3

    :cond_4
    const-string v5, "_download_result"

    invoke-interface {v1, v5, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getDownloadResult()Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eq v5, v6, :cond_5

    :goto_3
    move v5, v3

    goto :goto_4

    :cond_5
    move v5, v4

    :goto_4
    const-string v6, "_primary_sim_carrier_id"

    invoke-interface {v1, v6, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getPrimarySimSubId()I

    move-result v7

    invoke-direct {p0, v7}, Lcom/android/ons/ONSStats;->getSimCarrierId(I)I

    move-result p0

    if-eq v6, p0, :cond_6

    move p0, v3

    goto :goto_5

    :cond_6
    move p0, v4

    :goto_5
    const-string v6, "_retry_count"

    invoke-interface {v1, v6, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getRetryCount()I

    move-result v7

    if-eq v6, v7, :cond_7

    move v6, v3

    goto :goto_6

    :cond_7
    move v6, v4

    :goto_6
    const-string v7, "_opportunistic_carrier_id"

    invoke-interface {v1, v7, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getOppSimCarrierId()I

    move-result v8

    if-eq v7, v8, :cond_8

    move v7, v3

    goto :goto_7

    :cond_8
    move v7, v4

    :goto_7
    const-string v8, "_detailed_error_code"

    invoke-interface {v1, v8, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getDetailedErrCode()I

    move-result v2

    if-eq v1, v2, :cond_9

    move v1, v3

    goto :goto_8

    :cond_9
    move v1, v4

    :goto_8
    if-nez v5, :cond_b

    if-nez p0, :cond_b

    if-nez v6, :cond_b

    if-nez v7, :cond_b

    if-nez v1, :cond_b

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->SUCCESS:Lcom/android/ons/ONSProfileActivator$Result;

    if-eq v0, p0, :cond_b

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_DOWNLOADED_ESIM_NOT_FOUND:Lcom/android/ons/ONSProfileActivator$Result;

    if-eq v0, p0, :cond_b

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getDownloadResult()Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    move-result-object p0

    sget-object p1, Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;->ERR_INSTALL_ESIM_PROFILE_FAILED:Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    if-ne p0, p1, :cond_a

    goto :goto_9

    :cond_a
    return v3

    :cond_b
    :goto_9
    return v4
.end method

.method private updateSharedPreferences(Lcom/android/ons/ONSStatsInfo;)V
    .locals 4

    iget-object v0, p0, Lcom/android/ons/ONSStats;->mContext:Landroid/content/Context;

    const-string v1, "ons_atom_log_info"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->isProvisioningResultUpdated()Z

    move-result v1

    const-string v2, "_provisioning_result"

    const-string v3, "_download_result"

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getProvisioningResult()Lcom/android/ons/ONSProfileActivator$Result;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getDownloadResult()Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_0
    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getPrimarySimSubId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/ons/ONSStats;->getSimCarrierId(I)I

    move-result p0

    const-string v1, "_primary_sim_carrier_id"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "_retry_count"

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getRetryCount()I

    move-result v1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "_opportunistic_carrier_id"

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getOppSimCarrierId()I

    move-result v1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "_detailed_error_code"

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getDetailedErrCode()I

    move-result p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public logEvent(Lcom/android/ons/ONSStatsInfo;)Z
    .locals 14

    invoke-direct {p0, p1}, Lcom/android/ons/ONSStats;->ignoreEvent(Lcom/android/ons/ONSStatsInfo;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->isProvisioningResultUpdated()Z

    move-result v0

    const/16 v2, 0x8

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/ons/ONSStats$1;->$SwitchMap$com$android$ons$ONSProfileActivator$Result:[I

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getProvisioningResult()Lcom/android/ons/ONSProfileActivator$Result;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    aget v0, v0, v7

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    move v11, v4

    goto :goto_1

    :pswitch_1
    const/16 v1, 0xa

    goto :goto_0

    :pswitch_2
    move v11, v5

    goto :goto_1

    :pswitch_3
    const/16 v1, 0x9

    goto :goto_0

    :pswitch_4
    move v11, v3

    goto :goto_1

    :pswitch_5
    move v11, v6

    goto :goto_1

    :cond_1
    sget-object v0, Lcom/android/ons/ONSStats$1;->$SwitchMap$com$android$ons$ONSProfileDownloader$DownloadRetryResultCode:[I

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getDownloadResult()Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    aget v0, v0, v7

    if-eq v0, v6, :cond_5

    if-eq v0, v5, :cond_4

    if-eq v0, v4, :cond_3

    if-eq v0, v3, :cond_2

    :goto_0
    move v11, v1

    goto :goto_1

    :cond_2
    const/4 v1, 0x5

    goto :goto_0

    :cond_3
    const/4 v1, 0x7

    goto :goto_0

    :cond_4
    const/4 v1, 0x6

    goto :goto_0

    :cond_5
    :pswitch_6
    move v11, v2

    :goto_1
    const/16 v7, 0x1cb

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getPrimarySimSubId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/ons/ONSStats;->getSimCarrierId(I)I

    move-result v8

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getOppSimCarrierId()I

    move-result v9

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->isWifiConnected()Z

    move-result v10

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getRetryCount()I

    move-result v12

    invoke-virtual {p1}, Lcom/android/ons/ONSStatsInfo;->getDetailedErrCode()I

    move-result v13

    invoke-static/range {v7 .. v13}, Lcom/android/ons/OnsStatsLog;->write(IIIZIII)V

    invoke-direct {p0, p1}, Lcom/android/ons/ONSStats;->updateSharedPreferences(Lcom/android/ons/ONSStatsInfo;)V

    return v6

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_6
    .end packed-switch
.end method
