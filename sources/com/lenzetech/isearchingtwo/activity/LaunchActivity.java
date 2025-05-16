package com.lenzetech.isearchingtwo.activity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import com.lenzetech.isearchingtwo.R;

/* loaded from: classes.dex */
public class LaunchActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_launch);
        Integer num = 2000;
        new Handler().postDelayed(new Runnable() { // from class: com.lenzetech.isearchingtwo.activity.LaunchActivity.1
            @Override // java.lang.Runnable
            public void run() {
                LaunchActivity.this.startActivity(new Intent(LaunchActivity.this, (Class<?>) MainActivity.class));
                LaunchActivity.this.finish();
            }
        }, num.intValue());
    }
}
