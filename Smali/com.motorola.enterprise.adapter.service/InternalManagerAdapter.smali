.class public final Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;
.super Ljava/lang/Object;
.source "InternalManagerAdapter.java"


# static fields
.field private static INSTANCE:Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;


# instance fields
.field private final mInternalManager:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :try_start_0
    const-string v0, "com.motorola.android.enterprise.managers.InternalEnterpriseManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Landroid/content/Context;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "error: InternalEnterpriseManager null"

    invoke-static {v0, p1}, Lcom/motorola/enterprise/adapter/service/enterprise/utils/EnterpriseLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->mInternalManager:Ljava/lang/Object;

    if-nez p1, :cond_0

    invoke-static {}, Lcom/motorola/enterprise/adapter/service/enterprise/utils/EnterpriseLogger;->log()V

    :cond_0
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;
    .locals 1

    sget-object v0, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->INSTANCE:Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;

    invoke-direct {v0, p0}, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->INSTANCE:Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;

    :cond_0
    sget-object p0, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->INSTANCE:Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;

    return-object p0
.end method


# virtual methods
.method public final getSerialNumber()Ljava/lang/String;
    .locals 4

    :try_start_0
    const-string v0, "com.motorola.android.enterprise.managers.InternalEnterpriseManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getSerialNumber"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->mInternalManager:Ljava/lang/Object;

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "error: getSerialNumberMethod"

    invoke-static {v0, p0}, Lcom/motorola/enterprise/adapter/service/enterprise/utils/EnterpriseLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string p0, ""

    return-object p0
.end method

.method public final isSecureHardware()Z
    .locals 4

    :try_start_0
    const-string v0, "com.motorola.android.enterprise.managers.InternalEnterpriseManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "isSecureHardware"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->mInternalManager:Ljava/lang/Object;

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const-string v0, "error: isSecureHardwareMethod"

    invoke-static {v0, p0}, Lcom/motorola/enterprise/adapter/service/enterprise/utils/EnterpriseLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final setSoftwareUpdatePreventionForAsc(Z)V
    .locals 6

    :try_start_0
    const-string v0, "com.motorola.android.enterprise.managers.InternalEnterpriseManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setSoftwareUpdatePreventionForAsc"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->mInternalManager:Ljava/lang/Object;

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "error: setSoftwareUpdatePreventionForAsc"

    invoke-static {p1, p0}, Lcom/motorola/enterprise/adapter/service/enterprise/utils/EnterpriseLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
