package com.google.android.gms.maps;

/* compiled from: com.google.android.gms:play-services-maps@@18.1.0 */
/* loaded from: classes.dex */
final class zzs extends com.google.android.gms.maps.internal.zzj {
    final /* synthetic */ LocationSource zza;

    zzs(GoogleMap googleMap, LocationSource locationSource) {
        this.zza = locationSource;
    }

    @Override // com.google.android.gms.maps.internal.ILocationSourceDelegate
    public final void activate(com.google.android.gms.maps.internal.zzaj zzajVar) {
        this.zza.activate(new zzl(this, zzajVar));
    }

    @Override // com.google.android.gms.maps.internal.ILocationSourceDelegate
    public final void deactivate() {
        this.zza.deactivate();
    }
}
