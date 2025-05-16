package com.lenzetech.isearchingtwo.Camera;

import android.app.Activity;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.widget.ImageView;
import com.lenzetech.isearchingtwo.R;

/* loaded from: classes.dex */
public class PicActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        getWindow().setFlags(1024, 1024);
        setContentView(R.layout.activity_pic);
        ((ImageView) findViewById(R.id.image_view)).setImageBitmap(BitmapFactory.decodeFile(getIntent().getStringExtra("imgUri")));
        new Handler().postDelayed(new Runnable() { // from class: com.lenzetech.isearchingtwo.Camera.PicActivity.1
            @Override // java.lang.Runnable
            public void run() {
                PicActivity.this.finish();
            }
        }, 1000L);
    }
}
