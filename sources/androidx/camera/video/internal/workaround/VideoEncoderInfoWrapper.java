package androidx.camera.video.internal.workaround;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.core.util.Preconditions;

/* loaded from: classes.dex */
public class VideoEncoderInfoWrapper implements VideoEncoderInfo {
    private static final int HEIGHT_4KDCI = 2160;
    private static final String TAG = "VideoEncoderInfoWrapper";
    private static final int WIDTH_4KDCI = 4096;
    private final Range<Integer> mSupportedHeights;
    private final Range<Integer> mSupportedWidths;
    private final VideoEncoderInfo mVideoEncoderInfo;

    /* JADX WARN: Removed duplicated region for block: B:5:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:8:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static androidx.camera.video.internal.encoder.VideoEncoderInfo from(androidx.camera.video.internal.encoder.VideoEncoderInfo r3, android.util.Size r4) {
        /*
            java.lang.Class<androidx.camera.video.internal.compat.quirk.MediaCodecInfoReportIncorrectInfoQuirk> r0 = androidx.camera.video.internal.compat.quirk.MediaCodecInfoReportIncorrectInfoQuirk.class
            androidx.camera.core.impl.Quirk r0 = androidx.camera.video.internal.compat.quirk.DeviceQuirks.get(r0)
            r1 = 0
            r2 = 1
            if (r0 == 0) goto Lc
        La:
            r1 = 1
            goto L30
        Lc:
            boolean r0 = isSizeSupported(r3, r4)
            if (r0 != 0) goto L30
            r0 = 3
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r0[r1] = r4
            android.util.Range r4 = r3.getSupportedWidths()
            r0[r2] = r4
            r4 = 2
            android.util.Range r1 = r3.getSupportedHeights()
            r0[r4] = r1
            java.lang.String r4 = "Detected that the device does not support a size %s that should be valid in widths/heights = %s/%s"
            java.lang.String r4 = java.lang.String.format(r4, r0)
            java.lang.String r0 = "VideoEncoderInfoWrapper"
            androidx.camera.core.Logger.w(r0, r4)
            goto La
        L30:
            if (r1 == 0) goto L38
            androidx.camera.video.internal.workaround.VideoEncoderInfoWrapper r4 = new androidx.camera.video.internal.workaround.VideoEncoderInfoWrapper
            r4.<init>(r3)
            r3 = r4
        L38:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.internal.workaround.VideoEncoderInfoWrapper.from(androidx.camera.video.internal.encoder.VideoEncoderInfo, android.util.Size):androidx.camera.video.internal.encoder.VideoEncoderInfo");
    }

    VideoEncoderInfoWrapper(VideoEncoderInfo videoEncoderInfo) {
        this.mVideoEncoderInfo = videoEncoderInfo;
        int widthAlignment = videoEncoderInfo.getWidthAlignment();
        this.mSupportedWidths = Range.create(Integer.valueOf(widthAlignment), Integer.valueOf(((int) Math.ceil(4096.0d / widthAlignment)) * widthAlignment));
        int heightAlignment = videoEncoderInfo.getHeightAlignment();
        this.mSupportedHeights = Range.create(Integer.valueOf(heightAlignment), Integer.valueOf(((int) Math.ceil(2160.0d / heightAlignment)) * heightAlignment));
    }

    @Override // androidx.camera.video.internal.encoder.EncoderInfo
    public String getName() {
        return this.mVideoEncoderInfo.getName();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidths() {
        return this.mSupportedWidths;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeights() {
        return this.mSupportedHeights;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidthsFor(int i) {
        Preconditions.checkArgument(this.mSupportedHeights.contains((Range<Integer>) Integer.valueOf(i)), "Not supported height: " + i + " in " + this.mSupportedHeights);
        return this.mSupportedWidths;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeightsFor(int i) {
        Preconditions.checkArgument(this.mSupportedWidths.contains((Range<Integer>) Integer.valueOf(i)), "Not supported width: " + i + " in " + this.mSupportedWidths);
        return this.mSupportedHeights;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getWidthAlignment() {
        return this.mVideoEncoderInfo.getWidthAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getHeightAlignment() {
        return this.mVideoEncoderInfo.getHeightAlignment();
    }

    private static boolean isSizeSupported(VideoEncoderInfo videoEncoderInfo, Size size) {
        if (videoEncoderInfo.getSupportedWidths().contains((Range<Integer>) Integer.valueOf(size.getWidth())) && videoEncoderInfo.getSupportedHeights().contains((Range<Integer>) Integer.valueOf(size.getHeight()))) {
            try {
                if (videoEncoderInfo.getSupportedHeightsFor(size.getWidth()).contains((Range<Integer>) Integer.valueOf(size.getHeight()))) {
                    if (videoEncoderInfo.getSupportedWidthsFor(size.getHeight()).contains((Range<Integer>) Integer.valueOf(size.getWidth()))) {
                        return true;
                    }
                }
                return false;
            } catch (IllegalArgumentException e) {
                Logger.w(TAG, "size is not supported", e);
            }
        }
        return false;
    }
}
