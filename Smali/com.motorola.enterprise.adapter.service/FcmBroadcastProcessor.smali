.class public final Lcom/google/firebase/iid/FcmBroadcastProcessor;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-iid@@21.0.1"


# static fields
.field public static final synthetic $r8$clinit:I

.field private static fcmServiceConn:Lcom/google/firebase/iid/WithinAppServiceConnection;
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field private static final lock:Ljava/lang/Object;


# instance fields
.field private final context:Landroid/content/Context;

.field private final executor:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->lock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->context:Landroid/content/Context;

    sget-object p1, Lcom/google/firebase/iid/FcmBroadcastProcessor$$Lambda$0;->$instance:Ljava/util/concurrent/Executor;

    iput-object p1, p0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private static bindToMessagingService(Landroid/content/Context;Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/Intent;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const-string v0, "FirebaseInstanceId"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "FirebaseInstanceId"

    const-string v1, "Binding to service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sget-object v0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/firebase/iid/FcmBroadcastProcessor;->fcmServiceConn:Lcom/google/firebase/iid/WithinAppServiceConnection;

    if-nez v1, :cond_1

    new-instance v1, Lcom/google/firebase/iid/WithinAppServiceConnection;

    invoke-direct {v1, p0}, Lcom/google/firebase/iid/WithinAppServiceConnection;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/google/firebase/iid/FcmBroadcastProcessor;->fcmServiceConn:Lcom/google/firebase/iid/WithinAppServiceConnection;

    :cond_1
    sget-object p0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->fcmServiceConn:Lcom/google/firebase/iid/WithinAppServiceConnection;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0, p1}, Lcom/google/firebase/iid/WithinAppServiceConnection;->sendIntent(Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {}, Lcom/google/firebase/iid/FirebaseIidExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object p1

    sget-object v0, Lcom/google/firebase/iid/FcmBroadcastProcessor$$Lambda$3;->$instance:Lcom/google/android/gms/tasks/Continuation;

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method static final synthetic lambda$startMessagingService$2$FcmBroadcastProcessor(Landroid/content/Context;Landroid/content/Intent;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x192

    if-eq v0, v1, :cond_0

    return-object p2

    :cond_0
    invoke-static {p0, p1}, Lcom/google/firebase/iid/FcmBroadcastProcessor;->bindToMessagingService(Landroid/content/Context;Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {}, Lcom/google/firebase/iid/FirebaseIidExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object p1

    sget-object p2, Lcom/google/firebase/iid/FcmBroadcastProcessor$$Lambda$4;->$instance:Lcom/google/android/gms/tasks/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final process(Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const-string v0, "gcm.rawData64"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v3, "rawData"

    invoke-static {v1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    const/16 v3, 0x1a

    if-lt v1, v3, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v1

    const/high16 v3, 0x10000000

    and-int/2addr v1, v3

    if-eqz v2, :cond_2

    if-nez v1, :cond_2

    invoke-static {v0, p1}, Lcom/google/firebase/iid/FcmBroadcastProcessor;->bindToMessagingService(Landroid/content/Context;Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    goto :goto_0

    :cond_2
    new-instance v1, Lcom/google/firebase/iid/FcmBroadcastProcessor$$Lambda$1;

    invoke-direct {v1, v0, p1}, Lcom/google/firebase/iid/FcmBroadcastProcessor$$Lambda$1;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object p0, p0, Lcom/google/firebase/iid/FcmBroadcastProcessor;->executor:Ljava/util/concurrent/Executor;

    invoke-static {p0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lcom/google/firebase/iid/FcmBroadcastProcessor$$Lambda$2;

    invoke-direct {v2, v0, p1}, Lcom/google/firebase/iid/FcmBroadcastProcessor$$Lambda$2;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {v1, p0, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    :goto_0
    return-object p0
.end method
