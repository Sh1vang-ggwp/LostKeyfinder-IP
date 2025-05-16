package com.lenzetech.isearchingtwo.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.lenzetech.isearchingtwo.Bean.RecItem;
import com.lenzetech.isearchingtwo.R;
import com.mcxtzhang.swipemenulib.SwipeMenuLayout;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public class RecordAdapter extends ArrayAdapter<RecItem> {
    private List<RecItem> dataList;
    private OnItemClickListener mListener;
    TextView mTextView;
    private int resourceId;
    SwipeMenuLayout swipeMenuLayout;

    public interface OnItemClickListener {
        void onItemClick(RecItem recItem, int i);
    }

    public RecordAdapter(Context context, int i, List<RecItem> list) {
        super(context, i, list);
        this.resourceId = i;
        this.dataList = list;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int i, View view, ViewGroup viewGroup) {
        RecItem item = getItem(i);
        View inflate = LayoutInflater.from(getContext()).inflate(this.resourceId, viewGroup, false);
        if (item != null) {
            View findViewById = inflate.findViewById(R.id.rl_content);
            TextView textView = (TextView) inflate.findViewById(R.id.textItem);
            if (item.getFileIte() != null) {
                textView.setText(item.getFileIte().getName() + "");
            } else {
                textView.setText("1111");
            }
            if (item.isPlay()) {
                findViewById.setBackgroundColor(inflate.getResources().getColor(R.color.bg_gary));
            } else {
                inflate.findViewById(R.id.rl_content);
                findViewById.setBackground(inflate.getResources().getDrawable(R.drawable.record_list_selector));
            }
            findViewById.setOnClickListener(new View.OnClickListener() { // from class: com.lenzetech.isearchingtwo.Adapter.RecordAdapter.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    int intValue = ((Integer) view2.getTag()).intValue();
                    if (RecordAdapter.this.mListener != null) {
                        RecordAdapter.this.mListener.onItemClick((RecItem) RecordAdapter.this.dataList.get(intValue), intValue);
                    }
                }
            });
            findViewById.setTag(Integer.valueOf(i));
            View findViewById2 = inflate.findViewById(R.id.btn_delete);
            findViewById2.setOnClickListener(new View.OnClickListener() { // from class: com.lenzetech.isearchingtwo.Adapter.RecordAdapter.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    int intValue = ((Integer) view2.getTag()).intValue();
                    try {
                        ((RecItem) RecordAdapter.this.dataList.get(intValue)).getFileIte().delete();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    RecordAdapter.this.dataList.remove(intValue);
                    RecordAdapter.this.notifyDataSetChanged();
                }
            });
            findViewById2.setTag(Integer.valueOf(i));
        }
        return inflate;
    }

    public void setPlay(int i) {
        this.dataList.get(i).setIsPlay(true);
    }

    public void setAllUnplay() {
        Iterator<RecItem> it = this.dataList.iterator();
        while (it.hasNext()) {
            it.next().setIsPlay(false);
        }
    }

    public void setListener(OnItemClickListener onItemClickListener) {
        this.mListener = onItemClickListener;
    }
}
