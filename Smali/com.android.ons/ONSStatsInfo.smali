.class public final Lcom/android/ons/ONSStatsInfo;
.super Ljava/lang/Object;
.source "ONSStatsInfo.java"


# static fields
.field public static final INVALID_VALUE:I = -0x1


# instance fields
.field private mDetailedErrCode:I

.field private mDownloadResult:Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

.field private mIsProvisioningResultUpdated:Z

.field private mIsWifiConnected:Z

.field private mOppSimCarrierId:I

.field private mPrimarySimSubId:I

.field private mProvisioningResult:Lcom/android/ons/ONSProfileActivator$Result;

.field private mRetryCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/ons/ONSStatsInfo;->mProvisioningResult:Lcom/android/ons/ONSProfileActivator$Result;

    iput-object v0, p0, Lcom/android/ons/ONSStatsInfo;->mDownloadResult:Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/ons/ONSStatsInfo;->mPrimarySimSubId:I

    iput v0, p0, Lcom/android/ons/ONSStatsInfo;->mOppSimCarrierId:I

    iput v0, p0, Lcom/android/ons/ONSStatsInfo;->mRetryCount:I

    iput v0, p0, Lcom/android/ons/ONSStatsInfo;->mDetailedErrCode:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/ons/ONSStatsInfo;->mIsWifiConnected:Z

    iput-boolean v0, p0, Lcom/android/ons/ONSStatsInfo;->mIsProvisioningResultUpdated:Z

    return-void
.end method


# virtual methods
.method public getDetailedErrCode()I
    .locals 0

    iget p0, p0, Lcom/android/ons/ONSStatsInfo;->mDetailedErrCode:I

    return p0
.end method

.method public getDownloadResult()Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSStatsInfo;->mDownloadResult:Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    return-object p0
.end method

.method public getOppSimCarrierId()I
    .locals 0

    iget p0, p0, Lcom/android/ons/ONSStatsInfo;->mOppSimCarrierId:I

    return p0
.end method

.method public getPrimarySimSubId()I
    .locals 0

    iget p0, p0, Lcom/android/ons/ONSStatsInfo;->mPrimarySimSubId:I

    return p0
.end method

.method public getProvisioningResult()Lcom/android/ons/ONSProfileActivator$Result;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSStatsInfo;->mProvisioningResult:Lcom/android/ons/ONSProfileActivator$Result;

    return-object p0
.end method

.method public getRetryCount()I
    .locals 0

    iget p0, p0, Lcom/android/ons/ONSStatsInfo;->mRetryCount:I

    return p0
.end method

.method public isProvisioningResultUpdated()Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/ons/ONSStatsInfo;->mIsProvisioningResultUpdated:Z

    return p0
.end method

.method public isWifiConnected()Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/ons/ONSStatsInfo;->mIsWifiConnected:Z

    return p0
.end method

.method public setDetailedErrCode(I)Lcom/android/ons/ONSStatsInfo;
    .locals 0

    iput p1, p0, Lcom/android/ons/ONSStatsInfo;->mDetailedErrCode:I

    return-object p0
.end method

.method public setDownloadResult(Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;)Lcom/android/ons/ONSStatsInfo;
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/ons/ONSStatsInfo;->mProvisioningResult:Lcom/android/ons/ONSProfileActivator$Result;

    iput-object p1, p0, Lcom/android/ons/ONSStatsInfo;->mDownloadResult:Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/ons/ONSStatsInfo;->mIsProvisioningResultUpdated:Z

    return-object p0
.end method

.method public setOppSimCarrierId(I)Lcom/android/ons/ONSStatsInfo;
    .locals 0

    iput p1, p0, Lcom/android/ons/ONSStatsInfo;->mOppSimCarrierId:I

    return-object p0
.end method

.method public setPrimarySimSubId(I)Lcom/android/ons/ONSStatsInfo;
    .locals 0

    iput p1, p0, Lcom/android/ons/ONSStatsInfo;->mPrimarySimSubId:I

    return-object p0
.end method

.method public setProvisioningResult(Lcom/android/ons/ONSProfileActivator$Result;)Lcom/android/ons/ONSStatsInfo;
    .locals 0

    iput-object p1, p0, Lcom/android/ons/ONSStatsInfo;->mProvisioningResult:Lcom/android/ons/ONSProfileActivator$Result;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/ons/ONSStatsInfo;->mDownloadResult:Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/ons/ONSStatsInfo;->mIsProvisioningResultUpdated:Z

    return-object p0
.end method

.method public setRetryCount(I)Lcom/android/ons/ONSStatsInfo;
    .locals 0

    iput p1, p0, Lcom/android/ons/ONSStatsInfo;->mRetryCount:I

    return-object p0
.end method

.method public setWifiConnected(Z)Lcom/android/ons/ONSStatsInfo;
    .locals 0

    iput-boolean p1, p0, Lcom/android/ons/ONSStatsInfo;->mIsWifiConnected:Z

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ONSStatsInfo{mProvisioningResult="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/ons/ONSStatsInfo;->mProvisioningResult:Lcom/android/ons/ONSProfileActivator$Result;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mDownloadResult="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/ons/ONSStatsInfo;->mDownloadResult:Lcom/android/ons/ONSProfileDownloader$DownloadRetryResultCode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mPrimarySimSubId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/ons/ONSStatsInfo;->mPrimarySimSubId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mOppSimCarrierId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/ons/ONSStatsInfo;->mOppSimCarrierId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mRetryCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/ons/ONSStatsInfo;->mRetryCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mDetailedErrCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/ons/ONSStatsInfo;->mDetailedErrCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mIsWifiConnected="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/ons/ONSStatsInfo;->mIsWifiConnected:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", mIsProvisioningResultUpdated="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lcom/android/ons/ONSStatsInfo;->mIsProvisioningResultUpdated:Z

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
