.class public final Lokhttp3/internal/HostnamesKt;
.super Ljava/lang/Object;
.source "hostnames.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nhostnames.kt\nKotlin\n*S Kotlin\n*F\n+ 1 hostnames.kt\nokhttp3/internal/HostnamesKt\n*L\n1#1,233:1\n*E\n"
.end annotation


# direct methods
.method private static final decodeIpv6(Ljava/lang/String;II)Ljava/net/InetAddress;
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p2

    const/16 v2, 0x10

    new-array v3, v2, [B

    const/4 v4, 0x0

    const/4 v5, -0x1

    move/from16 v6, p1

    move v7, v4

    move v8, v5

    move v9, v8

    :goto_0
    const/4 v10, 0x0

    if-ge v6, v1, :cond_16

    if-ne v7, v2, :cond_0

    return-object v10

    :cond_0
    add-int/lit8 v11, v6, 0x2

    const/4 v12, 0x4

    const/16 v13, 0xff

    if-gt v11, v1, :cond_3

    const-string v14, "::"

    invoke-static {v6, v0, v14, v4}, Lkotlin/text/StringsKt;->startsWith(ILjava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-eqz v14, :cond_3

    if-eq v8, v5, :cond_1

    return-object v10

    :cond_1
    add-int/lit8 v7, v7, 0x2

    if-ne v11, v1, :cond_2

    move v0, v2

    move v8, v7

    goto/16 :goto_c

    :cond_2
    move v8, v7

    move v9, v11

    goto/16 :goto_8

    :cond_3
    if-eqz v7, :cond_11

    const-string v11, ":"

    invoke-static {v6, v0, v11, v4}, Lkotlin/text/StringsKt;->startsWith(ILjava/lang/String;Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_4

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_7

    :cond_4
    const-string v11, "."

    invoke-static {v6, v0, v11, v4}, Lkotlin/text/StringsKt;->startsWith(ILjava/lang/String;Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_10

    add-int/lit8 v6, v7, -0x2

    move v11, v6

    :goto_1
    if-ge v9, v1, :cond_d

    if-ne v11, v2, :cond_5

    goto :goto_2

    :cond_5
    if-eq v11, v6, :cond_7

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v14

    const/16 v15, 0x2e

    if-eq v14, v15, :cond_6

    :goto_2
    move v0, v4

    goto :goto_6

    :cond_6
    add-int/lit8 v9, v9, 0x1

    :cond_7
    move v15, v4

    move v14, v9

    :goto_3
    if-ge v14, v1, :cond_b

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v2, 0x30

    if-lt v4, v2, :cond_b

    const/16 v5, 0x39

    if-le v4, v5, :cond_8

    goto :goto_4

    :cond_8
    if-nez v15, :cond_9

    if-eq v9, v14, :cond_9

    goto :goto_5

    :cond_9
    mul-int/lit8 v15, v15, 0xa

    add-int/2addr v15, v4

    sub-int/2addr v15, v2

    if-le v15, v13, :cond_a

    goto :goto_5

    :cond_a
    add-int/lit8 v14, v14, 0x1

    const/16 v2, 0x10

    const/4 v4, 0x0

    const/4 v5, -0x1

    goto :goto_3

    :cond_b
    :goto_4
    sub-int v2, v14, v9

    if-nez v2, :cond_c

    goto :goto_5

    :cond_c
    add-int/lit8 v2, v11, 0x1

    int-to-byte v4, v15

    aput-byte v4, v3, v11

    move v11, v2

    move v9, v14

    const/16 v2, 0x10

    const/4 v4, 0x0

    const/4 v5, -0x1

    goto :goto_1

    :cond_d
    add-int/2addr v6, v12

    if-ne v11, v6, :cond_e

    const/4 v0, 0x1

    goto :goto_6

    :cond_e
    :goto_5
    const/4 v0, 0x0

    :goto_6
    if-nez v0, :cond_f

    return-object v10

    :cond_f
    add-int/lit8 v7, v7, 0x2

    const/16 v0, 0x10

    goto :goto_c

    :cond_10
    return-object v10

    :cond_11
    :goto_7
    move v9, v6

    :goto_8
    move v6, v9

    const/4 v2, 0x0

    :goto_9
    if-ge v6, v1, :cond_13

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lokhttp3/internal/Util;->parseHexDigit(C)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_12

    goto :goto_a

    :cond_12
    shl-int/lit8 v2, v2, 0x4

    add-int/2addr v2, v4

    add-int/lit8 v6, v6, 0x1

    goto :goto_9

    :cond_13
    :goto_a
    sub-int v4, v6, v9

    if-eqz v4, :cond_15

    if-le v4, v12, :cond_14

    goto :goto_b

    :cond_14
    add-int/lit8 v4, v7, 0x1

    ushr-int/lit8 v5, v2, 0x8

    and-int/2addr v5, v13

    int-to-byte v5, v5

    aput-byte v5, v3, v7

    add-int/lit8 v7, v4, 0x1

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v3, v4

    const/16 v2, 0x10

    const/4 v4, 0x0

    const/4 v5, -0x1

    goto/16 :goto_0

    :cond_15
    :goto_b
    return-object v10

    :cond_16
    move v0, v2

    :goto_c
    if-eq v7, v0, :cond_18

    const/4 v1, -0x1

    if-ne v8, v1, :cond_17

    return-object v10

    :cond_17
    sub-int v1, v7, v8

    rsub-int/lit8 v2, v1, 0x10

    invoke-static {v3, v8, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    rsub-int/lit8 v2, v7, 0x10

    add-int/2addr v2, v8

    const/4 v0, 0x0

    int-to-byte v0, v0

    invoke-static {v3, v8, v2, v0}, Ljava/util/Arrays;->fill([BIIB)V

    :cond_18
    invoke-static {v3}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public static final toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    const-string v0, ":"

    invoke-static {p0, v0}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-eqz v0, :cond_b

    const-string v0, "["

    invoke-static {p0, v0, v1}, Lkotlin/text/StringsKt;->startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v4

    invoke-static {p0, v4, v0}, Lokhttp3/internal/HostnamesKt;->decodeIpv6(Ljava/lang/String;II)Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, v1, v0}, Lokhttp3/internal/HostnamesKt;->decodeIpv6(Ljava/lang/String;II)Ljava/net/InetAddress;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v2

    array-length v4, v2

    const/4 v5, 0x4

    const/16 v6, 0x10

    if-ne v4, v6, :cond_8

    move p0, v1

    move v0, p0

    :goto_1
    array-length v4, v2

    if-ge p0, v4, :cond_3

    move v4, p0

    :goto_2
    if-ge v4, v6, :cond_1

    aget-byte v7, v2, v4

    if-nez v7, :cond_1

    add-int/lit8 v7, v4, 0x1

    aget-byte v7, v2, v7

    if-nez v7, :cond_1

    add-int/lit8 v4, v4, 0x2

    goto :goto_2

    :cond_1
    sub-int v7, v4, p0

    if-le v7, v0, :cond_2

    if-lt v7, v5, :cond_2

    move v3, p0

    move v0, v7

    :cond_2
    add-int/lit8 p0, v4, 0x2

    goto :goto_1

    :cond_3
    new-instance p0, Lokio/Buffer;

    invoke-direct {p0}, Lokio/Buffer;-><init>()V

    :cond_4
    :goto_3
    array-length v4, v2

    if-ge v1, v4, :cond_7

    const/16 v4, 0x3a

    if-ne v1, v3, :cond_5

    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)V

    add-int/2addr v1, v0

    if-ne v1, v6, :cond_4

    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)V

    goto :goto_3

    :cond_5
    if-lez v1, :cond_6

    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)V

    :cond_6
    aget-byte v4, v2, v1

    sget-object v5, Lokhttp3/internal/Util;->EMPTY_BYTE_ARRAY:[B

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    add-int/lit8 v5, v1, 0x1

    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    or-int/2addr v4, v5

    int-to-long v4, v4

    invoke-virtual {p0, v4, v5}, Lokio/Buffer;->writeHexadecimalUnsignedLong(J)Lokio/Buffer;

    add-int/lit8 v1, v1, 0x2

    goto :goto_3

    :cond_7
    invoke-virtual {p0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_8
    array-length v1, v2

    if-ne v1, v5, :cond_9

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid IPv6 address: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x27

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_a
    return-object v2

    :cond_b
    :try_start_0
    invoke-static {p0}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "IDN.toASCII(host)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Locale.US"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "(this as java.lang.String).toLowerCase(locale)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_c

    move v0, v4

    goto :goto_4

    :cond_c
    move v0, v1

    :goto_4
    if-eqz v0, :cond_d

    return-object v2

    :cond_d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    move v5, v1

    :goto_5
    if-ge v5, v0, :cond_11

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x1f

    if-le v6, v7, :cond_10

    const/16 v7, 0x7f

    if-lt v6, v7, :cond_e

    goto :goto_6

    :cond_e
    const-string v7, " #%/:?@[\\]"

    const/4 v8, 0x6

    invoke-static {v7, v6, v1, v1, v8}, Lkotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZI)I

    move-result v6
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-eq v6, v3, :cond_f

    goto :goto_6

    :cond_f
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    :cond_10
    :goto_6
    move v1, v4

    :cond_11
    if-eqz v1, :cond_12

    goto :goto_7

    :cond_12
    move-object v2, p0

    :catch_0
    :goto_7
    return-object v2
.end method
