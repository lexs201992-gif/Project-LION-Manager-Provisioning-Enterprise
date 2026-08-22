.class public final Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;
.super Ljava/lang/Object;
.source "AscServerClient.java"


# static fields
.field private static INSTANCE:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;


# instance fields
.field private final mApi:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscApiService;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    invoke-static {p1}, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->getInstance(Landroid/content/Context;)Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/enterprise/adapter/service/enterprise/InternalManagerAdapter;->isSecureHardware()Z

    move-result p1

    const/4 v1, 0x1

    if-nez p1, :cond_2

    const-string p1, "persist.sys.enterprise.asc_config"

    invoke-static {p1}, Lcom/motorola/enterprise/adapter/service/utils/SystemProperties;->getInt(Ljava/lang/String;)I

    move-result p1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v2

    :goto_0
    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    const-string p1, "https://portalbackend.sandclowd.com/"

    goto :goto_2

    :cond_3
    const-string p1, "https://stagportalserver.sandclowd.com/"

    :goto_2
    invoke-static {}, Lcom/motorola/enterprise/adapter/service/utils/DeviceAndBuildInformation;->isDebuggable()Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance v1, Lokhttp3/logging/HttpLoggingInterceptor;

    invoke-direct {v1}, Lokhttp3/logging/HttpLoggingInterceptor;-><init>()V

    invoke-virtual {v1}, Lokhttp3/logging/HttpLoggingInterceptor;->level()V

    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/logging/HttpLoggingInterceptor;)V

    :cond_4
    new-instance v1, Lretrofit2/Retrofit$Builder;

    invoke-direct {v1}, Lretrofit2/Retrofit$Builder;-><init>()V

    invoke-virtual {v1, p1}, Lretrofit2/Retrofit$Builder;->baseUrl(Ljava/lang/String;)Lretrofit2/Retrofit$Builder;

    move-result-object p1

    invoke-static {}, Lretrofit2/converter/gson/GsonConverterFactory;->create()Lretrofit2/converter/gson/GsonConverterFactory;

    move-result-object v1

    invoke-virtual {p1, v1}, Lretrofit2/Retrofit$Builder;->addConverterFactory(Lretrofit2/Converter$Factory;)Lretrofit2/Retrofit$Builder;

    move-result-object p1

    new-instance v1, Lokhttp3/OkHttpClient;

    invoke-direct {v1, v0}, Lokhttp3/OkHttpClient;-><init>(Lokhttp3/OkHttpClient$Builder;)V

    invoke-virtual {p1, v1}, Lretrofit2/Retrofit$Builder;->client(Lokhttp3/OkHttpClient;)Lretrofit2/Retrofit$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lretrofit2/Retrofit$Builder;->build()Lretrofit2/Retrofit;

    move-result-object p1

    const-class v0, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscApiService;

    invoke-virtual {p1, v0}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscApiService;

    iput-object p1, p0, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;->mApi:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscApiService;

    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;
    .locals 2

    const-class v0, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;->INSTANCE:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;

    if-nez v1, :cond_0

    new-instance v1, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;

    invoke-direct {v1, p0}, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;->INSTANCE:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;

    :cond_0
    sget-object p0, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;->INSTANCE:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public final getAscServerApi()Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscApiService;
    .locals 0

    iget-object p0, p0, Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscServerClient;->mApi:Lcom/motorola/enterprise/adapter/service/asc/server/gateways/AscApiService;

    return-object p0
.end method
