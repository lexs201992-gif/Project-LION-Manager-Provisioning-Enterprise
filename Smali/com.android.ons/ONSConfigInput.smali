.class public Lcom/android/ons/ONSConfigInput;
.super Ljava/lang/Object;
.source "ONSConfigInput.java"


# static fields
.field private static final DBG:Z = true

.field private static final TAG:Ljava/lang/String; = "ONSConfigInput"


# instance fields
.field private mAvailableNetworkCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

.field private mAvailableNetworkInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPreferredDataSub:I

.field private mPrimarySub:I


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;",
            "Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/ons/ONSConfigInput;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    const/4 p1, -0x1

    iput p1, p0, Lcom/android/ons/ONSConfigInput;->mPreferredDataSub:I

    iput p1, p0, Lcom/android/ons/ONSConfigInput;->mPrimarySub:I

    iput-object p2, p0, Lcom/android/ons/ONSConfigInput;->mAvailableNetworkCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    return-void
.end method


# virtual methods
.method public getAvailableNetworkCallback()Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;
    .locals 0

    iget-object p0, p0, Lcom/android/ons/ONSConfigInput;->mAvailableNetworkCallback:Lcom/android/internal/telephony/IUpdateAvailableNetworksCallback;

    return-object p0
.end method

.method public getAvailableNetworkInfos()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/android/ons/ONSConfigInput;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    return-object p0
.end method

.method public getPreferredDataSub()I
    .locals 0

    iget p0, p0, Lcom/android/ons/ONSConfigInput;->mPreferredDataSub:I

    return p0
.end method

.method public getPrimarySub()I
    .locals 0

    iget p0, p0, Lcom/android/ons/ONSConfigInput;->mPrimarySub:I

    return p0
.end method

.method public setAvailableNetworkInfo(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/AvailableNetworkInfo;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/ons/ONSConfigInput;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    return-void
.end method

.method public setPreferredDataSub(I)V
    .locals 0

    iput p1, p0, Lcom/android/ons/ONSConfigInput;->mPreferredDataSub:I

    return-void
.end method

.method public setPrimarySub(I)V
    .locals 0

    iput p1, p0, Lcom/android/ons/ONSConfigInput;->mPrimarySub:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ONSConfigInput: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/ons/ONSConfigInput;->mAvailableNetworkInfos:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/android/ons/ONSConfigInput;->mPreferredDataSub:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
