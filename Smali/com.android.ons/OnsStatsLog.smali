.class public final Lcom/android/ons/OnsStatsLog;
.super Ljava/lang/Object;
.source "OnsStatsLog.java"


# static fields
.field public static final ANNOTATION_ID_DEFAULT_STATE:B = 0x6t

.field public static final ANNOTATION_ID_EXCLUSIVE_STATE:B = 0x4t

.field public static final ANNOTATION_ID_IS_UID:B = 0x1t

.field public static final ANNOTATION_ID_PRIMARY_FIELD:B = 0x3t

.field public static final ANNOTATION_ID_PRIMARY_FIELD_FIRST_UID:B = 0x5t

.field public static final ANNOTATION_ID_STATE_NESTED:B = 0x8t

.field public static final ANNOTATION_ID_TRIGGER_STATE_RESET:B = 0x7t

.field public static final ANNOTATION_ID_TRUNCATE_TIMESTAMP:B = 0x2t

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE:I = 0x1cb

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_AUTO_PROVISIONING_DISABLED:I = 0x9

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_CONNECTION_ERROR:I = 0x5

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_DEVICE_NOT_CAPABLE:I = 0x2

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_ESIM_PROVISIONING_FAILED:I = 0xa

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_INSTALL_ESIM_PROFILE_FAILED:I = 0x7

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_INTERNET_NOT_AVAILABLE:I = 0x3

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_MEMORY_FULL:I = 0x6

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_SUCCESS:I = 0x1

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_SWITCH_TO_MULTISIM_FAILED:I = 0x4

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_UNKNOWN:I = 0x0

.field public static final ONS_OPPORTUNISTIC_ESIM_PROVISIONING_COMPLETE__ERROR_CODE__RESULT_UNRESOLVABLE_ERROR:I = 0x8


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static write(IIIZIII)V
    .locals 1

    invoke-static {}, Landroid/util/StatsEvent;->newBuilder()Landroid/util/StatsEvent$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/util/StatsEvent$Builder;->setAtomId(I)Landroid/util/StatsEvent$Builder;

    invoke-virtual {v0, p1}, Landroid/util/StatsEvent$Builder;->writeInt(I)Landroid/util/StatsEvent$Builder;

    invoke-virtual {v0, p2}, Landroid/util/StatsEvent$Builder;->writeInt(I)Landroid/util/StatsEvent$Builder;

    invoke-virtual {v0, p3}, Landroid/util/StatsEvent$Builder;->writeBoolean(Z)Landroid/util/StatsEvent$Builder;

    invoke-virtual {v0, p4}, Landroid/util/StatsEvent$Builder;->writeInt(I)Landroid/util/StatsEvent$Builder;

    invoke-virtual {v0, p5}, Landroid/util/StatsEvent$Builder;->writeInt(I)Landroid/util/StatsEvent$Builder;

    invoke-virtual {v0, p6}, Landroid/util/StatsEvent$Builder;->writeInt(I)Landroid/util/StatsEvent$Builder;

    invoke-virtual {v0}, Landroid/util/StatsEvent$Builder;->usePooledBuffer()Landroid/util/StatsEvent$Builder;

    invoke-virtual {v0}, Landroid/util/StatsEvent$Builder;->build()Landroid/util/StatsEvent;

    move-result-object p0

    invoke-static {p0}, Landroid/util/StatsLog;->write(Landroid/util/StatsEvent;)V

    return-void
.end method
