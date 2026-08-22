.class final Lcom/motorola/enterprise/adapter/service/asc/server/gateways/CommunicationSecurity;
.super Ljava/lang/Object;
.source "CommunicationSecurity.java"


# direct methods
.method static isInvalidSignature(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x1

    :try_start_0
    const-string v1, "SHA512withRSA"

    invoke-static {v1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v2

    const-string v3, "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA5HPMXqTyPwPJ8pim3ZuPPBYc9j20jQSY+HLi7kjAchpJjpuRTCdly4OmbLPqwxpyv8cClhnUzcCZHY/r8x45yUx7cdTqEkVjGJCSyQaPhaU1FUXCZgvVtYwMdOEYko8xv/cqq7224+pD0xidpqtzrdyE4a1EMPPFEL2piAE7zAFTQ3y0vbIVVMSVLd8y1SK0Ynm/PKYXNMpI6ZrGPVsFsxQQ8zy/Lq6k8T19KzIM64+jWogqJbbGa/9zOGgwGXWoWvMFAflHHeEY3X/dFamqWD/b+aZJSV+aoETzcjHJDn0CVxacLZznfkC5w3udOy87mPekxAJqCXvq+2EUoBDgYmv6gVAnTIoR5n3mrRe3SiTJnud7eA/rxypotLuDGq/bEhGfN4A/933U42oD6oxPrXD0Ou0Mrwi6WbdAlJUWMcJ1Kbovxm0IYdTnjDjZYyT3l/rXOBJZXwZ8VhiJCC0RaXA7VTYeeDa7phBizrR7PAcgXkzGoDx1sLUkRxsaiZeOXuteiKb0IZSFyhnJP0h1kd+rO6v7WQRIWZhaaU8f4cgGFzklZg4HutrBTUF9oikgHLWvSm9iyO3tqju3F6RusEL/w0LyeWZ6O5K86nLLkDQZoQFB4vXfVYuI+YtE8BFpOwOOi0JRA4o/ONEbFrsM5b504E38KYDS5OXpX99aSGcCAwEAAQ=="

    invoke-virtual {v2, v3}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object v2

    new-instance v3, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v3, v2}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    const-string v2, "RSA"

    invoke-static {v2}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    invoke-virtual {v1, v2}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {v1, p0}, Ljava/security/Signature;->update([B)V

    invoke-virtual {v1, p1}, Ljava/security/Signature;->verify([B)Z

    move-result p0

    xor-int/2addr p0, v0

    return p0

    :catch_0
    move-exception p0

    const-string p1, "cannot generate public key"

    invoke-static {p1, p0}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    move-exception p0

    const-string p1, "cannot verify license key"

    invoke-static {p1, p0}, Lcom/motorola/enterprise/adapter/service/asc/utils/AscLogger;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0
.end method
