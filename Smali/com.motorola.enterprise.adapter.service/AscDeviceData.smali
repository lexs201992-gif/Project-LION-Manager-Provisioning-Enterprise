.class public final Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;
.super Ljava/lang/Object;
.source "AscDeviceData.java"


# instance fields
.field private ascVersion:Ljava/lang/String;

.field private blockSoftwareUpdateOverRecoveryMenu:Z

.field private campaignType:Ljava/lang/String;

.field private deploymentType:Ljava/lang/String;

.field private isAscDevice:Z

.field private maintenanceWindow:Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

.field private networkType:Ljava/lang/String;

.field private targetVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->isAscDevice:Z

    iput-object p2, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->targetVersion:Ljava/lang/String;

    iput-object p3, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->campaignType:Ljava/lang/String;

    iput-object p4, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->ascVersion:Ljava/lang/String;

    iput-object p5, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->deploymentType:Ljava/lang/String;

    iput-object p6, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->maintenanceWindow:Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    iput-object p7, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->networkType:Ljava/lang/String;

    iput-boolean p8, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->blockSoftwareUpdateOverRecoveryMenu:Z

    return-void
.end method


# virtual methods
.method public final getAscVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->ascVersion:Ljava/lang/String;

    return-object p0
.end method

.method public final getBlockSoftwareUpdateOverRecoveryMenu()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->blockSoftwareUpdateOverRecoveryMenu:Z

    return p0
.end method

.method public final getCampaignType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->campaignType:Ljava/lang/String;

    return-object p0
.end method

.method public final getDeploymentType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->deploymentType:Ljava/lang/String;

    return-object p0
.end method

.method public final getMaintenanceWindow()Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;
    .locals 0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->maintenanceWindow:Lcom/motorola/enterprise/adapter/service/asc/server/business/models/MaintenanceWindow;

    return-object p0
.end method

.method public final getNetworkType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->networkType:Ljava/lang/String;

    return-object p0
.end method

.method public final getTargetVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->targetVersion:Ljava/lang/String;

    return-object p0
.end method

.method public final isAscDevice()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/enterprise/adapter/service/asc/business/AscDeviceData;->isAscDevice:Z

    return p0
.end method
