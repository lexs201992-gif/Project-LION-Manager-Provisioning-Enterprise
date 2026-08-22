.class final Lcom/google/firebase/installations/GetAuthTokenListener;
.super Ljava/lang/Object;
.source "GetAuthTokenListener.java"

# interfaces
.implements Lcom/google/firebase/installations/StateListener;


# instance fields
.field private final resultTaskCompletionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/installations/InstallationTokenResult;",
            ">;"
        }
    .end annotation
.end field

.field private final utils:Lcom/google/firebase/installations/Utils;


# direct methods
.method public constructor <init>(Lcom/google/firebase/installations/Utils;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/installations/Utils;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/installations/InstallationTokenResult;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/installations/GetAuthTokenListener;->utils:Lcom/google/firebase/installations/Utils;

    iput-object p2, p0, Lcom/google/firebase/installations/GetAuthTokenListener;->resultTaskCompletionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final onException(Ljava/lang/Exception;)Z
    .locals 0

    iget-object p0, p0, Lcom/google/firebase/installations/GetAuthTokenListener;->resultTaskCompletionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetException(Ljava/lang/Exception;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public final onStateReached(Lcom/google/firebase/installations/local/PersistedInstallationEntry;)Z
    .locals 5

    invoke-virtual {p1}, Lcom/google/firebase/installations/local/PersistedInstallationEntry;->getRegistrationStatus()Lcom/google/firebase/installations/local/PersistedInstallation$RegistrationStatus;

    move-result-object v0

    sget-object v1, Lcom/google/firebase/installations/local/PersistedInstallation$RegistrationStatus;->REGISTERED:Lcom/google/firebase/installations/local/PersistedInstallation$RegistrationStatus;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/installations/GetAuthTokenListener;->utils:Lcom/google/firebase/installations/Utils;

    invoke-virtual {v0, p1}, Lcom/google/firebase/installations/Utils;->isAuthTokenExpired(Lcom/google/firebase/installations/local/PersistedInstallationEntry;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/firebase/installations/AutoValue_InstallationTokenResult$Builder;

    invoke-direct {v0}, Lcom/google/firebase/installations/AutoValue_InstallationTokenResult$Builder;-><init>()V

    invoke-virtual {p1}, Lcom/google/firebase/installations/local/PersistedInstallationEntry;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/installations/AutoValue_InstallationTokenResult$Builder;->setToken(Ljava/lang/String;)Lcom/google/firebase/installations/InstallationTokenResult$Builder;

    invoke-virtual {p1}, Lcom/google/firebase/installations/local/PersistedInstallationEntry;->getExpiresInSecs()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/google/firebase/installations/AutoValue_InstallationTokenResult$Builder;->setTokenExpirationTimestamp(J)Lcom/google/firebase/installations/InstallationTokenResult$Builder;

    invoke-virtual {p1}, Lcom/google/firebase/installations/local/PersistedInstallationEntry;->getTokenCreationEpochInSecs()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/google/firebase/installations/AutoValue_InstallationTokenResult$Builder;->setTokenCreationTimestamp(J)Lcom/google/firebase/installations/InstallationTokenResult$Builder;

    invoke-virtual {v0}, Lcom/google/firebase/installations/AutoValue_InstallationTokenResult$Builder;->build()Lcom/google/firebase/installations/InstallationTokenResult;

    move-result-object p1

    iget-object p0, p0, Lcom/google/firebase/installations/GetAuthTokenListener;->resultTaskCompletionSource:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return v2

    :cond_1
    return v3
.end method
