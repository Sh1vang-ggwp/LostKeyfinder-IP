package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CamcorderProfileProxy;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
import androidx.core.util.Supplier;

/* loaded from: classes.dex */
public class VideoEncoderConfigCamcorderProfileResolver implements Supplier<VideoEncoderConfig> {
    private static final String TAG = "VidEncCmcrdrPrflRslvr";
    private final CamcorderProfileProxy mCamcorderProfile;
    private final Range<Integer> mExpectedFrameRateRange;
    private final Timebase mInputTimebase;
    private final String mMimeType;
    private final Size mSurfaceSize;
    private final VideoSpec mVideoSpec;

    public VideoEncoderConfigCamcorderProfileResolver(String str, Timebase timebase, VideoSpec videoSpec, Size size, CamcorderProfileProxy camcorderProfileProxy, Range<Integer> range) {
        this.mMimeType = str;
        this.mInputTimebase = timebase;
        this.mVideoSpec = videoSpec;
        this.mSurfaceSize = size;
        this.mCamcorderProfile = camcorderProfileProxy;
        this.mExpectedFrameRateRange = range;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.core.util.Supplier
    public VideoEncoderConfig get() {
        int resolveFrameRate = resolveFrameRate();
        Logger.d(TAG, "Resolved VIDEO frame rate: " + resolveFrameRate + "fps");
        Range<Integer> bitrate = this.mVideoSpec.getBitrate();
        Logger.d(TAG, "Using resolved VIDEO bitrate from CamcorderProfile");
        return VideoEncoderConfig.builder().setMimeType(this.mMimeType).setInputTimebase(this.mInputTimebase).setResolution(this.mSurfaceSize).setBitrate(VideoConfigUtil.scaleAndClampBitrate(this.mCamcorderProfile.getVideoBitRate(), resolveFrameRate, this.mCamcorderProfile.getVideoFrameRate(), this.mSurfaceSize.getWidth(), this.mCamcorderProfile.getVideoFrameWidth(), this.mSurfaceSize.getHeight(), this.mCamcorderProfile.getVideoFrameHeight(), bitrate)).setFrameRate(resolveFrameRate).build();
    }

    private int resolveFrameRate() {
        Range<Integer> frameRate = this.mVideoSpec.getFrameRate();
        int videoFrameRate = this.mCamcorderProfile.getVideoFrameRate();
        Logger.d(TAG, String.format("Frame rate from camcorder profile: %dfps. [Requested range: %s, Expected operating range: %s]", Integer.valueOf(videoFrameRate), frameRate, this.mExpectedFrameRateRange));
        return VideoConfigUtil.resolveFrameRate(frameRate, videoFrameRate, this.mExpectedFrameRateRange);
    }
}
