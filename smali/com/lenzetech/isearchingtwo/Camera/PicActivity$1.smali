.class Lcom/lenzetech/isearchingtwo/Camera/PicActivity$1;
.super Ljava/lang/Object;
.source "PicActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/Camera/PicActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/Camera/PicActivity;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/Camera/PicActivity;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Camera/PicActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/Camera/PicActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Camera/PicActivity$1;->this$0:Lcom/lenzetech/isearchingtwo/Camera/PicActivity;

    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Camera/PicActivity;->finish()V

    return-void
.end method
