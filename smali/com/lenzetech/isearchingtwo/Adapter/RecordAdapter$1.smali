.class Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$1;
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

    .line 58
    iput-object p1, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$1;->this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 62
    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$1;->this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->access$000(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$1;->this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-static {v0}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->access$000(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$1;->this$0:Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;

    invoke-static {v1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;->access$100(Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lenzetech/isearchingtwo/Bean/RecItem;

    invoke-interface {v0, v1, p1}, Lcom/lenzetech/isearchingtwo/Adapter/RecordAdapter$OnItemClickListener;->onItemClick(Lcom/lenzetech/isearchingtwo/Bean/RecItem;I)V

    :cond_0
    return-void
.end method
