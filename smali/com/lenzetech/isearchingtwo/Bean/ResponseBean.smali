.class public Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;
.super Ljava/lang/Object;
.source "ResponseBean.java"


# instance fields
.field private content:Ljava/lang/String;

.field private opt:I

.field private title:Ljava/lang/String;

.field private verify:Ljava/lang/Boolean;

.field private www:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->verify:Ljava/lang/Boolean;

    .line 12
    iput-object p2, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->title:Ljava/lang/String;

    .line 13
    iput-object p3, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->content:Ljava/lang/String;

    .line 14
    iput-object p4, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->www:Ljava/lang/String;

    .line 15
    iput p5, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->opt:I

    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getOpt()I
    .locals 1

    .line 43
    iget v0, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->opt:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getVerify()Ljava/lang/Boolean;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->verify:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getWww()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->www:Ljava/lang/String;

    return-object v0
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->content:Ljava/lang/String;

    return-void
.end method

.method public setOpt(I)V
    .locals 0

    .line 47
    iput p1, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->opt:I

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->title:Ljava/lang/String;

    return-void
.end method

.method public setVerify(Ljava/lang/Boolean;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->verify:Ljava/lang/Boolean;

    return-void
.end method

.method public setWww(Ljava/lang/String;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Bean/ResponseBean;->www:Ljava/lang/String;

    return-void
.end method
