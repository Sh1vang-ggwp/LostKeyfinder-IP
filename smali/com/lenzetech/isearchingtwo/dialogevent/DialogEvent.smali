.class public Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;
.super Ljava/lang/Object;
.source "DialogEvent.java"


# instance fields
.field private final mAddress:Ljava/lang/String;

.field private final mDialogState:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

.field private final mIsDoubleClick:Z


# direct methods
.method public constructor <init>(Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mDialogState:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    .line 14
    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mAddress:Ljava/lang/String;

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mIsDoubleClick:Z

    return-void
.end method

.method public constructor <init>(Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mDialogState:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    .line 20
    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mAddress:Ljava/lang/String;

    .line 21
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mIsDoubleClick:Z

    return-void
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getmDialogState()Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mDialogState:Lcom/lenzetech/isearchingtwo/dialogevent/DialogState;

    return-object v0
.end method

.method public isDoubleClick()Z
    .locals 1

    .line 33
    iget-boolean v0, p0, Lcom/lenzetech/isearchingtwo/dialogevent/DialogEvent;->mIsDoubleClick:Z

    return v0
.end method
