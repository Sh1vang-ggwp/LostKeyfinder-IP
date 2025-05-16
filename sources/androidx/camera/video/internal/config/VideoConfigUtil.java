package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Rational;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CamcorderProfileProxy;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.MediaSpec;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.config.MimeInfo;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
import androidx.core.util.Supplier;
import java.util.Objects;

/* loaded from: classes.dex */
public final class VideoConfigUtil {
    private static final String TAG = "VideoConfigUtil";

    private VideoConfigUtil() {
    }

    public static MimeInfo resolveVideoMimeInfo(MediaSpec mediaSpec, CamcorderProfileProxy camcorderProfileProxy) {
        String outputFormatToVideoMime = MediaSpec.outputFormatToVideoMime(mediaSpec.getOutputFormat());
        boolean z = false;
        if (camcorderProfileProxy != null) {
            String videoCodecMimeType = camcorderProfileProxy.getVideoCodecMimeType();
            if (videoCodecMimeType == null) {
                Logger.d(TAG, "CamcorderProfile contains undefined VIDEO mime type so cannot be used. May rely on fallback defaults to derive settings [chosen mime type: " + outputFormatToVideoMime + "]");
            } else {
                if (mediaSpec.getOutputFormat() == -1) {
                    Logger.d(TAG, "MediaSpec contains OUTPUT_FORMAT_AUTO. Using CamcorderProfile to derive VIDEO settings [mime type: " + videoCodecMimeType + "]");
                } else if (Objects.equals(outputFormatToVideoMime, videoCodecMimeType)) {
                    Logger.d(TAG, "MediaSpec video mime matches CamcorderProfile. Using CamcorderProfile to derive VIDEO settings [mime type: " + videoCodecMimeType + "]");
                } else {
                    Logger.d(TAG, "MediaSpec video mime does not match CamcorderProfile, so CamcorderProfile settings cannot be used. May rely on fallback defaults to derive VIDEO settings [CamcorderProfile mime type: " + videoCodecMimeType + ", chosen mime type: " + outputFormatToVideoMime + "]");
                }
                outputFormatToVideoMime = videoCodecMimeType;
                z = true;
            }
        } else {
            Logger.d(TAG, "No CamcorderProfile present. May rely on fallback defaults to derive VIDEO settings [chosen mime type: " + outputFormatToVideoMime + "]");
        }
        MimeInfo.Builder builder = MimeInfo.builder(outputFormatToVideoMime);
        if (z) {
            builder.setCompatibleCamcorderProfile(camcorderProfileProxy);
        }
        return builder.build();
    }

    public static VideoEncoderConfig resolveVideoEncoderConfig(MimeInfo mimeInfo, Timebase timebase, VideoSpec videoSpec, Size size, Range<Integer> range) {
        Supplier videoEncoderConfigDefaultResolver;
        if (mimeInfo.getCompatibleCamcorderProfile() != null) {
            videoEncoderConfigDefaultResolver = new VideoEncoderConfigCamcorderProfileResolver(mimeInfo.getMimeType(), timebase, videoSpec, size, mimeInfo.getCompatibleCamcorderProfile(), range);
        } else {
            videoEncoderConfigDefaultResolver = new VideoEncoderConfigDefaultResolver(mimeInfo.getMimeType(), timebase, videoSpec, size, range);
        }
        return (VideoEncoderConfig) videoEncoderConfigDefaultResolver.get();
    }

    static int resolveFrameRate(Range<Integer> range, int i, Range<Integer> range2) {
        if (range2 != null) {
            try {
                range = range2.intersect(range);
            } catch (IllegalArgumentException unused) {
                if (range.getUpper().intValue() < range2.getLower().intValue()) {
                    return range2.getLower().intValue();
                }
                return range2.getUpper().intValue();
            }
        }
        return range.clamp(Integer.valueOf(i)).intValue();
    }

    static int scaleAndClampBitrate(int i, int i2, int i3, int i4, int i5, int i6, int i7, Range<Integer> range) {
        int doubleValue = (int) (i * new Rational(i2, i3).doubleValue() * new Rational(i4, i5).doubleValue() * new Rational(i6, i7).doubleValue());
        String format = Logger.isDebugEnabled(TAG) ? String.format("Base Bitrate(%dbps) * Frame Rate Ratio(%d / %d) * Width Ratio(%d / %d) * Height Ratio(%d / %d) = %d", Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3), Integer.valueOf(i4), Integer.valueOf(i5), Integer.valueOf(i6), Integer.valueOf(i7), Integer.valueOf(doubleValue)) : "";
        if (!VideoSpec.BITRATE_RANGE_AUTO.equals(range)) {
            doubleValue = range.clamp(Integer.valueOf(doubleValue)).intValue();
            if (Logger.isDebugEnabled(TAG)) {
                format = format + String.format("\nClamped to range %s -> %dbps", range, Integer.valueOf(doubleValue));
            }
        }
        Logger.d(TAG, format);
        return doubleValue;
    }
}
