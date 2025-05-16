.class Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder$1;
.super Ljava/lang/Object;
.source "MyRecorder.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;->getRecItemList()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;)V
    .locals 0

    .line 278
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder$1;->this$0:Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/io/File;Ljava/io/File;)I
    .locals 3

    .line 281
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 282
    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide p1

    cmp-long v2, v0, p1

    if-lez v2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 278
    check-cast p1, Ljava/io/File;

    check-cast p2, Ljava/io/File;

    invoke-virtual {p0, p1, p2}, Lcom/lenzetech/isearchingtwo/AudioToolsUtils/MyRecorder$1;->compare(Ljava/io/File;Ljava/io/File;)I

    move-result p1

    return p1
.end method
