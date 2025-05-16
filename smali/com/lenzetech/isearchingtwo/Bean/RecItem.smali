.class public Lcom/lenzetech/isearchingtwo/Bean/RecItem;
.super Ljava/lang/Object;
.source "RecItem.java"


# instance fields
.field private fileIte:Ljava/io/File;

.field private mIsPlay:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFileIte()Ljava/io/File;
    .locals 1

    .line 9
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->fileIte:Ljava/io/File;

    return-object v0
.end method

.method public isPlay()Z
    .locals 1

    .line 21
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->mIsPlay:Z

    return v0
.end method

.method public setFileIte(Ljava/io/File;)V
    .locals 0

    .line 13
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->fileIte:Ljava/io/File;

    return-void
.end method

.method public setIsPlay(Z)V
    .locals 0

    .line 25
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->mIsPlay:Z

    return-void
.end method
