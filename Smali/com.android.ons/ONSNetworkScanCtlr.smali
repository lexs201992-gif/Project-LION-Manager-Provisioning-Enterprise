.class public Lcom/android/ons/ONSNetworkScanCtlr;
.super Ljava/lang/Object;
.source "ONSNetworkScanCtlr.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field static final DEFAULT_4G_RAS:Landroid/telephony/RadioAccessSpecifier;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field static final DEFAULT_5G_RAS:Landroid/telephony/RadioAccessSpecifier;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private static final LOG_TAG:Ljava/lang/String; = "ONSNetworkScanCtlr"

.field private static final MAX_SEARCH_TIME:I

.field private static final MSG_SCAN_COMPLETE:I = 0x2

.field private static final MSG_SCAN_ERROR:I = 0x3

.field private static final MSG_SCAN_RESULTS_AVAILABLE:I = 0x1

.field private static final SCAN_RESTART_TIME:I

.field private static final SEARCH_PERIODICITY_FAST:I

.field private static final SEARCH_PERIODICITY_SLOW:I


# instance fields
.field private configManager:Landroid/telephony/CarrierConfigManager;

.field private mCurrentScan:Landroid/telephony/NetworkScan;

.field private mCurrentScanRequest:Landroid/telephony/NetworkScanRequest;

.field private mHandler:Landroid/os/Handler;

.field private mIs4gScanEnabled:Ljava/lang/Boolean;

.field private mIsScanActive:Z

.field private final mLock:Ljava/lang/Object;

.field private mMccMncs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mNetworkAvailableCallBack:Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field public mNetworkScanCallback:Landroid/telephony/TelephonyScanManager$NetworkScanCallback;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private mRsrpEntryThreshold:I

.field private mSsRsrpEntryThreshold:I

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field mThread:Landroid/os/HandlerThread;


# direct methods
.method public static synthetic $r8$lambda$49aVs8vQmlKsWbAXPvBOGMWHGMg(Ljava/lang/Integer;)I
    .locals 0

    invoke-static {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->lambda$createNetworkScanRequest$1(Ljava/lang/Integer;)I

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$r8mezkKgDhYdJyUXjHUMdveYRk0(Ljava/lang/Integer;)I
    .locals 0

    invoke-static {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->lambda$createNetworkScanRequest$0(Ljava/lang/Integer;)I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmHandler(Lcom/android/ons/ONSNetworkScanCtlr;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$minvalidateScanOnError(Lcom/android/ons/ONSNetworkScanCtlr;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/ONSNetworkScanCtlr;->invalidateScanOnError(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrestartScan(Lcom/android/ons/ONSNetworkScanCtlr;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->restartScan()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetSCAN_RESTART_TIME()I
    .locals 1

    sget v0, Lcom/android/ons/ONSNetworkScanCtlr;->SCAN_RESTART_TIME:I

    return v0
.end method

.method static bridge synthetic -$$Nest$smlog(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->log(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smlogDebug(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->logDebug(Ljava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 6

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v1

    long-to-int v1, v1

    sput v1, Lcom/android/ons/ONSNetworkScanCtlr;->SEARCH_PERIODICITY_SLOW:I

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v3

    long-to-int v3, v3

    sput v3, Lcom/android/ons/ONSNetworkScanCtlr;->SEARCH_PERIODICITY_FAST:I

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v3

    long-to-int v3, v3

    sput v3, Lcom/android/ons/ONSNetworkScanCtlr;->MAX_SEARCH_TIME:I

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    long-to-int v0, v0

    sput v0, Lcom/android/ons/ONSNetworkScanCtlr;->SCAN_RESTART_TIME:I

    new-instance v0, Landroid/telephony/RadioAccessSpecifier;

    const/16 v1, 0x30

    const/16 v2, 0x47

    filled-new-array {v1, v2}, [I

    move-result-object v3

    const/4 v4, 0x6

    const/4 v5, 0x0

    invoke-direct {v0, v4, v3, v5}, Landroid/telephony/RadioAccessSpecifier;-><init>(I[I[I)V

    sput-object v0, Lcom/android/ons/ONSNetworkScanCtlr;->DEFAULT_5G_RAS:Landroid/telephony/RadioAccessSpecifier;

    new-instance v0, Landroid/telephony/RadioAccessSpecifier;

    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-direct {v0, v4, v1, v5}, Landroid/telephony/RadioAccessSpecifier;-><init>(I[I[I)V

    sput-object v0, Lcom/android/ons/ONSNetworkScanCtlr;->DEFAULT_4G_RAS:Landroid/telephony/RadioAccessSpecifier;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/telephony/TelephonyManager;Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    new-instance v0, Lcom/android/ons/ONSNetworkScanCtlr$1;

    invoke-direct {v0, p0}, Lcom/android/ons/ONSNetworkScanCtlr$1;-><init>(Lcom/android/ons/ONSNetworkScanCtlr;)V

    iput-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mNetworkScanCallback:Landroid/telephony/TelephonyScanManager$NetworkScanCallback;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/ons/ONSNetworkScanCtlr;->init(Landroid/content/Context;Landroid/telephony/TelephonyManager;Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;)V

    return-void
.end method

.method private getBooleanCarrierConfig(Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->getConfigBundle()Landroid/os/PersistableBundle;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    invoke-static {}, Landroid/telephony/CarrierConfigManager;->getDefaultConfig()Landroid/os/PersistableBundle;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private getConfigBundle()Landroid/os/PersistableBundle;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->configManager:Landroid/telephony/CarrierConfigManager;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/telephony/CarrierConfigManager;->getConfig()Landroid/os/PersistableBundle;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private getIntCarrierConfig(Ljava/lang/String;)I
    .locals 0

    invoke-direct {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->getConfigBundle()Landroid/os/PersistableBundle;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getInt(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_0
    invoke-static {}, Landroid/telephony/CarrierConfigManager;->getDefaultConfig()Landroid/os/PersistableBundle;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getInt(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private getIs4gScanEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_0
    const-string v0, "enabled_4g_opportunistic_network_scan_bool"

    invoke-direct {p0, v0}, Lcom/android/ons/ONSNetworkScanCtlr;->getBooleanCarrierConfig(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private invalidateScanOnError(I)V
    .locals 1

    const-string v0, "scan invalidated on error"

    invoke-static {v0}, Lcom/android/ons/ONSNetworkScanCtlr;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mNetworkAvailableCallBack:Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;->onError(I)V

    :cond_0
    iget-object p1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mLock:Ljava/lang/Object;

    monitor-enter p1

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIsScanActive:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mCurrentScan:Landroid/telephony/NetworkScan;

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private static synthetic lambda$createNetworkScanRequest$0(Ljava/lang/Integer;)I
    .locals 0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method private static synthetic lambda$createNetworkScanRequest$1(Ljava/lang/Integer;)I
    .locals 0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1

    const-string v0, "ONSNetworkScanCtlr"

    invoke-static {v0, p0}, Lcom/android/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static logDebug(Ljava/lang/String;)V
    .locals 1

    const-string v0, "ONSNetworkScanCtlr"

    invoke-static {v0, p0}, Lcom/android/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private restartScan()V
    .locals 4

    const-string v0, "restartScan"

    invoke-static {v0}, Lcom/android/ons/ONSNetworkScanCtlr;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mCurrentScanRequest:Landroid/telephony/NetworkScanRequest;

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mNetworkScanCallback:Landroid/telephony/TelephonyScanManager$NetworkScanCallback;

    invoke-virtual {v2, v1, v3}, Landroid/telephony/TelephonyManager;->requestNetworkScan(Landroid/telephony/NetworkScanRequest;Landroid/telephony/TelephonyScanManager$NetworkScanCallback;)Landroid/telephony/NetworkScan;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIsScanActive:Z

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private startNetworkScan(Landroid/telephony/NetworkScanRequest;)Z
    .locals 4

    iget-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIsScanActive:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mCurrentScanRequest:Landroid/telephony/NetworkScanRequest;

    invoke-virtual {v1, p1}, Landroid/telephony/NetworkScanRequest;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v0

    return v2

    :cond_0
    invoke-virtual {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->stopNetworkScan()V

    const-string v1, "opportunistic_network_exit_threshold_rsrp_int"

    invoke-direct {p0, v1}, Lcom/android/ons/ONSNetworkScanCtlr;->getIntCarrierConfig(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mRsrpEntryThreshold:I

    const-string v1, "opportunistic.entry_threshold_ss_rsrp_int"

    invoke-direct {p0, v1}, Lcom/android/ons/ONSNetworkScanCtlr;->getIntCarrierConfig(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mSsRsrpEntryThreshold:I

    iget-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mNetworkScanCallback:Landroid/telephony/TelephonyScanManager$NetworkScanCallback;

    invoke-virtual {v1, p1, v3}, Landroid/telephony/TelephonyManager;->requestNetworkScan(Landroid/telephony/NetworkScanRequest;Landroid/telephony/TelephonyScanManager$NetworkScanCallback;)Landroid/telephony/NetworkScan;

    move-result-object v1

    iput-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mCurrentScan:Landroid/telephony/NetworkScan;

    iput-boolean v2, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIsScanActive:Z

    iput-object p1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mCurrentScanRequest:Landroid/telephony/NetworkScanRequest;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "startNetworkScan "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->logDebug(Ljava/lang/String;)V

    return v2

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method


# virtual methods
.method public analyzeScanResults(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/telephony/CellInfo;",
            ">;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIsScanActive:Z

    if-eqz v0, :cond_5

    if-nez p1, :cond_0

    goto/16 :goto_1

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->getIs4gScanEnabled()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    iget-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/CellInfo;

    iget-object v3, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mMccMncs:Ljava/util/List;

    invoke-virtual {p0, v2}, Lcom/android/ons/ONSNetworkScanCtlr;->getMccMnc(Landroid/telephony/CellInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    instance-of v3, v2, Landroid/telephony/CellInfoNr;

    if-eqz v3, :cond_2

    move-object v3, v2

    check-cast v3, Landroid/telephony/CellInfoNr;

    invoke-virtual {v3}, Landroid/telephony/CellInfoNr;->getCellSignalStrength()Landroid/telephony/CellSignalStrength;

    move-result-object v3

    check-cast v3, Landroid/telephony/CellSignalStrengthNr;

    invoke-virtual {v3}, Landroid/telephony/CellSignalStrengthNr;->getSsRsrp()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cell info ssRsrp: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/ons/ONSNetworkScanCtlr;->logDebug(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mSsRsrpEntryThreshold:I

    if-lt v3, v4, :cond_2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    iget-object v3, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    instance-of v3, v2, Landroid/telephony/CellInfoLte;

    if-eqz v3, :cond_1

    move-object v3, v2

    check-cast v3, Landroid/telephony/CellInfoLte;

    invoke-virtual {v3}, Landroid/telephony/CellInfoLte;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthLte;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/CellSignalStrengthLte;->getRsrp()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cell info rsrp: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/ons/ONSNetworkScanCtlr;->logDebug(Ljava/lang/String;)V

    iget v4, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mRsrpEntryThreshold:I

    if-lt v3, v4, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    const/4 v1, 0x1

    if-lt p1, v1, :cond_4

    iget-object p0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mNetworkAvailableCallBack:Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;

    if-eqz p0, :cond_4

    invoke-interface {p0, v0}, Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;->onNetworkAvailability(Ljava/util/List;)V

    :cond_4
    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :cond_5
    :goto_1
    return-void
.end method

.method createNetworkScanRequest(Ljava/util/ArrayList;I)Landroid/telephony/NetworkScanRequest;
    .locals 11
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;I)",
            "Landroid/telephony/NetworkScanRequest;"
        }
    .end annotation

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    new-instance v1, Landroid/util/ArraySet;

    invoke-direct {v1}, Landroid/util/ArraySet;-><init>()V

    invoke-direct {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->getIs4gScanEnabled()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x3

    const/4 v4, 0x6

    if-eqz v2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v2}, Landroid/telephony/AvailableNetworkInfo;->getMccMncs()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v2}, Landroid/telephony/AvailableNetworkInfo;->getRadioAccessSpecifiers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v3, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Landroid/telephony/AvailableNetworkInfo;->getBands()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_1
    invoke-virtual {v2}, Landroid/telephony/AvailableNetworkInfo;->getBands()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_2
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/RadioAccessSpecifier;

    invoke-virtual {v5}, Landroid/telephony/RadioAccessSpecifier;->getRadioAccessNetwork()I

    move-result v6

    iget-object v7, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_4

    if-ne v6, v3, :cond_4

    invoke-virtual {v5}, Landroid/telephony/RadioAccessSpecifier;->getBands()[I

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/stream/IntStream;->boxed()Ljava/util/stream/Stream;

    move-result-object v5

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v1, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_4
    if-ne v6, v4, :cond_3

    invoke-virtual {v5}, Landroid/telephony/RadioAccessSpecifier;->getBands()[I

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/stream/IntStream;->boxed()Ljava/util/stream/Stream;

    move-result-object v5

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v0, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_5
    iget-object p1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_6

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-ne p1, v5, :cond_6

    const/4 p1, 0x2

    goto :goto_2

    :cond_6
    move p1, v2

    :goto_2
    new-array v5, p1, [Landroid/telephony/RadioAccessSpecifier;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_7

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_7

    sget-object p1, Lcom/android/ons/ONSNetworkScanCtlr;->DEFAULT_5G_RAS:Landroid/telephony/RadioAccessSpecifier;

    aput-object p1, v5, v7

    iget-object p1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_a

    sget-object p1, Lcom/android/ons/ONSNetworkScanCtlr;->DEFAULT_4G_RAS:Landroid/telephony/RadioAccessSpecifier;

    aput-object p1, v5, v2

    goto :goto_3

    :cond_7
    iget-object v6, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    const/4 v9, 0x0

    if-eqz v6, :cond_8

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_8

    new-instance v6, Landroid/telephony/RadioAccessSpecifier;

    invoke-interface {v1}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v10, Lcom/android/ons/ONSNetworkScanCtlr$$ExternalSyntheticLambda0;

    invoke-direct {v10}, Lcom/android/ons/ONSNetworkScanCtlr$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v1, v10}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/stream/IntStream;->toArray()[I

    move-result-object v1

    invoke-direct {v6, v3, v1, v9}, Landroid/telephony/RadioAccessSpecifier;-><init>(I[I[I)V

    aput-object v6, v5, v7

    :cond_8
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_9

    sub-int/2addr p1, v2

    new-instance v1, Landroid/telephony/RadioAccessSpecifier;

    invoke-interface {v0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v2, Lcom/android/ons/ONSNetworkScanCtlr$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lcom/android/ons/ONSNetworkScanCtlr$$ExternalSyntheticLambda1;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/stream/IntStream;->toArray()[I

    move-result-object v0

    invoke-direct {v1, v4, v0, v9}, Landroid/telephony/RadioAccessSpecifier;-><init>(I[I[I)V

    aput-object v1, v5, p1

    goto :goto_3

    :cond_9
    iget-object p1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_a

    sget-object p1, Lcom/android/ons/ONSNetworkScanCtlr;->DEFAULT_5G_RAS:Landroid/telephony/RadioAccessSpecifier;

    aput-object p1, v5, v7

    :cond_a
    :goto_3
    new-instance p1, Landroid/telephony/NetworkScanRequest;

    const/4 v1, 0x1

    sget v4, Lcom/android/ons/ONSNetworkScanCtlr;->MAX_SEARCH_TIME:I

    const/4 v6, 0x0

    const/16 v7, 0xa

    move-object v0, p1

    move-object v2, v5

    move v3, p2

    move v5, v6

    move v6, v7

    move-object v7, v8

    invoke-direct/range {v0 .. v7}, Landroid/telephony/NetworkScanRequest;-><init>(I[Landroid/telephony/RadioAccessSpecifier;IIZILjava/util/ArrayList;)V

    iget-object p2, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    iput-object v8, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mMccMncs:Ljava/util/List;

    monitor-exit p2

    return-object p1

    :catchall_0
    move-exception p0

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method protected getMccMnc(Landroid/telephony/CellInfo;)Ljava/lang/String;
    .locals 1
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    instance-of p0, p1, Landroid/telephony/CellInfoLte;

    if-eqz p0, :cond_0

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    check-cast p1, Landroid/telephony/CellInfoLte;

    invoke-virtual {p1}, Landroid/telephony/CellInfoLte;->getCellIdentity()Landroid/telephony/CellIdentityLte;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/CellIdentityLte;->getMccString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/telephony/CellInfoLte;->getCellIdentity()Landroid/telephony/CellIdentityLte;

    move-result-object p1

    invoke-virtual {p1}, Landroid/telephony/CellIdentityLte;->getMncString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    instance-of p0, p1, Landroid/telephony/CellInfoNr;

    if-eqz p0, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    check-cast p1, Landroid/telephony/CellInfoNr;

    invoke-virtual {p1}, Landroid/telephony/CellInfoNr;->getCellIdentity()Landroid/telephony/CellIdentity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/CellIdentity;->getMccString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/telephony/CellInfoNr;->getCellIdentity()Landroid/telephony/CellIdentity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/telephony/CellIdentity;->getMncString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public init(Landroid/content/Context;Landroid/telephony/TelephonyManager;Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;)V
    .locals 2

    const-string v0, "init called"

    invoke-static {v0}, Lcom/android/ons/ONSNetworkScanCtlr;->log(Ljava/lang/String;)V

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ONSNetworkScanCtlr"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/android/ons/ONSNetworkScanCtlr$2;

    iget-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/ons/ONSNetworkScanCtlr$2;-><init>(Lcom/android/ons/ONSNetworkScanCtlr;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mHandler:Landroid/os/Handler;

    iput-object p2, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iput-object p3, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mNetworkAvailableCallBack:Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;

    const-string p2, "carrier_config"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/CarrierConfigManager;

    iput-object p1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->configManager:Landroid/telephony/CarrierConfigManager;

    return-void
.end method

.method setIs4gScanEnabled(Z)V
    .locals 0
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIs4gScanEnabled:Ljava/lang/Boolean;

    return-void
.end method

.method public startFastNetworkScan(Ljava/util/ArrayList;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;)Z"
        }
    .end annotation

    sget v0, Lcom/android/ons/ONSNetworkScanCtlr;->SEARCH_PERIODICITY_FAST:I

    invoke-virtual {p0, p1, v0}, Lcom/android/ons/ONSNetworkScanCtlr;->createNetworkScanRequest(Ljava/util/ArrayList;I)Landroid/telephony/NetworkScanRequest;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/ons/ONSNetworkScanCtlr;->startNetworkScan(Landroid/telephony/NetworkScanRequest;)Z

    move-result p0

    return p0
.end method

.method public stopNetworkScan()V
    .locals 4

    const-string v0, "stopNetworkScan"

    invoke-static {v0}, Lcom/android/ons/ONSNetworkScanCtlr;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIsScanActive:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mCurrentScan:Landroid/telephony/NetworkScan;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    :try_start_1
    invoke-virtual {v1}, Landroid/telephony/NetworkScan;->stopScan()V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Scan failed with exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/ons/ONSNetworkScanCtlr;->logDebug(Ljava/lang/String;)V

    :goto_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mIsScanActive:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mCurrentScan:Landroid/telephony/NetworkScan;

    iput-object v1, p0, Lcom/android/ons/ONSNetworkScanCtlr;->mCurrentScanRequest:Landroid/telephony/NetworkScanRequest;

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method
