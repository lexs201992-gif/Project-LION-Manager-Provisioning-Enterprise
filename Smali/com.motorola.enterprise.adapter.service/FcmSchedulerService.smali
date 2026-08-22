.class public Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;
.super Landroid/app/job/JobService;
.source "FcmSchedulerService.java"


# static fields
.field private static ACTUAL_ATTEMPT:I = 0x1


# direct methods
.method public static $r8$lambda$HBed0Vg88l6YFF08J6xKoFPLRtU(Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;Landroid/app/job/JobParameters;)V
    .locals 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_0
    invoke-static {}, Lcom/google/firebase/FirebaseApp;->getInstance()Lcom/google/firebase/FirebaseApp;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/motorola/enterprise/adapter/service/utils/DeviceAndBuildInformation;->isDebuggable()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Error in get firebase app instance"

    invoke-static {v1, v0}, Lcom/motorola/enterprise/adapter/service/fcm/utils/FcmLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :try_start_1
    new-instance v0, Lcom/google/firebase/FirebaseOptions$Builder;

    invoke-direct {v0}, Lcom/google/firebase/FirebaseOptions$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseOptions$Builder;->setApplicationId()V

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseOptions$Builder;->setProjectId()V

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseOptions$Builder;->setApiKey()V

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseOptions$Builder;->build()Lcom/google/firebase/FirebaseOptions;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/firebase/FirebaseApp;->initializeApp(Landroid/content/Context;Lcom/google/firebase/FirebaseOptions;)Lcom/google/firebase/FirebaseApp;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "Error in initialize firebase app"

    invoke-static {v1, v0}, Lcom/motorola/enterprise/adapter/service/fcm/utils/FcmLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    sget v0, Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;->ACTUAL_ATTEMPT:I

    const/4 v1, 0x3

    if-le v0, v1, :cond_1

    const/4 v0, 0x0

    const-string v1, "Max attempts to request token"

    invoke-static {v0, v1}, Lcom/motorola/enterprise/adapter/service/fcm/utils/FcmLogger;->log(ILjava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    goto :goto_1

    :cond_1
    new-instance v0, Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService$$ExternalSyntheticLambda1;-><init>(Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;Landroid/app/job/JobParameters;)V

    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->getInstance()Lcom/google/firebase/messaging/FirebaseMessaging;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/firebase/messaging/FirebaseMessaging;->getToken()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance p1, Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FirebaseMessagingInteractor$$ExternalSyntheticLambda0;

    invoke-direct {p1, v0}, Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FirebaseMessagingInteractor$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService$$ExternalSyntheticLambda1;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FirebaseMessagingInteractor$$ExternalSyntheticLambda0;)V

    :goto_1
    return-void
.end method

.method public static $r8$lambda$INP0SYp5hoSqOQqUjJHpl0Ymy4M(Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;Landroid/app/job/JobParameters;Ljava/lang/String;I)V
    .locals 6

    if-nez p3, :cond_0

    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Lcom/motorola/enterprise/adapter/service/utils/DeviceAndBuildInformation;->getSerial(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :try_start_0
    const-string v1, "PBKDF2WithHmacSHA256"

    invoke-static {v1}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v1

    new-instance v2, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {p3}, Ljava/lang/String;->toCharArray()[C

    move-result-object p3

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    const/16 v3, 0x3e8

    const/16 v4, 0x100

    invoke-direct {v2, p3, v0, v3, v4}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    invoke-virtual {v1, v2}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object p3

    invoke-static {}, Ljava/util/Base64;->getUrlEncoder()Ljava/util/Base64$Encoder;

    move-result-object v0

    invoke-interface {p3}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object p3

    invoke-virtual {v0, p3}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/enterprise/adapter/service/utils/DeviceAndBuildInformation;->getSerial(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/telephony/TelephonyManager;->getImei(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcom/motorola/enterprise/adapter/service/fcm/server/gateways/FcmServerServiceImpl;

    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/motorola/enterprise/adapter/service/fcm/server/gateways/FcmServerServiceImpl;-><init>(Landroid/content/Context;)V

    new-instance v4, Lcom/motorola/enterprise/adapter/service/fcm/storage/SaltStorage;

    invoke-virtual {p0}, Landroid/app/job/JobService;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/motorola/enterprise/adapter/service/fcm/storage/SaltStorage;-><init>(Landroid/content/Context;)V

    invoke-static {v3, v4}, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;->getInstance(Lcom/motorola/enterprise/adapter/service/fcm/server/gateways/FcmServerServiceImpl;Lcom/motorola/enterprise/adapter/service/fcm/storage/SaltStorage;)Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;

    move-result-object v3

    invoke-virtual {v3, v1, v0, p3, p2}, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;->registerDevice(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v2}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "DeviceAndBuildInformation"

    const-string p2, "Cannot hash device id"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget p2, Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;->ACTUAL_ATTEMPT:I

    const/4 p3, 0x1

    add-int/2addr p2, p3

    sput p2, Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;->ACTUAL_ATTEMPT:I

    invoke-virtual {p0, p1, p3}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    return-void
.end method

.method public static enqueueJob(Landroid/content/Context;)V
    .locals 5

    const/4 v0, 0x0

    const-string v1, "FcmSchedulerService enqueueJobStarted"

    invoke-static {v0, v1}, Lcom/motorola/enterprise/adapter/service/fcm/utils/FcmLogger;->log(ILjava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v2, Landroid/app/job/JobInfo$Builder;

    const/4 v3, 0x1

    invoke-direct {v2, v3, v1}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    new-instance v1, Landroid/os/PersistableBundle;

    invoke-direct {v1}, Landroid/os/PersistableBundle;-><init>()V

    const-string v4, "RETRY_COUNT"

    invoke-virtual {v1, v4, v0}, Landroid/os/PersistableBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v2, v1}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    invoke-virtual {v2, v3}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v1

    const-class v2, Landroid/app/job/JobScheduler;

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/job/JobScheduler;

    invoke-virtual {p0, v1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Schedule FCM_JOB_ID status -> "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/enterprise/adapter/service/fcm/utils/FcmLogger;->log(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final onCreate()V
    .locals 1

    invoke-super {p0}, Landroid/app/job/JobService;->onCreate()V

    const/4 p0, 0x3

    const-string v0, "FcmSchedulerService onCreate!"

    invoke-static {p0, v0}, Lcom/motorola/enterprise/adapter/service/fcm/utils/FcmLogger;->log(ILjava/lang/String;)V

    return-void
.end method

.method public final onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 2

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService$$ExternalSyntheticLambda0;-><init>(Lcom/motorola/enterprise/adapter/service/fcm/services/FcmSchedulerService;Landroid/app/job/JobParameters;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
