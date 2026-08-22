.class public Lcom/android/ons/ONSProfileActivator;
.super Ljava/lang/Object;
.source "ONSProfileActivator.java"

# interfaces
.implements Lcom/android/ons/ONSProfileConfigurator$ONSProfConfigListener;
.implements Lcom/android/ons/ONSProfileDownloader$IONSProfileDownloaderListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ons/ONSProfileActivator$NetworkCallback;,
        Lcom/android/ons/ONSProfileActivator$Result;
    }
.end annotation


# static fields
.field protected static final REQUEST_CODE_DOWNLOAD_RETRY:I = 0x2
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "com.android.ons.ONSProfileActivator"


# instance fields
.field private final mCarrierConfigMgr:Landroid/telephony/CarrierConfigManager;

.field private final mConnectivityManager:Landroid/net/ConnectivityManager;

.field private final mContext:Landroid/content/Context;

.field protected mDownloadRetryCount:I
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private final mEuiccManager:Landroid/telephony/euicc/EuiccManager;

.field private final mHandler:Landroid/os/Handler;

.field protected mIsInternetConnAvailable:Z
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private final mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

.field private final mONSProfileDownloader:Lcom/android/ons/ONSProfileDownloader;

.field private final mONSStats:Lcom/android/ons/ONSStats;

.field protected mRetryDownloadWhenNWConnected:Z
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private final mSubManager:Landroid/telephony/SubscriptionManager;

.field private final mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method static bridge synthetic -$$Nest$fgetmONSStats(Lcom/android/ons/ONSProfileActivator;)Lcom/android/ons/ONSStats;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mprovisionCBRS(Lcom/android/ons/ONSProfileActivator;)Lcom/android/ons/ONSProfileActivator$Result;
    .locals 0

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->provisionCBRS()Lcom/android/ons/ONSProfileActivator$Result;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfgetTAG()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/telephony/SubscriptionManager;Landroid/telephony/TelephonyManager;Landroid/telephony/CarrierConfigManager;Landroid/telephony/euicc/EuiccManager;Landroid/net/ConnectivityManager;Lcom/android/ons/ONSProfileConfigurator;Lcom/android/ons/ONSProfileDownloader;Lcom/android/ons/ONSStats;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/ons/ONSProfileActivator;->mIsInternetConnAvailable:Z

    iput-boolean v0, p0, Lcom/android/ons/ONSProfileActivator;->mRetryDownloadWhenNWConnected:Z

    iput v0, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    new-instance v0, Lcom/android/ons/ONSProfileActivator$1;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/ons/ONSProfileActivator$1;-><init>(Lcom/android/ons/ONSProfileActivator;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/ons/ONSProfileActivator;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/ons/ONSProfileActivator;->mSubManager:Landroid/telephony/SubscriptionManager;

    iput-object p3, p0, Lcom/android/ons/ONSProfileActivator;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iput-object p4, p0, Lcom/android/ons/ONSProfileActivator;->mCarrierConfigMgr:Landroid/telephony/CarrierConfigManager;

    iput-object p5, p0, Lcom/android/ons/ONSProfileActivator;->mEuiccManager:Landroid/telephony/euicc/EuiccManager;

    iput-object p6, p0, Lcom/android/ons/ONSProfileActivator;->mConnectivityManager:Landroid/net/ConnectivityManager;

    iput-object p7, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    iput-object p8, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileDownloader:Lcom/android/ons/ONSProfileDownloader;

    iput-object p9, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/ons/ONSStats;)V
    .locals 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/ons/ONSProfileActivator;->mIsInternetConnAvailable:Z

    iput-boolean v0, p0, Lcom/android/ons/ONSProfileActivator;->mRetryDownloadWhenNWConnected:Z

    iput v0, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    new-instance v0, Lcom/android/ons/ONSProfileActivator$1;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/ons/ONSProfileActivator$1;-><init>(Lcom/android/ons/ONSProfileActivator;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/ons/ONSProfileActivator;->mContext:Landroid/content/Context;

    const-class v0, Landroid/telephony/SubscriptionManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/telephony/SubscriptionManager;

    iput-object v3, p0, Lcom/android/ons/ONSProfileActivator;->mSubManager:Landroid/telephony/SubscriptionManager;

    const-class v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    const-class v0, Landroid/telephony/CarrierConfigManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/CarrierConfigManager;

    iput-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mCarrierConfigMgr:Landroid/telephony/CarrierConfigManager;

    const-class v1, Landroid/telephony/euicc/EuiccManager;

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/telephony/euicc/EuiccManager;

    iput-object v7, p0, Lcom/android/ons/ONSProfileActivator;->mEuiccManager:Landroid/telephony/euicc/EuiccManager;

    new-instance v8, Lcom/android/ons/ONSProfileConfigurator;

    move-object v1, v8

    move-object v2, p1

    move-object v4, v0

    move-object v5, v7

    move-object v6, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/ons/ONSProfileConfigurator;-><init>(Landroid/content/Context;Landroid/telephony/SubscriptionManager;Landroid/telephony/CarrierConfigManager;Landroid/telephony/euicc/EuiccManager;Lcom/android/ons/ONSProfileConfigurator$ONSProfConfigListener;)V

    iput-object v8, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    new-instance v1, Lcom/android/ons/ONSProfileDownloader;

    move-object v4, v1

    move-object v5, p1

    move-object v6, v0

    move-object v9, p0

    invoke-direct/range {v4 .. v9}, Lcom/android/ons/ONSProfileDownloader;-><init>(Landroid/content/Context;Landroid/telephony/CarrierConfigManager;Landroid/telephony/euicc/EuiccManager;Lcom/android/ons/ONSProfileConfigurator;Lcom/android/ons/ONSProfileDownloader$IONSProfileDownloaderListener;)V

    iput-object v1, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileDownloader:Lcom/android/ons/ONSProfileDownloader;

    const-class v0, Landroid/net/ConnectivityManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lcom/android/ons/ONSProfileActivator;->mConnectivityManager:Landroid/net/ConnectivityManager;

    iput-object p2, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    new-instance p2, Landroid/net/NetworkRequest$Builder;

    invoke-direct {p2}, Landroid/net/NetworkRequest$Builder;-><init>()V

    const/16 v0, 0x10

    invoke-virtual {p2, v0}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object p2

    new-instance v0, Lcom/android/ons/ONSProfileActivator$NetworkCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/ons/ONSProfileActivator$NetworkCallback;-><init>(Lcom/android/ons/ONSProfileActivator;Lcom/android/ons/ONSProfileActivator$NetworkCallback-IA;)V

    invoke-virtual {p1, p2, v0}, Landroid/net/ConnectivityManager;->registerNetworkCallback(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V

    return-void
.end method

.method protected static calculateBackoffDelay(II)I
    .locals 5
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    int-to-double v3, p0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-int p0, v1

    add-int/lit8 p0, p0, -0x1

    invoke-virtual {v0, p0}, Ljava/util/Random;->nextInt(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    mul-int/2addr p0, p1

    mul-int/lit16 p0, p0, 0x3e8

    return p0
.end method

.method private downloadAndActivateOpportunisticSubscription(Landroid/telephony/SubscriptionInfo;)Lcom/android/ons/ONSProfileActivator$Result;
    .locals 4

    sget-object v0, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    const-string v1, "downloadAndActivateOpportunisticSubscription"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v1, p1}, Lcom/android/ons/ONSProfileConfigurator;->getPSIMGroupId(Landroid/telephony/SubscriptionInfo;)Landroid/os/ParcelUuid;

    move-result-object v1

    iget-object v2, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {p1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/ons/ONSProfileConfigurator;->findOpportunisticSubscription(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {p0, v2, v1}, Lcom/android/ons/ONSProfileConfigurator;->groupWithPSIMAndSetOpportunistic(Landroid/telephony/SubscriptionInfo;Landroid/os/ParcelUuid;)V

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->SUCCESS:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_0
    iget-boolean v1, p0, Lcom/android/ons/ONSProfileActivator;->mIsInternetConnAvailable:Z

    const/4 v2, 0x1

    if-nez v1, :cond_1

    const-string p1, "No internet connection. Download will be attempted when connection is restored"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p0, Lcom/android/ons/ONSProfileActivator;->mRetryDownloadWhenNWConnected:Z

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_WAITING_FOR_INTERNET_CONNECTION:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_1
    invoke-virtual {p1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/ons/ONSProfileActivator;->getESIMDownloadViaWiFiOnlyFlag(I)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isWiFiConnected()Z

    move-result v1

    if-nez v1, :cond_2

    const-string p1, "Download via WiFi only flag is set but WiFi is not connected.Download will be attempted when WiFi connection is restored"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p0, Lcom/android/ons/ONSProfileActivator;->mRetryDownloadWhenNWConnected:Z

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_WAITING_FOR_WIFI_CONNECTION:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_2
    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileDownloader:Lcom/android/ons/ONSProfileDownloader;

    invoke-virtual {p1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/ons/ONSProfileDownloader;->downloadProfile(I)Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;

    move-result-object p0

    sget-object p1, Lcom/android/ons/ONSProfileActivator$2;->$SwitchMap$com$android$ons$ONSProfileDownloader$DownloadProfileResult:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, p1, p0

    if-eq p0, v2, :cond_5

    const/4 p1, 0x2

    if-eq p0, p1, :cond_4

    const/4 p1, 0x3

    if-eq p0, p1, :cond_3

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_UNKNOWN:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_3
    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->DOWNLOAD_REQUESTED:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_4
    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_INVALID_CARRIER_CONFIG:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_5
    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_DUPLICATE_DOWNLOAD_REQUEST:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0
.end method

.method private getDownloadRetryBackOffTimerVal(I)I
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mCarrierConfigMgr:Landroid/telephony/CarrierConfigManager;

    invoke-virtual {p0, p1}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object p0

    const-string p1, "esim_download_retry_backoff_timer_sec_int"

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getInt(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private getDownloadRetryMaxAttemptsVal(I)I
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mCarrierConfigMgr:Landroid/telephony/CarrierConfigManager;

    invoke-virtual {p0, p1}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object p0

    const-string p1, "esim_max_download_retry_attempts_int"

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getInt(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private getESIMDownloadViaWiFiOnlyFlag(I)Z
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mCarrierConfigMgr:Landroid/telephony/CarrierConfigManager;

    invoke-virtual {p0, p1}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object p0

    const-string p1, "opportunistic_esim_download_via_wifi_only_bool"

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private isDeviceInSingleSIMMode()Z
    .locals 1

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getActiveModemCount()I

    move-result p0

    const/4 v0, 0x1

    if-gt p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isESIMSupported()Z
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mEuiccManager:Landroid/telephony/euicc/EuiccManager;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/telephony/euicc/EuiccManager;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isMultiSIMPhone()Z
    .locals 1

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSupportedModemCount()I

    move-result p0

    const/4 v0, 0x2

    if-lt p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isONSAutoProvisioningEnabled()Z
    .locals 1

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/high16 v0, 0x7f010000

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method private isOppDataAutoProvisioningSupported(I)Z
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mCarrierConfigMgr:Landroid/telephony/CarrierConfigManager;

    invoke-virtual {p0, p1}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object p0

    const-string p1, "carrier_supports_opp_data_auto_provisioning_bool"

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private isWiFiConnected()Z
    .locals 1

    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {p0, v0}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result p0

    if-eqz p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private provisionCBRS()Lcom/android/ons/ONSProfileActivator$Result;
    .locals 6

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isONSAutoProvisioningEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_AUTO_PROVISIONING_DISABLED:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_0
    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isESIMSupported()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_ESIM_NOT_SUPPORTED:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_1
    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isMultiSIMPhone()Z

    move-result v0

    if-nez v0, :cond_2

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_MULTISIM_NOT_SUPPORTED:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_2
    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mSubManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v0}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_3

    goto/16 :goto_1

    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sget-object v2, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Active subscription count:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_8

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->isOpportunistic()Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_SINGLE_ACTIVE_OPPORTUNISTIC_SIM:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_4
    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/ons/ONSProfileActivator;->isOppDataAutoProvisioningSupported(I)Z

    move-result v1

    if-nez v1, :cond_5

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_CARRIER_DOESNT_SUPPORT_CBRS:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_5
    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isDeviceInSingleSIMMode()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->switchToMultiSIMMode()Z

    move-result p0

    if-nez p0, :cond_6

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_CANNOT_SWITCH_TO_DUAL_SIM_MODE:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_6
    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_SWITCHING_TO_DUAL_SIM_MODE:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_7
    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileActivator;->downloadAndActivateOpportunisticSubscription(Landroid/telephony/SubscriptionInfo;)Lcom/android/ons/ONSProfileActivator$Result;

    move-result-object p0

    return-object p0

    :cond_8
    const/4 v4, 0x2

    if-lt v1, v4, :cond_f

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v4}, Landroid/telephony/SubscriptionInfo;->isEmbedded()Z

    move-result v4

    if-eqz v4, :cond_9

    goto :goto_0

    :cond_a
    move v2, v3

    :goto_0
    if-eqz v2, :cond_b

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_DUAL_ACTIVE_SUBSCRIPTIONS:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_b
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v2

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->isEmbedded()Z

    move-result v3

    if-nez v3, :cond_c

    invoke-direct {p0, v2}, Lcom/android/ons/ONSProfileActivator;->isOppDataAutoProvisioningSupported(I)Z

    move-result v3

    if-eqz v3, :cond_c

    sget-object v3, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CBRS pSIM found. SubId:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v3, v2}, Lcom/android/ons/ONSProfileConfigurator;->findOpportunisticSubscription(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v2

    if-eqz v2, :cond_c

    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mSubManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/telephony/SubscriptionManager;->isActiveSubscriptionId(I)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->isOpportunistic()Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->SUCCESS:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_d
    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v0, v1}, Lcom/android/ons/ONSProfileConfigurator;->getPSIMGroupId(Landroid/telephony/SubscriptionInfo;)Landroid/os/ParcelUuid;

    move-result-object v0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {p0, v2, v0}, Lcom/android/ons/ONSProfileConfigurator;->groupWithPSIMAndSetOpportunistic(Landroid/telephony/SubscriptionInfo;Landroid/os/ParcelUuid;)V

    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->SUCCESS:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_e
    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_DUAL_ACTIVE_SUBSCRIPTIONS:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_f
    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_UNKNOWN:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0

    :cond_10
    :goto_1
    sget-object p0, Lcom/android/ons/ONSProfileActivator$Result;->ERR_NO_SIM_INSERTED:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0
.end method

.method private switchToMultiSIMMode()Z
    .locals 1

    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->doesSwitchMultiSimConfigTriggerReboot()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/telephony/TelephonyManager;->switchMultiSimConfig(I)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method getONSProfileConfigurator()Lcom/android/ons/ONSProfileConfigurator;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    return-object p0
.end method

.method getONSProfileDownloader()Lcom/android/ons/ONSProfileDownloader;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileDownloader:Lcom/android/ons/ONSProfileDownloader;

    return-object p0
.end method

.method public handleCarrierConfigChange()Lcom/android/ons/ONSProfileActivator$Result;
    .locals 3

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->provisionCBRS()Lcom/android/ons/ONSProfileActivator$Result;

    move-result-object v0

    sget-object v1, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    new-instance v2, Lcom/android/ons/ONSStatsInfo;

    invoke-direct {v2}, Lcom/android/ons/ONSStatsInfo;-><init>()V

    invoke-virtual {v2, v0}, Lcom/android/ons/ONSStatsInfo;->setProvisioningResult(Lcom/android/ons/ONSProfileActivator$Result;)Lcom/android/ons/ONSStatsInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/ons/ONSStats;->logEvent(Lcom/android/ons/ONSStatsInfo;)Z

    sget-object v1, Lcom/android/ons/ONSProfileActivator$Result;->DOWNLOAD_REQUESTED:Lcom/android/ons/ONSProfileActivator$Result;

    if-eq v0, v1, :cond_0

    sget-object v1, Lcom/android/ons/ONSProfileActivator$Result;->SUCCESS:Lcom/android/ons/ONSProfileActivator$Result;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    :cond_1
    return-object v0
.end method

.method public onDownloadComplete(I)V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/ons/ONSProfileActivator;->mRetryDownloadWhenNWConnected:Z

    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v0, p1}, Lcom/android/ons/ONSProfileConfigurator;->findOpportunisticSubscription(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    const-string v1, "Downloaded Opportunistic eSIM not found. Unable to group with pSIM"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    new-instance v1, Lcom/android/ons/ONSStatsInfo;

    invoke-direct {v1}, Lcom/android/ons/ONSStatsInfo;-><init>()V

    sget-object v2, Lcom/android/ons/ONSProfileActivator$Result;->ERR_DOWNLOADED_ESIM_NOT_FOUND:Lcom/android/ons/ONSProfileActivator$Result;

    invoke-virtual {v1, v2}, Lcom/android/ons/ONSStatsInfo;->setProvisioningResult(Lcom/android/ons/ONSProfileActivator$Result;)Lcom/android/ons/ONSStatsInfo;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/ons/ONSStatsInfo;->setPrimarySimSubId(I)Lcom/android/ons/ONSStatsInfo;

    move-result-object p1

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isWiFiConnected()Z

    move-result p0

    invoke-virtual {p1, p0}, Lcom/android/ons/ONSStatsInfo;->setWifiConnected(Z)Lcom/android/ons/ONSStatsInfo;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/android/ons/ONSStats;->logEvent(Lcom/android/ons/ONSStatsInfo;)Z

    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/ons/ONSProfileActivator;->mSubManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v1, p1}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {p1}, Landroid/telephony/SubscriptionInfo;->getGroupUuid()Landroid/os/ParcelUuid;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Lcom/android/ons/ONSProfileConfigurator;->groupWithPSIMAndSetOpportunistic(Landroid/telephony/SubscriptionInfo;Landroid/os/ParcelUuid;)V

    sget-object p1, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    const-string v0, "eSIM downloaded and configured successfully"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    new-instance v0, Lcom/android/ons/ONSStatsInfo;

    invoke-direct {v0}, Lcom/android/ons/ONSStatsInfo;-><init>()V

    sget-object v1, Lcom/android/ons/ONSProfileActivator$Result;->SUCCESS:Lcom/android/ons/ONSProfileActivator$Result;

    invoke-virtual {v0, v1}, Lcom/android/ons/ONSStatsInfo;->setProvisioningResult(Lcom/android/ons/ONSProfileActivator$Result;)Lcom/android/ons/ONSStatsInfo;

    move-result-object v0

    iget v1, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    invoke-virtual {v0, v1}, Lcom/android/ons/ONSStatsInfo;->setRetryCount(I)Lcom/android/ons/ONSStatsInfo;

    move-result-object v0

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isWiFiConnected()Z

    move-result p0

    invoke-virtual {v0, p0}, Lcom/android/ons/ONSStatsInfo;->setWifiConnected(Z)Lcom/android/ons/ONSStatsInfo;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/android/ons/ONSStats;->logEvent(Lcom/android/ons/ONSStatsInfo;)Z

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    const-string v1, "ESIM downloaded but pSIM is not active or removed"

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    new-instance v1, Lcom/android/ons/ONSStatsInfo;

    invoke-direct {v1}, Lcom/android/ons/ONSStatsInfo;-><init>()V

    sget-object v2, Lcom/android/ons/ONSProfileActivator$Result;->ERR_PSIM_NOT_FOUND:Lcom/android/ons/ONSProfileActivator$Result;

    invoke-virtual {v1, v2}, Lcom/android/ons/ONSStatsInfo;->setProvisioningResult(Lcom/android/ons/ONSProfileActivator$Result;)Lcom/android/ons/ONSStatsInfo;

    move-result-object v1

    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getCarrierId()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/ons/ONSStatsInfo;->setOppSimCarrierId(I)Lcom/android/ons/ONSStatsInfo;

    move-result-object v0

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isWiFiConnected()Z

    move-result p0

    invoke-virtual {v0, p0}, Lcom/android/ons/ONSStatsInfo;->setWifiConnected(Z)Lcom/android/ons/ONSStatsInfo;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/android/ons/ONSStats;->logEvent(Lcom/android/ons/ONSStatsInfo;)Z

    :goto_0
    return-void
.end method

.method public onDownloadError(ILcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;I)V
    .locals 4

    sget-object v0, Lcom/android/ons/ONSProfileActivator$2;->$SwitchMap$com$android$ons$ONSProfileDownloader$DownloadRetryResultCode:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    const/4 v3, 0x2

    if-eq v0, v3, :cond_1

    const/4 v3, 0x3

    if-eq v0, v3, :cond_0

    sget-object v0, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Download failed with cause="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/ons/ONSProfileActivator;->startBackoffTimer(I)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v0, p1}, Lcom/android/ons/ONSProfileConfigurator;->getOpportunisticSubIdsofPSIMOperator(I)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_4

    iget-object v3, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v3, v0}, Lcom/android/ons/ONSProfileConfigurator;->deleteSubscription(I)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v0, p1}, Lcom/android/ons/ONSProfileConfigurator;->getOpportunisticSubIdsofPSIMOperator(I)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_3

    iget-object v3, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v3, v0}, Lcom/android/ons/ONSProfileConfigurator;->deleteSubscription(I)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    invoke-virtual {v0, p1}, Lcom/android/ons/ONSProfileConfigurator;->deleteInactiveOpportunisticSubscriptions(I)Z

    :cond_4
    :goto_0
    move v1, v2

    :goto_1
    if-eqz v1, :cond_5

    iget-object v0, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    new-instance v1, Lcom/android/ons/ONSStatsInfo;

    invoke-direct {v1}, Lcom/android/ons/ONSStatsInfo;-><init>()V

    invoke-virtual {v1, p2}, Lcom/android/ons/ONSStatsInfo;->setDownloadResult(Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;)Lcom/android/ons/ONSStatsInfo;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/ons/ONSStatsInfo;->setPrimarySimSubId(I)Lcom/android/ons/ONSStatsInfo;

    move-result-object p1

    iget p2, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    invoke-virtual {p1, p2}, Lcom/android/ons/ONSStatsInfo;->setRetryCount(I)Lcom/android/ons/ONSStatsInfo;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/android/ons/ONSStatsInfo;->setDetailedErrCode(I)Lcom/android/ons/ONSStatsInfo;

    move-result-object p1

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->isWiFiConnected()Z

    move-result p0

    invoke-virtual {p1, p0}, Lcom/android/ons/ONSStatsInfo;->setWifiConnected(Z)Lcom/android/ons/ONSStatsInfo;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/android/ons/ONSStats;->logEvent(Lcom/android/ons/ONSStatsInfo;)Z

    :cond_5
    return-void
.end method

.method public onOppSubscriptionDeleted(I)V
    .locals 2

    invoke-direct {p0}, Lcom/android/ons/ONSProfileActivator;->provisionCBRS()Lcom/android/ons/ONSProfileActivator$Result;

    move-result-object p1

    sget-object v0, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mONSStats:Lcom/android/ons/ONSStats;

    new-instance v0, Lcom/android/ons/ONSStatsInfo;

    invoke-direct {v0}, Lcom/android/ons/ONSStatsInfo;-><init>()V

    invoke-virtual {v0, p1}, Lcom/android/ons/ONSStatsInfo;->setProvisioningResult(Lcom/android/ons/ONSProfileActivator$Result;)Lcom/android/ons/ONSStatsInfo;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/ons/ONSStats;->logEvent(Lcom/android/ons/ONSStatsInfo;)Z

    return-void
.end method

.method protected startBackoffTimer(I)Z
    .locals 6
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    iget v0, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    sget-object v0, Lcom/android/ons/ONSProfileActivator;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Download retry count :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget v2, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileActivator;->getDownloadRetryMaxAttemptsVal(I)I

    move-result v3

    if-le v2, v3, :cond_0

    const-string p0, "Max download retry attempted. Stopping retry"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileActivator;->getDownloadRetryBackOffTimerVal(I)I

    move-result v2

    iget v3, p0, Lcom/android/ons/ONSProfileActivator;->mDownloadRetryCount:I

    invoke-static {v3, v2}, Lcom/android/ons/ONSProfileActivator;->calculateBackoffDelay(II)I

    move-result v2

    new-instance v3, Landroid/os/Message;

    invoke-direct {v3}, Landroid/os/Message;-><init>()V

    const/4 v4, 0x2

    iput v4, v3, Landroid/os/Message;->what:I

    iput p1, v3, Landroid/os/Message;->arg2:I

    iget-object p0, p0, Lcom/android/ons/ONSProfileActivator;->mHandler:Landroid/os/Handler;

    int-to-long v4, v2

    invoke-virtual {p0, v3, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Download failed. Retry after :"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "MilliSecs"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method
