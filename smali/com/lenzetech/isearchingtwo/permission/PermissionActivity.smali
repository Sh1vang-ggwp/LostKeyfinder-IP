.class public Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "PermissionActivity.java"


# instance fields
.field public blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 21
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    new-instance p1, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-direct {p1, p0}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 4

    .line 28
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 29
    array-length p3, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_0

    aget-object v1, p2, v0

    .line 30
    iget-object v2, p0, Lcom/lenzetech/isearchingtwo/permission/PermissionActivity;->blePermissionHelper:Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;

    invoke-virtual {v2, v1, p1}, Lcom/lenzetech/isearchingtwo/permission/BlePermissionHelper;->showSetPermissionDialogIfDeny(Ljava/lang/String;I)V

    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRequestPermissionsResult: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TAG"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
