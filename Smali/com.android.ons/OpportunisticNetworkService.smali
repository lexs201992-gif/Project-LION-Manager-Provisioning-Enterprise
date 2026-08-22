.class public Lcom/android/ons/OpportunisticNetworkService;
.super Landroid/app/Service;
.source "OpportunisticNetworkService.java"


# static fields
.field static final CALLBACK_ON_MORE_ERROR_CODE_CHANGE:J = 0x7c8ba7fL

.field private static final CARRIER_APP_CONFIG_NAME:Ljava/lang/String; = "carrierApp"

.field private static final DBG:Z = true

.field private static final MSG_SIM_STATE_CHANGE:I = 0x1

.field private static final PREF_ENABLED:Ljava/lang/String; = "isEnabled"

.field private static final PREF_NAME:Ljava/lang/String; = "ONS"

.field private static final SYSTEM_APP_CONFIG_NAME:Ljava/lang/String; = "systemApp"

.field private static final TAG:Ljava/lang/String; = "ONS"


# instance fields
.field private final mBinder:Lcom/android/internal/telephony/IOns$Stub;

.field private final mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field protected mContext:Landroid/content/Context;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field protected mIsEnabled:Z
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field protected mONSConfigInputHashMap:Ljava/util/HashMap;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/ons/ONSConfigInput;",
            ">;"
        }
    .end annotation
.end field

.field private mONSProfileActivator:Lcom/android/ons/ONSProfileActivator;

.field private mONSStats:Lcom/android/ons/ONSStats;

.field private mProfileSelectionCallback:Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;

.field protected mProfileSelector:Lcom/android/ons/ONSProfileSelector;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private mSharedPref:Landroid/content/SharedPreferences;

.field protected mSubscriptionManager:Landroid/telephony/SubscriptionManager;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method static bridge synthetic -$$Nest$fgetmHandler(Lcom/android/ons/OpportunisticNetworkService;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmLock(Lcom/android/ons/OpportunisticNetworkService;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmONSProfileActivator(Lcom/android/ons/OpportunisticNetworkService;)Lcom/android/ons/ONSProfileActivator;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSProfileActivator:Lcom/android/ons/ONSProfileActivator;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$menableOpportunisticNetwork(Lcom/android/ons/OpportunisticNetworkService;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->enableOpportunisticNetwork(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleCarrierAppAvailableNetworks(Lcom/android/ons/OpportunisticNetworkService;Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/ons/OpportunisticNetworkService;->handleCarrierAppAvailableNetworks(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mhandleSystemAppAvailableNetworks(Lcom/android/ons/OpportunisticNetworkService;Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/ons/OpportunisticNetworkService;->handleSystemAppAvailableNetworks(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlog(Lcom/android/ons/OpportunisticNetworkService;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlogDebug(Lcom/android/ons/OpportunisticNetworkService;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->logDebug(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msendSetOpptCallbackHelper(Lcom/android/ons/OpportunisticNetworkService;Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/ons/OpportunisticNetworkService;->sendSetOpptCallbackHelper(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smenforceModifyPhoneStatePermission(Landroid/content/Context;)Z
    .locals 0

    invoke-static {p0}, Lcom/android/ons/OpportunisticNetworkService;->enforceModifyPhoneStatePermission(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mHandler:Landroid/os/Handler;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mLock:Ljava/lang/Object;

    new-instance v0, Lcom/android/ons/OpportunisticNetworkService$1;

    invoke-direct {v0, p0}, Lcom/android/ons/OpportunisticNetworkService$1;-><init>(Lcom/android/ons/OpportunisticNetworkService;)V

    iput-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelectionCallback:Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;

    new-instance v0, Lcom/android/ons/OpportunisticNetworkService$2;

    invoke-direct {v0, p0}, Lcom/android/ons/OpportunisticNetworkService$2;-><init>(Lcom/android/ons/OpportunisticNetworkService;)V

    iput-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/android/ons/OpportunisticNetworkService$5;

    invoke-direct {v0, p0}, Lcom/android/ons/OpportunisticNetworkService$5;-><init>(Lcom/android/ons/OpportunisticNetworkService;)V

    iput-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mBinder:Lcom/android/internal/telephony/IOns$Stub;

    return-void
.end method

.method private createMsgHandler()V
    .locals 2

    new-instance v0, Lcom/android/ons/OpportunisticNetworkService$3;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/ons/OpportunisticNetworkService$3;-><init>(Lcom/android/ons/OpportunisticNetworkService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private enableOpportunisticNetwork(Z)V
    .locals 4

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    if-eq v1, p1, :cond_2

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->updateEnableState(Z)V

    iget-boolean p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/android/ons/ONSProfileSelector;->stopProfileSelection(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    goto/16 :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v1, "carrierApp"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v1, "carrierApp"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {p1}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkInfos()Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    iget-object v1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v2, "carrierApp"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {v1}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkInfos()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v3, "carrierApp"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {v2}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkCallback()Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/android/ons/ONSProfileSelector;->startProfileSelection(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v1, "systemApp"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v1, "systemApp"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {p1}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkInfos()Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    iget-object v1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v2, "systemApp"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {v1}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkInfos()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v3, "systemApp"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {v2}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkCallback()Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/android/ons/ONSProfileSelector;->startProfileSelection(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    :cond_2
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "service is enable state "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->logDebug(Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static enforceModifyPhoneStatePermission(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "android.permission.MODIFY_PHONE_STATE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private getPersistentEnableState()Z
    .locals 2

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mSharedPref:Landroid/content/SharedPreferences;

    const-string v0, "isEnabled"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private handleCarrierAppAvailableNetworks(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;Ljava/lang/String;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;",
            "Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const-string v0, "carrierApp"

    const/4 v1, 0x0

    const-string v2, "systemApp"

    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_b

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x3

    const-wide/32 v6, 0x7c8ba7f

    if-le v3, v4, :cond_1

    const-string p1, "Carrier app should not pass more than one subscription"

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    invoke-static {v6, v7}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x7

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p2, v5}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :goto_0
    return-void

    :cond_1
    iget-object v3, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    invoke-virtual {v3, p1}, Lcom/android/ons/ONSProfileSelector;->hasOpprotunisticSub(Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string p1, "No opportunistic subscriptions received"

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    invoke-static {v6, v7}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result p1

    if-eqz p1, :cond_2

    const/16 p1, 0x8

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_1

    :cond_2
    invoke-direct {p0, p2, v5}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :goto_1
    return-void

    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/AvailableNetworkInfo;

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v8

    :try_start_0
    iget-object v5, p0, Lcom/android/ons/OpportunisticNetworkService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v4}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v10

    invoke-virtual {v5, v10}, Landroid/telephony/SubscriptionManager;->isActiveSubId(I)Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v8, v9}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v4

    const-string v8, "updateAvailableNetworks"

    invoke-static {v5, v4, v8}, Lcom/android/internal/telephony/TelephonyPermissions;->enforceCallingOrSelfCarrierPrivilege(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_2

    :cond_5
    invoke-virtual {v4}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v4

    invoke-direct {p0, p3, v4}, Lcom/android/ons/OpportunisticNetworkService;->hasOpportunisticSubPrivilege(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_4

    const-string p1, "No carrier privilege for opportunistic subscription"

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    const/4 p1, 0x4

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    return-void

    :catchall_0
    move-exception p0

    invoke-static {v8, v9}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0

    :cond_6
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v3

    :try_start_1
    new-instance p3, Lcom/android/ons/ONSConfigInput;

    invoke-direct {p3, p1, p2}, Lcom/android/ons/ONSConfigInput;-><init>(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    iget-object v5, p0, Lcom/android/ons/OpportunisticNetworkService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v5}, Landroid/telephony/SubscriptionManager;->getDefaultVoiceSubscriptionInfo()Landroid/telephony/SubscriptionInfo;

    move-result-object v5

    if-eqz v5, :cond_7

    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v5

    invoke-virtual {p3, v5}, Lcom/android/ons/ONSConfigInput;->setPrimarySub(I)V

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v1}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v1

    invoke-virtual {p3, v1}, Lcom/android/ons/ONSConfigInput;->setPreferredDataSub(I)V

    iget-object v1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    iget-object p3, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_8

    iget-object p3, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {v0}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkInfos()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/android/ons/ONSProfileSelector;->containStandaloneOppSubs(Ljava/util/ArrayList;)Z

    move-result p3

    if-eqz p3, :cond_8

    const-string p1, "standalone opportunistic subscription is using."

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :cond_8
    :try_start_2
    iget-boolean p3, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    if-eqz p3, :cond_9

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    invoke-virtual {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->startProfileSelection(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    goto :goto_3

    :cond_9
    invoke-static {v6, v7}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result p1

    if-eqz p1, :cond_a

    const/16 p1, 0xa

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_3

    :cond_a
    const/4 p1, 0x2

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_3
    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_5

    :catchall_1
    move-exception p0

    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0

    :cond_b
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v3

    :try_start_3
    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const/4 p3, 0x0

    invoke-virtual {p1, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    if-nez p1, :cond_c

    invoke-direct {p0, p2, v1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :cond_c
    :try_start_4
    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_d

    invoke-direct {p0, p2, v1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    iget-object p2, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {p2}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkInfos()Ljava/util/ArrayList;

    move-result-object p2

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {p0}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkCallback()Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lcom/android/ons/ONSProfileSelector;->startProfileSelection(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    goto :goto_4

    :cond_d
    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    invoke-virtual {p0, p2}, Lcom/android/ons/ONSProfileSelector;->stopProfileSelection(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :goto_4
    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    :goto_5
    return-void

    :catchall_2
    move-exception p0

    invoke-static {v3, v4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0
.end method

.method private handleSystemAppAvailableNetworks(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;",
            "Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;",
            ")V"
        }
    .end annotation

    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    const-string v2, "systemApp"

    const-string v3, "carrierApp"

    if-eqz p1, :cond_5

    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_5

    iget-object v4, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    invoke-virtual {v4, p1}, Lcom/android/ons/ONSProfileSelector;->hasOpprotunisticSub(Ljava/util/List;)Z

    move-result v4

    const-wide/32 v5, 0x7c8ba7f

    if-nez v4, :cond_1

    const-string p1, "No opportunistic subscriptions received"

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    invoke-static {v5, v6}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x8

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x3

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    new-instance v7, Lcom/android/ons/ONSConfigInput;

    invoke-direct {v7, p1, p2}, Lcom/android/ons/ONSConfigInput;-><init>(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    invoke-virtual {v4, v2, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v2, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    invoke-virtual {v2, p1}, Lcom/android/ons/ONSProfileSelector;->containStandaloneOppSubs(Ljava/util/ArrayList;)Z

    move-result v2

    if-eqz v2, :cond_8

    :cond_2
    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    invoke-virtual {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->startProfileSelection(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    goto :goto_1

    :cond_3
    invoke-static {v5, v6}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result p1

    if-eqz p1, :cond_4

    const/16 p1, 0xa

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_1

    :cond_4
    const/4 p1, 0x2

    invoke-direct {p0, p2, p1}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_1

    :cond_5
    iget-boolean p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p2, v4}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :cond_6
    :try_start_2
    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_7

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    invoke-virtual {p0, p2}, Lcom/android/ons/ONSProfileSelector;->stopProfileSelection(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    goto :goto_1

    :cond_7
    invoke-direct {p0, p2, v4}, Lcom/android/ons/OpportunisticNetworkService;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    const-string p1, "Try to start carrier app request"

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    iget-object p2, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {p2}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkInfos()Ljava/util/ArrayList;

    move-result-object p2

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {p0}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkCallback()Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lcom/android/ons/ONSProfileSelector;->startProfileSelection(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_8
    :goto_1
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    return-void

    :catchall_0
    move-exception p0

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0
.end method

.method private hasOpportunisticSubPrivilege(Ljava/lang/String;I)Z
    .locals 1

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0, p2}, Landroid/telephony/TelephonyManager;->hasCarrierPrivileges(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    invoke-virtual {p0, p2}, Lcom/android/ons/ONSProfileSelector;->getOpprotunisticSubInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Landroid/telephony/SubscriptionManager;->canManageSubscription(Landroid/telephony/SubscriptionInfo;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private log(Ljava/lang/String;)V
    .locals 0

    const-string p0, "ONS"

    invoke-static {p0, p1}, Lcom/android/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private logDebug(Ljava/lang/String;)V
    .locals 0

    const-string p0, "ONS"

    invoke-static {p0, p1}, Lcom/android/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private sendSetOpptCallbackHelper(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-interface {p1, p2}, Lcom/android/internal/telephony/ISetOpportunisticDataCallback;->onComplete(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "RemoteException "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-interface {p1, p2}, Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;->onComplete(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "RemoteException "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private startWorkerThreadAndInit()V
    .locals 2

    new-instance v0, Lcom/android/ons/OpportunisticNetworkService$4;

    invoke-direct {v0, p0}, Lcom/android/ons/OpportunisticNetworkService$4;-><init>(Lcom/android/ons/OpportunisticNetworkService;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    monitor-enter v0

    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private updateEnableState(Z)V
    .locals 1

    iput-boolean p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mSharedPref:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "isEnabled"

    iget-boolean p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    invoke-interface {p1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method protected handleSimStateChange()V
    .locals 5
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    const-string v0, "SIM state changed"

    invoke-direct {p0, v0}, Lcom/android/ons/OpportunisticNetworkService;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v1, "carrierApp"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/ons/ONSConfigInput;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v2, p0, Lcom/android/ons/OpportunisticNetworkService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList(Z)Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_1

    return-void

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleSimStateChange: subscriptionInfos - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/ons/OpportunisticNetworkService;->logDebug(Ljava/lang/String;)V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v3}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v3

    invoke-virtual {v0}, Lcom/android/ons/ONSConfigInput;->getPrimarySub()I

    move-result v4

    if-ne v3, v4, :cond_2

    return-void

    :cond_3
    const-string v0, "Carrier subscription is not available, removing entry"

    invoke-direct {p0, v0}, Lcom/android/ons/OpportunisticNetworkService;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mIsEnabled:Z

    if-nez v0, :cond_4

    return-void

    :cond_4
    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    const-string v1, "systemApp"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    iget-object v2, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {v2}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkInfos()Ljava/util/ArrayList;

    move-result-object v2

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/ons/ONSConfigInput;

    invoke-virtual {p0}, Lcom/android/ons/ONSConfigInput;->getAvailableNetworkCallback()Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lcom/android/ons/ONSProfileSelector;->startProfileSelection(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    :cond_5
    return-void
.end method

.method protected initialize(Landroid/content/Context;)V
    .locals 3
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    iput-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/android/ons/OpportunisticNetworkService;->createMsgHandler()V

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    new-instance p1, Lcom/android/ons/ONSProfileSelector;

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelectionCallback:Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;

    invoke-direct {p1, v0, v1}, Lcom/android/ons/ONSProfileSelector;-><init>(Landroid/content/Context;Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;)V

    iput-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mProfileSelector:Lcom/android/ons/ONSProfileSelector;

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "ONS"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mSharedPref:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    const-string v0, "telephony_subscription_service"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/SubscriptionManager;

    iput-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSConfigInputHashMap:Ljava/util/HashMap;

    new-instance p1, Lcom/android/ons/ONSStats;

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/ons/OpportunisticNetworkService;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-direct {p1, v0, v1}, Lcom/android/ons/ONSStats;-><init>(Landroid/content/Context;Landroid/telephony/SubscriptionManager;)V

    iput-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSStats:Lcom/android/ons/ONSStats;

    iget-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_STATE_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-direct {p0}, Lcom/android/ons/OpportunisticNetworkService;->getPersistentEnableState()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/ons/OpportunisticNetworkService;->enableOpportunisticNetwork(Z)V

    new-instance p1, Lcom/android/ons/ONSProfileActivator;

    iget-object v0, p0, Lcom/android/ons/OpportunisticNetworkService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSStats:Lcom/android/ons/ONSStats;

    invoke-direct {p1, v0, v1}, Lcom/android/ons/ONSProfileActivator;-><init>(Landroid/content/Context;Lcom/android/ons/ONSStats;)V

    iput-object p1, p0, Lcom/android/ons/OpportunisticNetworkService;->mONSProfileActivator:Lcom/android/ons/ONSProfileActivator;

    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mBinder:Lcom/android/internal/telephony/IOns$Stub;

    return-object p0
.end method

.method public onCreate()V
    .locals 2

    invoke-direct {p0}, Lcom/android/ons/OpportunisticNetworkService;->startWorkerThreadAndInit()V

    invoke-static {}, Landroid/telephony/TelephonyFrameworkInitializer;->getTelephonyServiceManager()Landroid/os/TelephonyServiceManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/TelephonyServiceManager;->getOpportunisticNetworkServiceRegisterer()Landroid/os/TelephonyServiceManager$ServiceRegisterer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/TelephonyServiceManager$ServiceRegisterer;->get()Landroid/os/IBinder;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mBinder:Lcom/android/internal/telephony/IOns$Stub;

    invoke-virtual {v0, p0}, Landroid/os/TelephonyServiceManager$ServiceRegisterer;->register(Landroid/os/IBinder;)V

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const-string v0, "Destroyed Successfully..."

    invoke-direct {p0, v0}, Lcom/android/ons/OpportunisticNetworkService;->log(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/ons/OpportunisticNetworkService;->mHandler:Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Looper;->quitSafely()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    iget-object p2, p0, Lcom/android/ons/OpportunisticNetworkService;->mHandler:Landroid/os/Handler;

    new-instance p3, Lcom/android/ons/OpportunisticNetworkService$6;

    invoke-direct {p3, p0}, Lcom/android/ons/OpportunisticNetworkService$6;-><init>(Lcom/android/ons/OpportunisticNetworkService;)V

    invoke-virtual {p3, p1}, Lcom/android/ons/OpportunisticNetworkService$6;->setIntent(Landroid/content/Intent;)Ljava/lang/Runnable;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 p0, 0x1

    return p0
.end method
