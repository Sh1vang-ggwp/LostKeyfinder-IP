.class public Lcom/lenzetech/isearchingtwo/Bean/Note;
.super Ljava/lang/Object;
.source "Note.java"


# instance fields
.field private content:Ljava/lang/String;

.field private date:Ljava/util/Date;

.field private tag:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->uuid:Ljava/util/UUID;

    .line 16
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->date:Ljava/util/Date;

    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getDate()Ljava/util/Date;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->date:Ljava/util/Date;

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getUuid()Ljava/util/UUID;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->content:Ljava/lang/String;

    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->tag:Ljava/lang/String;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/Note;->title:Ljava/lang/String;

    return-void
.end method
