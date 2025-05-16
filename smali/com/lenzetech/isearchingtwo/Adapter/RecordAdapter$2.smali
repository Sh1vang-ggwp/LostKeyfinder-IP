.class Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$2;
.super Ljava/lang/Object;
.source "RecordAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;


# direct methods
.method constructor <init>(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$2;->this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 72
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 73
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$2;->this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->access$100(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lenzetech/isearchingtwo/Bean/RecItem;

    .line 75
    :try_start_0
    invoke-virtual {v0}, Lcom/lenzetech/isearchingtwo/Bean/RecItem;->getFileIte()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 76
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 77
    :goto_0
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$2;->this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->access$100(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 78
    iget-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$2;->this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-virtual {p1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->notifyDataSetChanged()V

    return-void
.end method
