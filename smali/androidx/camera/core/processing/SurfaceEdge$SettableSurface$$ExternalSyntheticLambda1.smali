.class public final synthetic Landroidx/camera/core/processing/SurfaceEdge$SettableSurface$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/impl/DeferrableSurface;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/impl/DeferrableSurface;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/impl/DeferrableSurface;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-static {v0}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->lambda$setProvider$1(Landroidx/camera/core/impl/DeferrableSurface;)V

    return-void
.end method
