.class public Lcom/motorola/enterprise/adapter/service/asc/ota/receivers/UpdateRequestReceiver;
.super Landroid/content/BroadcastReceiver;
.source "UpdateRequestReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    new-instance p0, Lcom/motorola/enterprise/adapter/service/asc/server/services/ReqFirmwareUpdateSchedulerService;

    invoke-direct {p0}, Lcom/motorola/enterprise/adapter/service/asc/server/services/ReqFirmwareUpdateSchedulerService;-><init>()V

    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    const-string v0, "TARGET_VERSION"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "TRANSACTION_ID"

    const-wide/16 v1, -0x1

    invoke-virtual {p2, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :try_start_0
    const-string p2, "SERIAL_NUMBER"

    invoke-static {p1}, Lcom/motorola/enterprise/adapter/service/utils/DeviceAndBuildInformation;->getSerial(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    const-string v0, "Error in get Serial"

    invoke-static {v0, p2}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "RequestParams -> "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x3

    invoke-static {v0, p2}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(ILjava/lang/String;)V

    const-string p2, "ReqFirmwareUpdateSchedulerService enqueueJobStarted"

    const/4 v0, 0x0

    invoke-static {v0, p2}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(ILjava/lang/String;)V

    new-instance p2, Landroid/content/ComponentName;

    const-class v1, Lcom/motorola/enterprise/adapter/service/asc/server/services/ReqFirmwareUpdateSchedulerService;

    invoke-direct {p2, p1, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Landroid/app/job/JobInfo$Builder;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    new-instance p2, Landroid/os/PersistableBundle;

    invoke-direct {p2}, Landroid/os/PersistableBundle;-><init>()V

    const-string v3, "RETRY_COUNT"

    invoke-virtual {p2, v3, v0}, Landroid/os/PersistableBundle;->putInt(Ljava/lang/String;I)V

    invoke-static {p0}, Lcom/motorola/enterprise/adapter/service/utils/BundleConverter;->bundleToPersistableBundle(Landroid/os/Bundle;)Landroid/os/PersistableBundle;

    move-result-object p0

    const-string v3, "EXTRA_REQUEST_BUNDLE"

    invoke-virtual {p2, v3, p0}, Landroid/os/PersistableBundle;->putPersistableBundle(Ljava/lang/String;Landroid/os/PersistableBundle;)V

    invoke-virtual {v1, p2}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    invoke-virtual {v1, v2}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    const-class p2, Landroid/app/job/JobScheduler;

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/job/JobScheduler;

    invoke-virtual {p1, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Schedule REQUEST_FIRMWARE_UPDATE_JOB_ID status -> "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(ILjava/lang/String;)V

    return-void
.end method
