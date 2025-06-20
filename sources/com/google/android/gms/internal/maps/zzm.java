package com.google.android.gms.internal.maps;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.IObjectWrapper;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;

/* compiled from: com.google.android.gms:play-services-maps@@18.1.0 */
/* loaded from: classes.dex */
public final class zzm extends zza implements zzo {
    zzm(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.maps.model.internal.IGroundOverlayDelegate");
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final boolean zzA() throws RemoteException {
        Parcel zzH = zzH(23, zza());
        boolean zzh = zzc.zzh(zzH);
        zzH.recycle();
        return zzh;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final boolean zzB() throws RemoteException {
        Parcel zzH = zzH(16, zza());
        boolean zzh = zzc.zzh(zzH);
        zzH.recycle();
        return zzh;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final float zzd() throws RemoteException {
        Parcel zzH = zzH(12, zza());
        float readFloat = zzH.readFloat();
        zzH.recycle();
        return readFloat;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final float zze() throws RemoteException {
        Parcel zzH = zzH(8, zza());
        float readFloat = zzH.readFloat();
        zzH.recycle();
        return readFloat;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final float zzf() throws RemoteException {
        Parcel zzH = zzH(18, zza());
        float readFloat = zzH.readFloat();
        zzH.recycle();
        return readFloat;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final float zzg() throws RemoteException {
        Parcel zzH = zzH(7, zza());
        float readFloat = zzH.readFloat();
        zzH.recycle();
        return readFloat;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final float zzh() throws RemoteException {
        Parcel zzH = zzH(14, zza());
        float readFloat = zzH.readFloat();
        zzH.recycle();
        return readFloat;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final int zzi() throws RemoteException {
        Parcel zzH = zzH(20, zza());
        int readInt = zzH.readInt();
        zzH.recycle();
        return readInt;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final IObjectWrapper zzj() throws RemoteException {
        Parcel zzH = zzH(25, zza());
        IObjectWrapper asInterface = IObjectWrapper.Stub.asInterface(zzH.readStrongBinder());
        zzH.recycle();
        return asInterface;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final LatLng zzk() throws RemoteException {
        Parcel zzH = zzH(4, zza());
        LatLng latLng = (LatLng) zzc.zza(zzH, LatLng.CREATOR);
        zzH.recycle();
        return latLng;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final LatLngBounds zzl() throws RemoteException {
        Parcel zzH = zzH(10, zza());
        LatLngBounds latLngBounds = (LatLngBounds) zzc.zza(zzH, LatLngBounds.CREATOR);
        zzH.recycle();
        return latLngBounds;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final String zzm() throws RemoteException {
        Parcel zzH = zzH(2, zza());
        String readString = zzH.readString();
        zzH.recycle();
        return readString;
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzn() throws RemoteException {
        zzc(1, zza());
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzo(float f) throws RemoteException {
        Parcel zza = zza();
        zza.writeFloat(f);
        zzc(11, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzp(boolean z) throws RemoteException {
        Parcel zza = zza();
        zzc.zzd(zza, z);
        zzc(22, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzq(float f) throws RemoteException {
        Parcel zza = zza();
        zza.writeFloat(f);
        zzc(5, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzr(float f, float f2) throws RemoteException {
        Parcel zza = zza();
        zza.writeFloat(f);
        zza.writeFloat(f2);
        zzc(6, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzs(IObjectWrapper iObjectWrapper) throws RemoteException {
        Parcel zza = zza();
        zzc.zzg(zza, iObjectWrapper);
        zzc(21, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzt(LatLng latLng) throws RemoteException {
        Parcel zza = zza();
        zzc.zze(zza, latLng);
        zzc(3, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzu(LatLngBounds latLngBounds) throws RemoteException {
        Parcel zza = zza();
        zzc.zze(zza, latLngBounds);
        zzc(9, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzv(IObjectWrapper iObjectWrapper) throws RemoteException {
        Parcel zza = zza();
        zzc.zzg(zza, iObjectWrapper);
        zzc(24, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzw(float f) throws RemoteException {
        Parcel zza = zza();
        zza.writeFloat(f);
        zzc(17, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzx(boolean z) throws RemoteException {
        Parcel zza = zza();
        zzc.zzd(zza, z);
        zzc(15, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final void zzy(float f) throws RemoteException {
        Parcel zza = zza();
        zza.writeFloat(f);
        zzc(13, zza);
    }

    @Override // com.google.android.gms.internal.maps.zzo
    public final boolean zzz(zzo zzoVar) throws RemoteException {
        Parcel zza = zza();
        zzc.zzg(zza, zzoVar);
        Parcel zzH = zzH(19, zza);
        boolean zzh = zzc.zzh(zzH);
        zzH.recycle();
        return zzh;
    }
}
