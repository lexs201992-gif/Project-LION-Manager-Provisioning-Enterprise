.class public final Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;
.super Ljava/lang/Object;
.source "FcmServerMain.java"


# static fields
.field private static INSTANCE:Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;


# instance fields
.field private final mInteractor:Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FcmServerInteractor;


# direct methods
.method private constructor <init>(Lcom/motorola/enterprise/adapter/service/fcm/server/gateways/FcmServerServiceImpl;Lcom/motorola/enterprise/adapter/service/fcm/storage/SaltStorage;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FcmServerInteractor;

    invoke-direct {v0, p1, p2}, Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FcmServerInteractor;-><init>(Lcom/motorola/enterprise/adapter/service/fcm/server/gateways/FcmServerServiceImpl;Lcom/motorola/enterprise/adapter/service/fcm/storage/SaltStorage;)V

    iput-object v0, p0, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;->mInteractor:Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FcmServerInteractor;

    return-void
.end method

.method public static getInstance(Lcom/motorola/enterprise/adapter/service/fcm/server/gateways/FcmServerServiceImpl;Lcom/motorola/enterprise/adapter/service/fcm/storage/SaltStorage;)Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;
    .locals 1

    sget-object v0, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;->INSTANCE:Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;

    if-nez v0, :cond_0

    new-instance v0, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;

    invoke-direct {v0, p0, p1}, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;-><init>(Lcom/motorola/enterprise/adapter/service/fcm/server/gateways/FcmServerServiceImpl;Lcom/motorola/enterprise/adapter/service/fcm/storage/SaltStorage;)V

    sput-object v0, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;->INSTANCE:Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;

    :cond_0
    sget-object p0, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;->INSTANCE:Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;

    return-object p0
.end method


# virtual methods
.method public final registerDevice(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    new-instance v0, Lcom/motorola/enterprise/adapter/service/fcm/server/business/models/Device;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/motorola/enterprise/adapter/service/fcm/server/business/models/Device;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;->mInteractor:Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FcmServerInteractor;

    invoke-virtual {p0, v0}, Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FcmServerInteractor;->registerDevice(Lcom/motorola/enterprise/adapter/service/fcm/server/business/models/Device;)V

    return-void
.end method

.method public final verifyDevice(Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/fcm/server/FcmServerMain;->mInteractor:Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FcmServerInteractor;

    invoke-virtual {p0, p1}, Lcom/motorola/enterprise/adapter/service/fcm/server/business/interactor/FcmServerInteractor;->verifyDevice(Ljava/lang/String;)V

    return-void
.end method
