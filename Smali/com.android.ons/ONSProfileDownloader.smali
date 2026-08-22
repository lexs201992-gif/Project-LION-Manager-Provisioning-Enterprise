.class public Lcom/android/ons/ONSProfileDownloader;
.super Ljava/lang/Object;
.source "ONSProfileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ons/ONSProfileDownloader$IONSProfileDownloaderListener;,
        Lcom/android/ons/ONSProfileDownloader$DownloadHandler;,
        Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;,
        Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;
    }
.end annotation


# static fields
.field public static final ACTION_ONS_ESIM_DOWNLOAD:Ljava/lang/String; = "com.android.ons.action.ESIM_DOWNLOAD"

.field protected static final PARAM_PRIMARY_SUBID:Ljava/lang/String; = "PrimarySubscriptionID"
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field protected static final PARAM_REQUEST_TYPE:Ljava/lang/String; = "REQUEST"
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field protected static final REQUEST_CODE_DOWNLOAD_SUB:I = 0x1
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "com.android.ons.ONSProfileDownloader"


# instance fields
.field private final mCarrierConfigManager:Landroid/telephony/CarrierConfigManager;

.field private final mContext:Landroid/content/Context;

.field private mDownloadingPSimSubId:I

.field private final mEuiccManager:Landroid/telephony/euicc/EuiccManager;

.field private final mHandler:Landroid/os/Handler;

.field private mListener:Lcom/android/ons/ONSProfileDownloader$IONSProfileDownloaderListener;

.field private final mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;


# direct methods
.method static bridge synthetic -$$Nest$fgetmListener(Lcom/android/ons/ONSProfileDownloader;)Lcom/android/ons/ONSProfileDownloader$IONSProfileDownloaderListener;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileDownloader;->mListener:Lcom/android/ons/ONSProfileDownloader$IONSProfileDownloaderListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmDownloadingPSimSubId(Lcom/android/ons/ONSProfileDownloader;I)V
    .locals 0

    iput p1, p0, Lcom/android/ons/ONSProfileDownloader;->mDownloadingPSimSubId:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetUnresolvableErrorDescription(Lcom/android/ons/ONSProfileDownloader;I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileDownloader;->getUnresolvableErrorDescription(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfgetTAG()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/ons/ONSProfileDownloader;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/telephony/CarrierConfigManager;Landroid/telephony/euicc/EuiccManager;Lcom/android/ons/ONSProfileConfigurator;Lcom/android/ons/ONSProfileDownloader$IONSProfileDownloaderListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/ons/ONSProfileDownloader;->mContext:Landroid/content/Context;

    iput-object p5, p0, Lcom/android/ons/ONSProfileDownloader;->mListener:Lcom/android/ons/ONSProfileDownloader$IONSProfileDownloaderListener;

    iput-object p3, p0, Lcom/android/ons/ONSProfileDownloader;->mEuiccManager:Landroid/telephony/euicc/EuiccManager;

    iput-object p4, p0, Lcom/android/ons/ONSProfileDownloader;->mONSProfileConfig:Lcom/android/ons/ONSProfileConfigurator;

    iput-object p2, p0, Lcom/android/ons/ONSProfileDownloader;->mCarrierConfigManager:Landroid/telephony/CarrierConfigManager;

    new-instance p1, Lcom/android/ons/ONSProfileDownloader$DownloadHandler;

    invoke-direct {p1, p0}, Lcom/android/ons/ONSProfileDownloader$DownloadHandler;-><init>(Lcom/android/ons/ONSProfileDownloader;)V

    iput-object p1, p0, Lcom/android/ons/ONSProfileDownloader;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method protected static decodeSmdxSubjectAndReasonCode(I)Landroid/util/Pair;
    .locals 4
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x6

    if-ge v1, v2, :cond_0

    and-int/lit8 v2, p0, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    ushr-int/lit8 p0, p0, 0x4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "^(0\\.)*"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method private getSMDPServerAddress(I)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileDownloader;->mCarrierConfigManager:Landroid/telephony/CarrierConfigManager;

    invoke-virtual {p0, p1}, Landroid/telephony/CarrierConfigManager;->getConfigForSubId(I)Landroid/os/PersistableBundle;

    move-result-object p0

    const-string p1, "smdp_server_address_string"

    invoke-virtual {p0, p1}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getUnresolvableErrorDescription(I)Ljava/lang/String;
    .locals 0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    const-string p0, "Unknown"

    return-object p0

    :pswitch_1
    const-string p0, "ERROR_NO_PROFILES_AVAILABLE"

    return-object p0

    :pswitch_2
    const-string p0, "ERROR_CERTIFICATE_ERROR"

    return-object p0

    :pswitch_3
    const-string p0, "ERROR_ADDRESS_MISSING"

    return-object p0

    :pswitch_4
    const-string p0, "ERROR_INSTALL_PROFILE"

    return-object p0

    :pswitch_5
    const-string p0, "ERROR_SIM_MISSING"

    return-object p0

    :pswitch_6
    const-string p0, "ERROR_UNSUPPORTED_VERSION"

    return-object p0

    :pswitch_7
    const-string p0, "ERROR_INVALID_ACTIVATION_CODE"

    return-object p0

    :pswitch_8
    const-string p0, "ERROR_CARRIER_LOCKED"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x2710
        :pswitch_8
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method protected downloadProfile(I)Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;
    .locals 5

    sget-object v0, Lcom/android/ons/ONSProfileDownloader;->TAG:Ljava/lang/String;

    const-string v1, "downloadProfile"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileDownloader;->getSMDPServerAddress(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_0

    goto :goto_0

    :cond_0
    monitor-enter p0

    :try_start_0
    iget v2, p0, Lcom/android/ons/ONSProfileDownloader;->mDownloadingPSimSubId:I

    if-ne v2, p1, :cond_1

    const-string p1, "Download already in progress."

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p1, Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;->DUPLICATE_REQUEST:Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;

    monitor-exit p0

    return-object p1

    :cond_1
    iput p1, p0, Lcom/android/ons/ONSProfileDownloader;->mDownloadingPSimSubId:I

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "1$"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "$"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/ons/ONSProfileDownloader;->mContext:Landroid/content/Context;

    const-class v4, Lcom/android/ons/ONSProfileResultReceiver;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "com.android.ons.action.ESIM_DOWNLOAD"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v3, "REQUEST"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v3, "PrimarySubscriptionID"

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/android/ons/ONSProfileDownloader;->mContext:Landroid/content/Context;

    const/high16 v3, 0x2000000

    invoke-static {p1, v4, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    const-string v2, "Download Request sent to EUICC Manager"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p0, p0, Lcom/android/ons/ONSProfileDownloader;->mEuiccManager:Landroid/telephony/euicc/EuiccManager;

    invoke-static {v1}, Landroid/telephony/euicc/DownloadableSubscription;->forActivationCode(Ljava/lang/String;)Landroid/telephony/euicc/DownloadableSubscription;

    move-result-object v0

    invoke-virtual {p0, v0, v4, p1}, Landroid/telephony/euicc/EuiccManager;->downloadSubscription(Landroid/telephony/euicc/DownloadableSubscription;ZLandroid/app/PendingIntent;)V

    sget-object p0, Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;->SUCCESS:Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;

    return-object p0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    :goto_0
    sget-object p0, Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;->INVALID_SMDP_ADDRESS:Lcom/android/ons/ONSProfileDownloader$DownloadProfileResult;

    return-object p0
.end method

.method public onCallbackIntentReceived(Landroid/content/Intent;I)V
    .locals 2

    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    iput p2, v0, Landroid/os/Message;->arg1:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p0, p0, Lcom/android/ons/ONSProfileDownloader;->mHandler:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
