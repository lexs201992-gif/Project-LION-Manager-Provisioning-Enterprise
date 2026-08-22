.class public final Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;
.super Ljava/lang/Object;
.source "AscServerInteractor.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

.field private final mService:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;


# direct methods
.method public static $r8$lambda$5Hpy9ZTJdLSIc_Cwt-MtAxOqCag(Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;Ljava/lang/String;ILcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;I)V
    .locals 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    if-ne p4, v0, :cond_1

    add-int/lit8 p2, p2, 0x1

    const/4 p3, 0x3

    if-le p2, p3, :cond_0

    const/4 p0, 0x0

    const-string p1, "Max attempts of request to get asc info"

    invoke-static {p0, p1}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(ILjava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p3, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda1;

    invoke-direct {p3, p0, p1, p2}, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;Ljava/lang/String;I)V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mService:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;

    invoke-virtual {p0, p3, p1}, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;->getAscInfo(Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda1;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    if-nez p4, :cond_2

    if-eqz p3, :cond_2

    new-instance p1, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;

    invoke-virtual {p3}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->isAscDevice()Z

    move-result v1

    invoke-virtual {p3}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->getTargetVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->getCampaignType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->getAscVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->getDeploymentType()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->maintenanceWindow:Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    invoke-virtual {p3}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->getNetworkType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p3}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->getBlockSoftwareUpdateOverRecoveryMenu()Z

    move-result v8

    move-object v0, p1

    invoke-direct/range {v0 .. v8}, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;Ljava/lang/String;Z)V

    iget-object p2, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-virtual {p2, p1}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;->saveData(Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;)V

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string p2, "com.motorola.asc.ACTION_ASC_SYSTEM_UPDATE_POLICY_CHANGED"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/16 p2, 0x20

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mContext:Landroid/content/Context;

    const-string p2, "com.motorola.enterprise.asc.permission.INTERACT_ASC_SERVICE"

    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->getInstance(Landroid/content/Context;)Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;

    move-result-object p0

    invoke-virtual {p3}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/AscInfoResponse;->getBlockSoftwareUpdateOverRecoveryMenu()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->setSoftwareUpdatePreventionForAsc(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public static $r8$lambda$I_yV3OkwwQmftEUE6OMBli0Lq50(Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;Lcom/motorola/enterprise/adapter/service/asc/server/business/models/UpdateInfoResponse;I)V
    .locals 6

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mContext:Landroid/content/Context;

    const/4 v0, 0x3

    const/4 v1, 0x2

    const-wide/16 v2, -0x1

    if-nez p2, :cond_3

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/UpdateInfoResponse;->getTransactionId()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {p1}, Lcom/motorola/enterprise/adapter/service/asc/server/business/models/UpdateInfoResponse;->getStatus()I

    move-result p1

    cmp-long p2, v4, v2

    if-nez p2, :cond_0

    const/4 p1, 0x5

    goto :goto_0

    :cond_0
    invoke-static {v4, v5}, Lcom/motorola/enterprise/adapter/service/asc/TransactionsMemoryStore;->isTimeoutTransactionId(J)Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p0, "TRANSACTION ID TIMEOUT"

    invoke-static {v1, p0}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(ILjava/lang/String;)V

    goto :goto_3

    :cond_1
    if-ne p1, v1, :cond_2

    new-instance p2, Lcom/motorola/enterprise/adapter/service/asc/server/services/RequestAscInfoSchedulerService;

    invoke-direct {p2}, Lcom/motorola/enterprise/adapter/service/asc/server/services/RequestAscInfoSchedulerService;-><init>()V

    invoke-static {p0}, Lcom/motorola/enterprise/adapter/service/asc/server/services/RequestAscInfoSchedulerService;->enqueueJob(Landroid/content/Context;)V

    :cond_2
    :goto_0
    move-wide v2, v4

    goto :goto_2

    :cond_3
    if-eq p2, v1, :cond_5

    const/4 p1, 0x1

    if-ne p2, p1, :cond_4

    goto :goto_1

    :cond_4
    const/4 p1, 0x4

    goto :goto_2

    :cond_5
    :goto_1
    move p1, v0

    :goto_2
    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    const-string v1, "TRANSACTION_ID"

    invoke-virtual {p2, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "EXTRA_ASC_RESULT"

    invoke-virtual {p2, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "com.motorola.enterprise.asc.ACTION_ASC_SESSION_DONE"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v1, 0x20

    invoke-virtual {p2, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v1, "com.motorola.enterprise.asc.permission.INTERACT_ASC_SERVICE"

    invoke-virtual {p0, p2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "UpdateStatus -> "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(ILjava/lang/String;)V

    :goto_3
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/motorola/enterprise/adapter/service/jwt/storage/sharedpref/TokenSharedPrefStorage;

    invoke-direct {v0, p1}, Lcom/motorola/enterprise/adapter/service/jwt/storage/sharedpref/TokenSharedPrefStorage;-><init>(Landroid/content/Context;)V

    invoke-static {p1, v0}, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;->getInstance(Landroid/content/Context;Lcom/motorola/enterprise/adapter/service/jwt/storage/sharedpref/TokenSharedPrefStorage;)Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;

    move-result-object v0

    iput-object v0, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mService:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;

    new-instance v0, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    invoke-direct {v0, p1}, Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mDeviceInfoStorage:Lcom/motorola/enterprise/adapter/service/asc/services/sharedpref/AscSharedPrefStorage;

    return-void
.end method


# virtual methods
.method public final handleGetAscInfoRequest(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda1;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;Ljava/lang/String;I)V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mService:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;

    invoke-virtual {p0, v0, p1}, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;->getAscInfo(Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda1;Ljava/lang/String;)V

    return-void
.end method

.method public final handleUpdateAllowedRequest(Lcom/motorola/enterprise/adapter/service/asc/server/business/models/UpdateInfoRequest;)V
    .locals 1

    new-instance v0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;)V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor;->mService:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;

    invoke-virtual {p0, v0, p1}, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerServiceImpl;->getUpdateAllowed(Lcom/motorola/enterprise/adapter/service/asc/server/business/interactor/AscServerInteractor$$ExternalSyntheticLambda0;Lcom/motorola/enterprise/adapter/service/asc/server/business/models/UpdateInfoRequest;)V

    return-void
.end method
