.class public final Lcom/lenzetech/isearchingtwo/AudioToolsUtils/PermissionManager;
.super Ljava/lang/Object;
.source "PermissionManager.java"


# static fields
.field public static final PERMISSION_CAMERA:[Ljava/lang/String;

.field public static final PERMISSION_LOCATION:[Ljava/lang/String;

.field public static final PERMISSION_READ_PHONE:[Ljava/lang/String;

.field public static final PERMISSION_RECORD:[Ljava/lang/String;

.field public static final PERMISSION_SD_WRITE:[Ljava/lang/String;

.field public static final REQUEST_ALERT_WINDOW:I = 0x6a

.field public static final REQUEST_CAMERA:I = 0x67

.field public static final REQUEST_LOCATION:I = 0x66

.field public static final REQUEST_READ_PHONE:I = 0x69

.field public static final REQUEST_RECORD:I = 0x68

.field public static final REQUEST_SD_WRITE:I = 0x65


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 41
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/PermissionManager;->PERMISSION_SD_WRITE:[Ljava/lang/String;

    const-string v0, "android.permission.ACCESS_COARSE_LOCATION"

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 42
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/PermissionManager;->PERMISSION_LOCATION:[Ljava/lang/String;

    const-string v0, "android.permission.CAMERA"

    .line 43
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/PermissionManager;->PERMISSION_CAMERA:[Ljava/lang/String;

    const-string v0, "android.permission.RECORD_AUDIO"

    .line 44
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/PermissionManager;->PERMISSION_RECORD:[Ljava/lang/String;

    const-string v0, "android.permission.READ_PHONE_STATE"

    .line 45
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/PermissionManager;->PERMISSION_READ_PHONE:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
