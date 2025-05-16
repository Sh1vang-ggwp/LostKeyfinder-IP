.class public Lcom/jianjin/camera/SensorController;
.super Ljava/lang/Object;
.source "SensorController.java"

# interfaces
.implements Lcom/jianjin/camera/IActivityLifeCycle;
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jianjin/camera/SensorController$CameraFocusListener;
    }
.end annotation


# static fields
.field public static final DELAY_DURATION:I = 0x1f4

.field public static final STATUS_MOVE:I = 0x2

.field public static final STATUS_NONE:I = 0x0

.field public static final STATUS_STATIC:I = 0x1

.field public static final TAG:Ljava/lang/String; = "SensorController"

.field private static mInstance:Lcom/jianjin/camera/SensorController;


# instance fields
.field private STATUE:I

.field canFocus:Z

.field canFocusIn:Z

.field private focusing:I

.field isFocusing:Z

.field private lastStaticStamp:J

.field mCalendar:Ljava/util/Calendar;

.field private mCameraFocusListener:Lcom/jianjin/camera/SensorController$CameraFocusListener;

.field private mSensor:Landroid/hardware/Sensor;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mX:I

.field private mY:I

.field private mZ:I


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 23
    iput-wide v0, p0, Lcom/jianjin/camera/SensorController;->lastStaticStamp:J

    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/jianjin/camera/SensorController;->isFocusing:Z

    .line 27
    iput-boolean v0, p0, Lcom/jianjin/camera/SensorController;->canFocusIn:Z

    .line 28
    iput-boolean v0, p0, Lcom/jianjin/camera/SensorController;->canFocus:Z

    .line 35
    iput v0, p0, Lcom/jianjin/camera/SensorController;->STATUE:I

    const/4 v0, 0x1

    .line 41
    iput v0, p0, Lcom/jianjin/camera/SensorController;->focusing:I

    const-string v1, "sensor"

    .line 44
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/jianjin/camera/SensorController;->mSensorManager:Landroid/hardware/SensorManager;

    .line 45
    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lcom/jianjin/camera/SensorController;->mSensor:Landroid/hardware/Sensor;

    return-void
.end method

.method public static getInstance()Lcom/jianjin/camera/SensorController;
    .locals 2

    .line 49
    sget-object v0, Lcom/jianjin/camera/SensorController;->mInstance:Lcom/jianjin/camera/SensorController;

    if-nez v0, :cond_0

    .line 50
    new-instance v0, Lcom/jianjin/camera/SensorController;

    sget-object v1, Lcom/jianjin/camera/CustomCameraAgent;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/jianjin/camera/SensorController;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/jianjin/camera/SensorController;->mInstance:Lcom/jianjin/camera/SensorController;

    .line 52
    :cond_0
    sget-object v0, Lcom/jianjin/camera/SensorController;->mInstance:Lcom/jianjin/camera/SensorController;

    return-object v0
.end method

.method private restParams()V
    .locals 1

    const/4 v0, 0x0

    .line 148
    iput v0, p0, Lcom/jianjin/camera/SensorController;->STATUE:I

    .line 149
    iput-boolean v0, p0, Lcom/jianjin/camera/SensorController;->canFocusIn:Z

    .line 150
    iput v0, p0, Lcom/jianjin/camera/SensorController;->mX:I

    .line 151
    iput v0, p0, Lcom/jianjin/camera/SensorController;->mY:I

    .line 152
    iput v0, p0, Lcom/jianjin/camera/SensorController;->mZ:I

    return-void
.end method


# virtual methods
.method public isFocusLocked()Z
    .locals 2

    .line 161
    iget-boolean v0, p0, Lcom/jianjin/camera/SensorController;->canFocus:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 162
    iget v0, p0, Lcom/jianjin/camera/SensorController;->focusing:I

    if-gtz v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public lockFocus()V
    .locals 2

    const/4 v0, 0x1

    .line 171
    iput-boolean v0, p0, Lcom/jianjin/camera/SensorController;->isFocusing:Z

    .line 172
    iget v1, p0, Lcom/jianjin/camera/SensorController;->focusing:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/jianjin/camera/SensorController;->focusing:I

    const-string v0, "SensorController"

    const-string v1, "lockFocus"

    .line 173
    invoke-static {v0, v1}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 12

    .line 82
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_0

    return-void

    .line 86
    :cond_0
    iget-boolean v0, p0, Lcom/jianjin/camera/SensorController;->isFocusing:Z

    if-eqz v0, :cond_1

    .line 87
    invoke-direct {p0}, Lcom/jianjin/camera/SensorController;->restParams()V

    return-void

    .line 91
    :cond_1
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    .line 92
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x0

    aget v0, v0, v2

    float-to-int v0, v0

    .line 93
    iget-object v3, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v3, v1

    float-to-int v3, v3

    .line 94
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v4, 0x2

    aget p1, p1, v4

    float-to-int p1, p1

    .line 95
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    iput-object v5, p0, Lcom/jianjin/camera/SensorController;->mCalendar:Ljava/util/Calendar;

    .line 96
    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v5

    .line 98
    iget-object v7, p0, Lcom/jianjin/camera/SensorController;->mCalendar:Ljava/util/Calendar;

    const/16 v8, 0xd

    invoke-virtual {v7, v8}, Ljava/util/Calendar;->get(I)I

    .line 100
    iget v7, p0, Lcom/jianjin/camera/SensorController;->STATUE:I

    if-eqz v7, :cond_5

    .line 101
    iget v7, p0, Lcom/jianjin/camera/SensorController;->mX:I

    sub-int/2addr v7, v0

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 102
    iget v8, p0, Lcom/jianjin/camera/SensorController;->mY:I

    sub-int/2addr v8, v3

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    .line 103
    iget v9, p0, Lcom/jianjin/camera/SensorController;->mZ:I

    sub-int/2addr v9, p1

    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    move-result v9

    mul-int v7, v7, v7

    mul-int v8, v8, v8

    add-int/2addr v7, v8

    mul-int v9, v9, v9

    add-int/2addr v7, v9

    int-to-double v7, v7

    .line 106
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    const-wide v9, 0x3ff6666666666666L    # 1.4

    cmpl-double v11, v7, v9

    if-lez v11, :cond_2

    .line 110
    iput v4, p0, Lcom/jianjin/camera/SensorController;->STATUE:I

    goto :goto_0

    .line 115
    :cond_2
    iget v7, p0, Lcom/jianjin/camera/SensorController;->STATUE:I

    if-ne v7, v4, :cond_3

    .line 116
    iput-wide v5, p0, Lcom/jianjin/camera/SensorController;->lastStaticStamp:J

    .line 117
    iput-boolean v1, p0, Lcom/jianjin/camera/SensorController;->canFocusIn:Z

    .line 120
    :cond_3
    iget-boolean v4, p0, Lcom/jianjin/camera/SensorController;->canFocusIn:Z

    if-eqz v4, :cond_4

    .line 121
    iget-wide v7, p0, Lcom/jianjin/camera/SensorController;->lastStaticStamp:J

    sub-long/2addr v5, v7

    const-wide/16 v7, 0x1f4

    cmp-long v4, v5, v7

    if-lez v4, :cond_4

    .line 123
    iget-boolean v4, p0, Lcom/jianjin/camera/SensorController;->isFocusing:Z

    if-nez v4, :cond_4

    .line 124
    iput-boolean v2, p0, Lcom/jianjin/camera/SensorController;->canFocusIn:Z

    .line 126
    iget-object v2, p0, Lcom/jianjin/camera/SensorController;->mCameraFocusListener:Lcom/jianjin/camera/SensorController$CameraFocusListener;

    if-eqz v2, :cond_4

    .line 127
    invoke-interface {v2}, Lcom/jianjin/camera/SensorController$CameraFocusListener;->onFocus()V

    .line 134
    :cond_4
    iput v1, p0, Lcom/jianjin/camera/SensorController;->STATUE:I

    goto :goto_0

    .line 137
    :cond_5
    iput-wide v5, p0, Lcom/jianjin/camera/SensorController;->lastStaticStamp:J

    .line 138
    iput v1, p0, Lcom/jianjin/camera/SensorController;->STATUE:I

    .line 141
    :goto_0
    iput v0, p0, Lcom/jianjin/camera/SensorController;->mX:I

    .line 142
    iput v3, p0, Lcom/jianjin/camera/SensorController;->mY:I

    .line 143
    iput p1, p0, Lcom/jianjin/camera/SensorController;->mZ:I

    :cond_6
    return-void
.end method

.method public onStart()V
    .locals 3

    .line 61
    invoke-direct {p0}, Lcom/jianjin/camera/SensorController;->restParams()V

    const/4 v0, 0x1

    .line 62
    iput-boolean v0, p0, Lcom/jianjin/camera/SensorController;->canFocus:Z

    .line 63
    iget-object v0, p0, Lcom/jianjin/camera/SensorController;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/jianjin/camera/SensorController;->mSensor:Landroid/hardware/Sensor;

    const/4 v2, 0x3

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    return-void
.end method

.method public onStop()V
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/jianjin/camera/SensorController;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/jianjin/camera/SensorController;->mSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    const/4 v0, 0x0

    .line 70
    iput-boolean v0, p0, Lcom/jianjin/camera/SensorController;->canFocus:Z

    return-void
.end method

.method public restFocus()V
    .locals 1

    const/4 v0, 0x1

    .line 186
    iput v0, p0, Lcom/jianjin/camera/SensorController;->focusing:I

    return-void
.end method

.method public setCameraFocusListener(Lcom/jianjin/camera/SensorController$CameraFocusListener;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/jianjin/camera/SensorController;->mCameraFocusListener:Lcom/jianjin/camera/SensorController$CameraFocusListener;

    return-void
.end method

.method public unlockFocus()V
    .locals 2

    const/4 v0, 0x0

    .line 180
    iput-boolean v0, p0, Lcom/jianjin/camera/SensorController;->isFocusing:Z

    .line 181
    iget v0, p0, Lcom/jianjin/camera/SensorController;->focusing:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jianjin/camera/SensorController;->focusing:I

    const-string v0, "SensorController"

    const-string v1, "unlockFocus"

    .line 182
    invoke-static {v0, v1}, Lcom/jianjin/camera/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
