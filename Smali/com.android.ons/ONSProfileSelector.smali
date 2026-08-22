.class public Lcom/android/ons/ONSProfileSelector;
.super Ljava/lang/Object;
.source "ONSProfileSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;,
        Lcom/android/ons/ONSProfileSelector$SortSubInfo;,
        Lcom/android/ons/ONSProfileSelector$SortAvailableNetworks;,
        Lcom/android/ons/ONSProfileSelector$SortAvailableNetworksInPriority;
    }
.end annotation


# static fields
.field public static final ACTION_SUB_SWITCH:Ljava/lang/String; = "android.intent.action.SUBSCRIPTION_SWITCH_REPLY"

.field private static final DBG:Z = true

.field private static final INVALID_SEQUENCE_ID:I = -0x1

.field private static final LOG_TAG:Ljava/lang/String; = "ONSProfileSelector"

.field private static final MSG_PROFILE_UPDATE:I = 0x1

.field private static final MSG_START_PROFILE_SELECTION:I = 0x2

.field private static final MSG_STOP_PROFILE_SELECTION:I = 0x4

.field private static final MSG_SUB_SWITCH_COMPLETE:I = 0x3

.field private static final START_SEQUENCE_ID:I = 0x1


# instance fields
.field private callbackStubs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mAvailableNetworkInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected mContext:Landroid/content/Context;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field protected mCurrentDataSubId:I
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field protected mEuiccManager:Landroid/telephony/euicc/EuiccManager;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field protected mHandler:Landroid/os/Handler;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private mIsEnabled:Z

.field private final mLock:Ljava/lang/Object;

.field protected mNetworkAvailableCallBack:Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

.field protected mNetworkScanCtlr:Lcom/android/ons/ONSNetworkScanCtlr;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field protected mOppSubscriptionInfos:Ljava/util/List;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/telephony/SubscriptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected mProfileChangeListener:Landroid/telephony/SubscriptionManager$OnOpportunisticSubscriptionsChangedListener;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field private mProfileSelectionCallback:Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;

.field private mSequenceId:I

.field protected mStandaloneOppSubInfos:Ljava/util/List;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/telephony/SubscriptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSubId:I

.field protected mSubscriptionBoundTelephonyManager:Landroid/telephony/TelephonyManager;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field protected mSubscriptionManager:Landroid/telephony/SubscriptionManager;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field protected mTelephonyManager:Landroid/telephony/TelephonyManager;
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation
.end field

.field mThread:Landroid/os/HandlerThread;


# direct methods
.method public static synthetic $r8$lambda$7L675UWQsHHRHaSTLsQSfVv-0ZI(Landroid/telephony/SubscriptionInfo;)Z
    .locals 0

    invoke-static {p0}, Lcom/android/ons/ONSProfileSelector;->lambda$updateOpportunisticSubscriptions$1(Landroid/telephony/SubscriptionInfo;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$HvtX2nmdJn1iWWWu1UJJpGH2zlY(Landroid/telephony/SubscriptionInfo;)Z
    .locals 0

    invoke-static {p0}, Lcom/android/ons/ONSProfileSelector;->lambda$updateOpportunisticSubscriptions$2(Landroid/telephony/SubscriptionInfo;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$dVu2afOKOn14vQdtuRBR2IuzNZk(Lcom/android/ons/ONSProfileSelector;Lcom/android/internal/telephony/ISetOpportunisticDataCallback;Ljava/lang/Integer;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->lambda$selectProfileForData$0(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;Ljava/lang/Integer;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmAvailableNetworkInfos(Lcom/android/ons/ONSProfileSelector;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmIsEnabled(Lcom/android/ons/ONSProfileSelector;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/ons/ONSProfileSelector;->mIsEnabled:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmLock(Lcom/android/ons/ONSProfileSelector;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmNetworkScanCallback(Lcom/android/ons/ONSProfileSelector;)Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmProfileSelectionCallback(Lcom/android/ons/ONSProfileSelector;)Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mProfileSelectionCallback:Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmAvailableNetworkInfos(Lcom/android/ons/ONSProfileSelector;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmNetworkScanCallback(Lcom/android/ons/ONSProfileSelector;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckProfileUpdate(Lcom/android/ons/ONSProfileSelector;[Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->checkProfileUpdate([Ljava/lang/Object;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$menableModem(Lcom/android/ons/ONSProfileSelector;IZ)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->enableModem(IZ)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$menableModemStackForNonOpportunisticSlots(Lcom/android/ons/ONSProfileSelector;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/ons/ONSProfileSelector;->enableModemStackForNonOpportunisticSlots()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetSignalLevel(Lcom/android/ons/ONSProfileSelector;Landroid/telephony/CellInfo;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->getSignalLevel(Landroid/telephony/CellInfo;)I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mlog(Lcom/android/ons/ONSProfileSelector;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->log(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlogDebug(Lcom/android/ons/ONSProfileSelector;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$monSubSwitchComplete(Lcom/android/ons/ONSProfileSelector;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->onSubSwitchComplete(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msendUpdateNetworksCallbackHelper(Lcom/android/ons/ONSProfileSelector;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mstopProfileSelectionProcess(Lcom/android/ons/ONSProfileSelector;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->stopProfileSelectionProcess(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mswitchToSubscription(Lcom/android/ons/ONSProfileSelector;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->switchToSubscription(II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/ons/ONSProfileSelector;->mIsEnabled:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/ons/ONSProfileSelector;->mCurrentDataSubId:I

    new-instance v0, Lcom/android/ons/ONSProfileSelector$1;

    invoke-direct {v0, p0}, Lcom/android/ons/ONSProfileSelector$1;-><init>(Lcom/android/ons/ONSProfileSelector;)V

    iput-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkAvailableCallBack:Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;

    new-instance v0, Lcom/android/ons/ONSProfileSelector$2;

    invoke-direct {v0, p0}, Lcom/android/ons/ONSProfileSelector$2;-><init>(Lcom/android/ons/ONSProfileSelector;)V

    iput-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mProfileChangeListener:Landroid/telephony/SubscriptionManager$OnOpportunisticSubscriptionsChangedListener;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/ons/ONSProfileSelector;->callbackStubs:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->init(Landroid/content/Context;Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;)V

    const-string p1, "ONSProfileSelector init complete"

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->log(Ljava/lang/String;)V

    return-void
.end method

.method private checkProfileUpdate([Ljava/lang/Object;)V
    .locals 11

    const/4 v0, 0x0

    aget-object v1, p1, v0

    check-cast v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    aget-object p1, p1, v2

    check-cast p1, Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    iget-object v3, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    const/16 v4, 0x8

    const/4 v5, 0x3

    const-wide/32 v6, 0x7c8ba7f

    if-nez v3, :cond_1

    const-string v0, "null subscription infos"

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    invoke-static {v6, v7}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1, v4}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, v5}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/ons/ONSProfileSelector;->getAvailableESIMPortIndex()I

    move-result v3

    const/4 v8, -0x1

    if-ne v3, v8, :cond_2

    const-string v0, "SIM port not available."

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    const/16 v0, 0xb

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    return-void

    :cond_2
    iget-object v8, p0, Lcom/android/ons/ONSProfileSelector;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    invoke-direct {p0, v1, v8}, Lcom/android/ons/ONSProfileSelector;->isSame(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v8

    const/4 v9, 0x2

    if-eqz v8, :cond_3

    const-string v0, "received duplicate requests"

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    invoke-direct {p0, v0, v9}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    return-void

    :cond_3
    invoke-direct {p0}, Lcom/android/ons/ONSProfileSelector;->stopProfileScanningPrecedure()V

    iput-boolean v2, p0, Lcom/android/ons/ONSProfileSelector;->mIsEnabled:Z

    iput-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    new-instance v8, Lcom/android/ons/ONSProfileSelector$SortAvailableNetworksInPriority;

    invoke-direct {v8, p0}, Lcom/android/ons/ONSProfileSelector$SortAvailableNetworksInPriority;-><init>(Lcom/android/ons/ONSProfileSelector;)V

    invoke-static {v1, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "availableNetworks: "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_9

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "opportunistic subscriptions size "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-direct {p0, v1, v4}, Lcom/android/ons/ONSProfileSelector;->getFilteredAvailableNetworks(Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v4, v2, :cond_8

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v4}, Landroid/telephony/AvailableNetworkInfo;->getMccMncs()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v4}, Landroid/telephony/AvailableNetworkInfo;->getMccMncs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_8

    :cond_4
    iget-object v4, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v5}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/telephony/SubscriptionManager;->isActiveSubId(I)Z

    move-result v4

    if-nez v4, :cond_5

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {p1}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result p1

    invoke-direct {p0, p1, v3}, Lcom/android/ons/ONSProfileSelector;->switchToSubscription(II)V

    goto :goto_3

    :cond_5
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v1}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v1

    invoke-direct {p0, v1, v2}, Lcom/android/ons/ONSProfileSelector;->enableModem(IZ)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_1

    :cond_6
    invoke-static {v6, v7}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_1

    :cond_7
    invoke-direct {p0, p1, v9}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :goto_1
    iget-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mProfileSelectionCallback:Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;

    invoke-interface {p1}, Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;->onProfileSelectionDone()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    goto :goto_3

    :cond_8
    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCtlr:Lcom/android/ons/ONSNetworkScanCtlr;

    invoke-virtual {p0, v1}, Lcom/android/ons/ONSNetworkScanCtlr;->startFastNetworkScan(Ljava/util/ArrayList;)Z

    goto :goto_3

    :cond_9
    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_b

    invoke-static {v6, v7}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-direct {p0, p1, v4}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_2

    :cond_a
    invoke-direct {p0, p1, v5}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :goto_2
    const-string p1, "stopping scan"

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCtlr:Lcom/android/ons/ONSNetworkScanCtlr;

    invoke-virtual {p0}, Lcom/android/ons/ONSNetworkScanCtlr;->stopNetworkScan()V

    :cond_b
    :goto_3
    return-void
.end method

.method private disableOpportunisticModem(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 4

    invoke-direct {p0}, Lcom/android/ons/ONSProfileSelector;->getActiveOpportunisticSubId()I

    move-result v0

    const/4 v1, -0x1

    const-wide/32 v2, 0x7c8ba7f

    if-ne v0, v1, :cond_1

    invoke-static {v2, v3}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :goto_0
    return-void

    :cond_1
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/android/ons/ONSProfileSelector;->enableModem(IZ)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0, p1, v1}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_1

    :cond_2
    invoke-static {v2, v3}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x5

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_1

    :cond_3
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :goto_1
    return-void
.end method

.method private enableModem(IZ)Z
    .locals 3

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v0, p1}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    if-nez p2, :cond_1

    iget-object v2, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v2}, Landroid/telephony/SubscriptionManager;->getPreferredDataSubscriptionId()I

    move-result v2

    if-ne v2, p1, :cond_1

    const p1, 0x7fffffff

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v1, v2}, Lcom/android/ons/ONSProfileSelector;->selectProfileForData(IZLcom/android/internal/telephony/ISetOpportunisticDataCallback;)V

    :cond_1
    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    move-result p1

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionBoundTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {p0, p1, p2}, Landroid/telephony/TelephonyManager;->enableModemForSlot(IZ)Z

    move-result p0

    return p0
.end method

.method private enableModemStackForNonOpportunisticSlots()V
    .locals 7

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_4

    iget-object v3, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v4, v1

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    move-result v5

    if-ne v5, v2, :cond_1

    move v4, v6

    goto :goto_1

    :cond_2
    if-nez v4, :cond_3

    iget-object v3, p0, Lcom/android/ons/ONSProfileSelector;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v3, v2, v6}, Landroid/telephony/TelephonyManager;->enableModemForSlot(IZ)Z

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private getActiveOpportunisticSubId()I
    .locals 3

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList(Z)Ljava/util/List;

    move-result-object p0

    const/4 v0, -0x1

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->isOpportunistic()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result p0

    return p0

    :cond_2
    return v0
.end method

.method private getFilteredAvailableNetworks(Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroid/telephony/SubscriptionInfo;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/android/ons/ONSProfileSelector$SortSubInfo;

    invoke-direct {v1, p0}, Lcom/android/ons/ONSProfileSelector$SortSubInfo;-><init>(Lcom/android/ons/ONSProfileSelector;)V

    invoke-static {p2, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v1, Lcom/android/ons/ONSProfileSelector$SortAvailableNetworks;

    invoke-direct {v1, p0}, Lcom/android/ons/ONSProfileSelector$SortAvailableNetworks;-><init>(Lcom/android/ons/ONSProfileSelector;)V

    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 p0, 0x0

    move v1, p0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p0, v2, :cond_2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v4

    invoke-virtual {v3}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v5

    if-ne v4, v5, :cond_1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    :cond_0
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v2

    invoke-virtual {v3}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v3

    if-ge v2, v3, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private getSignalLevel(Landroid/telephony/CellInfo;)I
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/telephony/CellInfo;->getCellSignalStrength()Landroid/telephony/CellSignalStrength;

    move-result-object p0

    invoke-virtual {p0}, Landroid/telephony/CellSignalStrength;->getLevel()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private getSubIdUsingAvailableNetworks(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/android/ons/ONSProfileSelector;->mLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v0}, Landroid/telephony/AvailableNetworkInfo;->getPriority()I

    move-result v1

    if-eq v1, p3, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/telephony/AvailableNetworkInfo;->getMccMncs()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result p0

    monitor-exit p2

    return p0

    :cond_3
    monitor-exit p2

    const/4 p0, -0x1

    return p0

    :catchall_0
    move-exception p0

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private isActiveSub(I)Z
    .locals 2

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList(Z)Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v1

    if-ne v1, p1, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0
.end method

.method private isAvtiveSub(I)Z
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {p0, p1}, Landroid/telephony/SubscriptionManager;->isActiveSubscriptionId(I)Z

    move-result p0

    return p0
.end method

.method private isOpportunisticSubEmbedded(Ljava/util/ArrayList;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;)Z"
        }
    .end annotation

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {p0}, Landroid/telephony/SubscriptionManager;->getOpportunisticSubscriptions()Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/AvailableNetworkInfo;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v3}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v4

    invoke-virtual {v1}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v5

    if-ne v4, v5, :cond_2

    invoke-virtual {v3}, Landroid/telephony/SubscriptionInfo;->isEmbedded()Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_3
    return v0
.end method

.method private isSame(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;)Z"
        }
    .end annotation

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private synthetic lambda$selectProfileForData$0(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;Ljava/lang/Integer;)V
    .locals 0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->sendSetOpptCallbackHelper(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V

    return-void
.end method

.method private static synthetic lambda$updateOpportunisticSubscriptions$1(Landroid/telephony/SubscriptionInfo;)Z
    .locals 1

    invoke-virtual {p0}, Landroid/telephony/SubscriptionInfo;->isGroupDisabled()Z

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static synthetic lambda$updateOpportunisticSubscriptions$2(Landroid/telephony/SubscriptionInfo;)Z
    .locals 0

    invoke-virtual {p0}, Landroid/telephony/SubscriptionInfo;->getGroupUuid()Landroid/os/ParcelUuid;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private log(Ljava/lang/String;)V
    .locals 0

    const-string p0, "ONSProfileSelector"

    invoke-static {p0, p1}, Lcom/android/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private logDebug(Ljava/lang/String;)V
    .locals 0

    const-string p0, "ONSProfileSelector"

    invoke-static {p0, p1}, Lcom/android/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private onSubSwitchComplete(I)V
    .locals 2

    iget v0, p0, Lcom/android/ons/ONSProfileSelector;->mSubId:I

    if-eq v0, p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->enableModem(IZ)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_0

    :cond_1
    const-wide/32 v0, 0x7c8ba7f

    invoke-static {v0, v1}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :goto_0
    iget-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mProfileSelectionCallback:Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;

    invoke-interface {p1}, Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;->onProfileSelectionDone()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mAvailableNetworkInfos:Ljava/util/ArrayList;

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

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V
    .locals 1

    if-nez p1, :cond_0

    const-string p1, "callback is null"

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->log(Ljava/lang/String;)V

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

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private stopProfileScanningPrecedure()V
    .locals 4

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/4 v3, 0x2

    invoke-direct {p0, v1, v3}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    iput-object v2, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    :cond_0
    iget-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCtlr:Lcom/android/ons/ONSNetworkScanCtlr;

    invoke-virtual {v1}, Lcom/android/ons/ONSNetworkScanCtlr;->stopNetworkScan()V

    iput-object v2, p0, Lcom/android/ons/ONSProfileSelector;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/ons/ONSProfileSelector;->mIsEnabled:Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private stopProfileSelectionProcess(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 1

    invoke-direct {p0}, Lcom/android/ons/ONSProfileSelector;->stopProfileScanningPrecedure()V

    const-string v0, "stopProfileSelection"

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->disableOpportunisticModem(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V

    return-void
.end method

.method private switchToSubscription(II)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SUBSCRIPTION_SWITCH_REPLY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mContext:Landroid/content/Context;

    const-class v2, Lcom/android/ons/OpportunisticNetworkService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-direct {p0}, Lcom/android/ons/ONSProfileSelector;->updateToken()V

    const-string v1, "sequenceId"

    iget v2, p0, Lcom/android/ons/ONSProfileSelector;->mSequenceId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "subId"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iput p1, p0, Lcom/android/ons/ONSProfileSelector;->mSubId:I

    iget-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mContext:Landroid/content/Context;

    const/4 v2, 0x1

    const/high16 v3, 0x44000000    # 512.0f

    invoke-static {v1, v2, v0, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    iget-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    const/16 p2, 0xb

    invoke-direct {p0, p1, p2}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    return-void

    :cond_0
    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mEuiccManager:Landroid/telephony/euicc/EuiccManager;

    invoke-virtual {p0, p1, p2, v0}, Landroid/telephony/euicc/EuiccManager;->switchToSubscription(IILandroid/app/PendingIntent;)V

    return-void
.end method

.method private updateToken()V
    .locals 2

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/android/ons/ONSProfileSelector;->mSequenceId:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/ons/ONSProfileSelector;->mSequenceId:I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public containStandaloneOppSubs(Ljava/util/ArrayList;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mStandaloneOppSubInfos:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p1, "received null subscription infos"

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Standalone opportunistic subInfos size "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/ons/ONSProfileSelector;->mStandaloneOppSubInfos:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mStandaloneOppSubInfos:Ljava/util/List;

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->getFilteredAvailableNetworks(Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method public containsOpportunisticSubs(Ljava/util/ArrayList;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p1, "received null subscription infos"

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "opportunistic subscriptions size "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-direct {p0, p1, v0}, Lcom/android/ons/ONSProfileSelector;->getFilteredAvailableNetworks(Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method protected getAvailableESIMPortIndex()I
    .locals 6
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v0}, Landroid/telephony/SubscriptionManager;->getCompleteActiveSubscriptionInfoList()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[getAvailableESIMPortIndex] subscriptionInfos size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->isEmbedded()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->isOpportunistic()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/telephony/SubscriptionInfo;->getPortIndex()I

    move-result p0

    return p0

    :cond_1
    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getUiccCardsInfo()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/UiccCardInfo;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[getAvailableESIMPortIndex] CardInfo: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/telephony/UiccCardInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/telephony/UiccCardInfo;->isEuicc()Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/android/ons/ONSProfileSelector;->mEuiccManager:Landroid/telephony/euicc/EuiccManager;

    invoke-virtual {v1}, Landroid/telephony/UiccCardInfo;->getCardId()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/telephony/euicc/EuiccManager;->createForCardId(I)Landroid/telephony/euicc/EuiccManager;

    move-result-object v2

    invoke-virtual {v1}, Landroid/telephony/UiccCardInfo;->getPorts()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/UiccPortInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[getAvailableESIMPortIndex] PortInfo: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/telephony/UiccPortInfo;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/telephony/UiccPortInfo;->getPortIndex()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/telephony/euicc/EuiccManager;->isSimPortAvailable(I)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v3}, Landroid/telephony/UiccPortInfo;->getPortIndex()I

    move-result p0

    return p0

    :cond_5
    const-string v0, "[getAvailableESIMPortIndex] No Port is available."

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0
.end method

.method protected getMcc(Landroid/telephony/CellInfo;)Ljava/lang/String;
    .locals 0
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    instance-of p0, p1, Landroid/telephony/CellInfoLte;

    if-eqz p0, :cond_0

    check-cast p1, Landroid/telephony/CellInfoLte;

    invoke-virtual {p1}, Landroid/telephony/CellInfoLte;->getCellIdentity()Landroid/telephony/CellIdentityLte;

    move-result-object p0

    invoke-virtual {p0}, Landroid/telephony/CellIdentityLte;->getMccString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    instance-of p0, p1, Landroid/telephony/CellInfoNr;

    if-eqz p0, :cond_1

    check-cast p1, Landroid/telephony/CellInfoNr;

    invoke-virtual {p1}, Landroid/telephony/CellInfoNr;->getCellIdentity()Landroid/telephony/CellIdentity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/telephony/CellIdentity;->getMccString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    const-string p0, ""

    :goto_0
    return-object p0
.end method

.method protected getMnc(Landroid/telephony/CellInfo;)Ljava/lang/String;
    .locals 0
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    instance-of p0, p1, Landroid/telephony/CellInfoLte;

    if-eqz p0, :cond_0

    check-cast p1, Landroid/telephony/CellInfoLte;

    invoke-virtual {p1}, Landroid/telephony/CellInfoLte;->getCellIdentity()Landroid/telephony/CellIdentityLte;

    move-result-object p0

    invoke-virtual {p0}, Landroid/telephony/CellIdentityLte;->getMncString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    instance-of p0, p1, Landroid/telephony/CellInfoNr;

    if-eqz p0, :cond_1

    check-cast p1, Landroid/telephony/CellInfoNr;

    invoke-virtual {p1}, Landroid/telephony/CellInfoNr;->getCellIdentity()Landroid/telephony/CellIdentity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/telephony/CellIdentity;->getMncString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    const-string p0, ""

    :goto_0
    return-object p0
.end method

.method public getOpprotunisticSubInfo(I)Landroid/telephony/SubscriptionInfo;
    .locals 3

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v2

    if-ne v2, p1, :cond_1

    return-object v0

    :cond_2
    :goto_0
    return-object v1
.end method

.method public getPreferredDataSubscriptionId()I
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {p0}, Landroid/telephony/SubscriptionManager;->getPreferredDataSubscriptionId()I

    move-result p0

    return p0
.end method

.method public hasOpprotunisticSub(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    if-eqz v1, :cond_4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/AvailableNetworkInfo;

    invoke-virtual {v1}, Landroid/telephony/AvailableNetworkInfo;->getSubId()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/ons/ONSProfileSelector;->isOpprotunisticSub(I)Z

    move-result v1

    if-nez v1, :cond_2

    return v0

    :cond_3
    const/4 p0, 0x1

    return p0

    :cond_4
    :goto_0
    return v0
.end method

.method protected init(Landroid/content/Context;Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;)V
    .locals 3
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mContext:Landroid/content/Context;

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/ons/ONSProfileSelector;->mSequenceId:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/ons/ONSProfileSelector;->mSubId:I

    iput-object p2, p0, Lcom/android/ons/ONSProfileSelector;->mProfileSelectionCallback:Lcom/android/ons/ONSProfileSelector$ONSProfileSelectionCallback;

    const-class p2, Landroid/telephony/TelephonyManager;

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/telephony/TelephonyManager;

    iput-object p2, p0, Lcom/android/ons/ONSProfileSelector;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    const v0, 0x7fffffff

    invoke-virtual {p2, v0}, Landroid/telephony/TelephonyManager;->createForSubscriptionId(I)Landroid/telephony/TelephonyManager;

    move-result-object p2

    iput-object p2, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionBoundTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object p2, p0, Lcom/android/ons/ONSProfileSelector;->mContext:Landroid/content/Context;

    const-class v0, Landroid/telephony/SubscriptionManager;

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/telephony/SubscriptionManager;

    iput-object p2, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    new-instance p2, Lcom/android/ons/ONSNetworkScanCtlr;

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionBoundTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkAvailableCallBack:Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;

    invoke-direct {p2, v0, v1, v2}, Lcom/android/ons/ONSNetworkScanCtlr;-><init>(Landroid/content/Context;Landroid/telephony/TelephonyManager;Lcom/android/ons/ONSNetworkScanCtlr$NetworkAvailableCallBack;)V

    iput-object p2, p0, Lcom/android/ons/ONSProfileSelector;->mNetworkScanCtlr:Lcom/android/ons/ONSNetworkScanCtlr;

    const-class p2, Landroid/telephony/euicc/EuiccManager;

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/telephony/euicc/EuiccManager;

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mEuiccManager:Landroid/telephony/euicc/EuiccManager;

    invoke-virtual {p0}, Lcom/android/ons/ONSProfileSelector;->updateOpportunisticSubscriptions()V

    new-instance p1, Landroid/os/HandlerThread;

    const-string p2, "ONSProfileSelector"

    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance p1, Lcom/android/ons/ONSProfileSelector$4;

    iget-object p2, p0, Lcom/android/ons/ONSProfileSelector;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/android/ons/ONSProfileSelector$4;-><init>(Lcom/android/ons/ONSProfileSelector;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mHandler:Landroid/os/Handler;

    iget-object p1, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    sget-object p2, Landroid/os/AsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mProfileChangeListener:Landroid/telephony/SubscriptionManager$OnOpportunisticSubscriptionsChangedListener;

    invoke-virtual {p1, p2, p0}, Landroid/telephony/SubscriptionManager;->addOnOpportunisticSubscriptionsChangedListener(Ljava/util/concurrent/Executor;Landroid/telephony/SubscriptionManager$OnOpportunisticSubscriptionsChangedListener;)V

    return-void
.end method

.method public isOpportunisticSubActive()Z
    .locals 4

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "received null subscription infos"

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "opportunistic subscriptions size "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/SubscriptionInfo;

    iget-object v3, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v2}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v2

    invoke-virtual {v3, v2}, Landroid/telephony/SubscriptionManager;->isActiveSubId(I)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_2
    return v1
.end method

.method public isOpprotunisticSub(I)Z
    .locals 2

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/SubscriptionInfo;

    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v0

    if-ne v0, p1, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_2
    :goto_0
    return v1
.end method

.method onSubSwitchComplete(Landroid/content/Intent;)V
    .locals 3

    const-string v0, "sequenceId"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "subId"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ACTION_SUB_SWITCH sequenceId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " mSequenceId: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/ons/ONSProfileSelector;->mSequenceId:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " mSubId: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/ons/ONSProfileSelector;->mSubId:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " subId: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method protected retrieveBestSubscription(Ljava/util/List;)I
    .locals 5
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/telephony/CellInfo;",
            ">;)I"
        }
    .end annotation

    new-instance v0, Lcom/android/ons/ONSProfileSelector$3;

    invoke-direct {v0, p0}, Lcom/android/ons/ONSProfileSelector$3;-><init>(Lcom/android/ons/ONSProfileSelector;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v0, 0x1

    :goto_0
    const/4 v1, 0x3

    const/4 v2, -0x1

    if-ge v0, v1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/CellInfo;

    invoke-virtual {p0, v3}, Lcom/android/ons/ONSProfileSelector;->getMcc(Landroid/telephony/CellInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3}, Lcom/android/ons/ONSProfileSelector;->getMnc(Landroid/telephony/CellInfo;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v4, v3, v0}, Lcom/android/ons/ONSProfileSelector;->getSubIdUsingAvailableNetworks(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    if-eq v3, v2, :cond_0

    return v3

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method public selectProfileForData(IZLcom/android/internal/telephony/ISetOpportunisticDataCallback;)V
    .locals 5

    const v0, 0x7fffffff

    const-wide/32 v1, 0x7c8ba7f

    if-eq p1, v0, :cond_3

    invoke-virtual {p0, p1}, Lcom/android/ons/ONSProfileSelector;->isOpprotunisticSub(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v0, p1}, Landroid/telephony/SubscriptionManager;->isActiveSubId(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Inactive sub passed for preferred data "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/android/ons/ONSProfileSelector;->log(Ljava/lang/String;)V

    invoke-static {v1, v2}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result p2

    const/4 v0, 0x2

    if-eqz p2, :cond_2

    invoke-virtual {p0, p1}, Lcom/android/ons/ONSProfileSelector;->isOpprotunisticSub(I)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-direct {p0, p3, v0}, Lcom/android/ons/ONSProfileSelector;->sendSetOpptCallbackHelper(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V

    goto :goto_1

    :cond_1
    const/4 p1, 0x3

    invoke-direct {p0, p3, p1}, Lcom/android/ons/ONSProfileSelector;->sendSetOpptCallbackHelper(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V

    goto :goto_1

    :cond_2
    invoke-direct {p0, p3, v0}, Lcom/android/ons/ONSProfileSelector;->sendSetOpptCallbackHelper(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V

    goto :goto_1

    :cond_3
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    iget-object v3, p0, Lcom/android/ons/ONSProfileSelector;->mHandler:Landroid/os/Handler;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/android/ons/ONSProfileSelector$$ExternalSyntheticLambda0;

    invoke-direct {v4, v3}, Lcom/android/ons/ONSProfileSelector$$ExternalSyntheticLambda0;-><init>(Landroid/os/Handler;)V

    new-instance v3, Lcom/android/ons/ONSProfileSelector$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, p3}, Lcom/android/ons/ONSProfileSelector$$ExternalSyntheticLambda1;-><init>(Lcom/android/ons/ONSProfileSelector;Lcom/android/internal/telephony/ISetOpportunisticDataCallback;)V

    invoke-virtual {v0, p1, p2, v4, v3}, Landroid/telephony/SubscriptionManager;->setPreferredDataSubscriptionId(IZLjava/util/concurrent/Executor;Ljava/util/function/Consumer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    iput p1, p0, Lcom/android/ons/ONSProfileSelector;->mCurrentDataSubId:I

    :goto_1
    return-void

    :catch_0
    move-exception v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setPreferredDataSubscriptionId failed. subId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", needValidation="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, ", ex="

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/ons/ONSProfileSelector;->log(Ljava/lang/String;)V

    invoke-static {v1, v2}, Landroid/compat/Compatibility;->isChangeEnabled(J)Z

    move-result p1

    if-eqz p1, :cond_4

    const/4 p1, 0x4

    invoke-direct {p0, p3, p1}, Lcom/android/ons/ONSProfileSelector;->sendSetOpptCallbackHelper(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V

    goto :goto_2

    :cond_4
    const/4 p1, 0x1

    invoke-direct {p0, p3, p1}, Lcom/android/ons/ONSProfileSelector;->sendSetOpptCallbackHelper(Lcom/android/internal/telephony/ISetOpportunisticDataCallback;I)V

    :goto_2
    return-void
.end method

.method public startProfileSelection(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 2
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

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startProfileSelection availableNetworks: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mHandler:Landroid/os/Handler;

    const/4 p2, 0x2

    invoke-static {p0, p2, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    return-void

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    const/4 p1, 0x3

    invoke-direct {p0, p2, p1}, Lcom/android/ons/ONSProfileSelector;->sendUpdateNetworksCallbackHelper(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;I)V

    :cond_2
    return-void
.end method

.method public stopProfileSelection(Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 1

    const-string v0, "stopProfileSelection"

    invoke-direct {p0, v0}, Lcom/android/ons/ONSProfileSelector;->logDebug(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/ons/ONSProfileSelector;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x4

    invoke-static {p0, v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method protected updateOpportunisticSubscriptions()V
    .locals 3
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Lcom/android/ons/ONSProfileSelector;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    invoke-virtual {v1}, Landroid/telephony/SubscriptionManager;->getOpportunisticSubscriptions()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lcom/android/ons/ONSProfileSelector$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lcom/android/ons/ONSProfileSelector$$ExternalSyntheticLambda2;-><init>()V

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    iput-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mOppSubscriptionInfos:Ljava/util/List;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lcom/android/ons/ONSProfileSelector$$ExternalSyntheticLambda3;

    invoke-direct {v2}, Lcom/android/ons/ONSProfileSelector$$ExternalSyntheticLambda3;-><init>()V

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    iput-object v1, p0, Lcom/android/ons/ONSProfileSelector;->mStandaloneOppSubInfos:Ljava/util/List;

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
