.class public final synthetic Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/SafeCloseImageReaderProxy;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda2;->f$0:Landroidx/camera/core/SafeCloseImageReaderProxy;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda2;->f$0:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->safeClose()V

    return-void
.end method
