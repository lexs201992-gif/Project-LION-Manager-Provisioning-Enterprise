.class public final Lcom/motorola/enterprise/adapter/service/enterprise/utils/EnterpriseLogger;
.super Ljava/lang/Object;
.source "EnterpriseLogger.java"


# static fields
.field private static final IS_DEBUGGABLE:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/motorola/enterprise/adapter/service/utils/DeviceAndBuildInformation;->isDebuggable()Z

    move-result v0

    sput-boolean v0, Lcom/motorola/enterprise/adapter/service/enterprise/utils/EnterpriseLogger;->IS_DEBUGGABLE:Z

    return-void
.end method

.method public static log()V
    .locals 2

    const-string v0, "EASEnteprise"

    const-string v1, "error: InternalEnterpriseManager null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const-string v0, "EASEnteprise"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
