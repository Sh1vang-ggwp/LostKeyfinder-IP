package com.google.android.gms.internal.maps;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;

/* compiled from: com.google.android.gms:play-services-maps@@18.1.0 */
/* loaded from: classes.dex */
public final class zzs extends zza implements zzu {
    zzs(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.maps.model.internal.IIndoorLevelDelegate");
    }

    @Override // com.google.android.gms.internal.maps.zzu
    public final int zzd() throws RemoteException {
        Parcel zzH = zzH(5, zza());
        int readInt = zzH.readInt();
        zzH.recycle();
        return readInt;
    }

    @Override // com.google.android.gms.internal.maps.zzu
    public final String zze() throws RemoteException {
        Parcel zzH = zzH(1, zza());
        String readString = zzH.readString();
        zzH.recycle();
        return readString;
    }

    @Override // com.google.android.gms.internal.maps.zzu
    public final String zzf() throws RemoteException {
        Parcel zzH = zzH(2, zza());
        String readString = zzH.readString();
        zzH.recycle();
        return readString;
    }

    @Override // com.google.android.gms.internal.maps.zzu
    public final void zzg() throws RemoteException {
        zzc(3, zza());
    }

    @Override // com.google.android.gms.internal.maps.zzu
    public final boolean zzh(zzu zzuVar) throws RemoteException {
        Parcel zza = zza();
        zzc.zzg(zza, zzuVar);
        Parcel zzH = zzH(4, zza);
        boolean zzh = zzc.zzh(zzH);
        zzH.recycle();
        return zzh;
    }
}
