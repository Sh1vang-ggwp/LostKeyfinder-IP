.class public Lcom/lenzetech/isearchingtwo/Bean/NoteLab;
.super Ljava/lang/Object;
.source "NoteLab.java"


# static fields
.field private static sNoteLab:Lcom/lenzetech/isearchingtwo/Bean/NoteLab;


# instance fields
.field private notes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/lenzetech/isearchingtwo/Bean/Note;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/NoteLab;->notes:Ljava/util/ArrayList;

    const/4 p1, 0x0

    :goto_0
    const/16 v0, 0x64

    if-ge p1, v0, :cond_0

    .line 16
    new-instance v0, Lcom/lenzetech/isearchingtwo/Bean/Note;

    invoke-direct {v0}, Lcom/lenzetech/isearchingtwo/Bean/Note;-><init>()V

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "this is title "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lenzetech/isearchingtwo/Bean/Note;->setTitle(Ljava/lang/String;)V

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "this is content"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "balabalabalabalalabalabalabalabalala\nbalabalabalabalalabalabalabala    balala\nbalabalabalabalalabalabalabalabalala\nbalabalabalabalalabalabalab    alabalala\nbalabalabalabalalabalabalabalabalala\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lenzetech/isearchingtwo/Bean/Note;->setContent(Ljava/lang/String;)V

    .line 19
    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Bean/NoteLab;->notes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static getNoteLab(Landroid/content/Context;)Lcom/lenzetech/isearchingtwo/Bean/NoteLab;
    .locals 1

    .line 24
    sget-object v0, Lcom/lenzetech/isearchingtwo/Bean/NoteLab;->sNoteLab:Lcom/lenzetech/isearchingtwo/Bean/NoteLab;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/lenzetech/isearchingtwo/Bean/NoteLab;

    invoke-direct {v0, p0}, Lcom/lenzetech/isearchingtwo/Bean/NoteLab;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/lenzetech/isearchingtwo/Bean/NoteLab;->sNoteLab:Lcom/lenzetech/isearchingtwo/Bean/NoteLab;

    .line 28
    :cond_0
    sget-object p0, Lcom/lenzetech/isearchingtwo/Bean/NoteLab;->sNoteLab:Lcom/lenzetech/isearchingtwo/Bean/NoteLab;

    return-object p0
.end method


# virtual methods
.method public getNotes()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/lenzetech/isearchingtwo/Bean/Note;",
            ">;"
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/NoteLab;->notes:Ljava/util/ArrayList;

    return-object v0
.end method
