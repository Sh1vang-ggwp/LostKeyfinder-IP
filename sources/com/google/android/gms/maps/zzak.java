package com.google.android.gms.maps;

import com.google.android.gms.maps.StreetViewPanorama;
import com.google.android.gms.maps.internal.zzbn;
import com.google.android.gms.maps.model.StreetViewPanoramaOrientation;

/* compiled from: com.google.android.gms:play-services-maps@@18.1.0 */
/* loaded from: classes.dex */
final class zzak extends zzbn {
    final /* synthetic */ StreetViewPanorama.OnStreetViewPanoramaClickListener zza;

    zzak(StreetViewPanorama streetViewPanorama, StreetViewPanorama.OnStreetViewPanoramaClickListener onStreetViewPanoramaClickListener) {
        this.zza = onStreetViewPanoramaClickListener;
    }

    @Override // com.google.android.gms.maps.internal.zzbo
    public final void zzb(StreetViewPanoramaOrientation streetViewPanoramaOrientation) {
        this.zza.onStreetViewPanoramaClick(streetViewPanoramaOrientation);
    }
}
