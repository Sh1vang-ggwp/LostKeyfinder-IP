package androidx.camera.video.internal.workaround;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.text.TextUtils;
import androidx.camera.core.Logger;
import androidx.camera.video.internal.DebugUtils;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.MediaCodecInfoReportIncorrectInfoQuirk;
import androidx.camera.video.internal.compat.quirk.MediaFormatMustNotUseFrameRateToFindEncoderQuirk;
import androidx.camera.video.internal.encoder.InvalidConfigException;
import androidx.core.util.Preconditions;
import java.io.IOException;

/* loaded from: classes.dex */
public class EncoderFinder {
    private static final String TAG = "EncoderFinder";
    private final boolean mShouldRemoveKeyFrameRate;

    public EncoderFinder() {
        this.mShouldRemoveKeyFrameRate = ((MediaFormatMustNotUseFrameRateToFindEncoderQuirk) DeviceQuirks.get(MediaFormatMustNotUseFrameRateToFindEncoderQuirk.class)) != null;
    }

    public MediaCodec findEncoder(MediaFormat mediaFormat) throws InvalidConfigException {
        MediaCodecList mediaCodecList = new MediaCodecList(1);
        String findEncoderForFormat = findEncoderForFormat(mediaFormat, mediaCodecList);
        try {
            if (TextUtils.isEmpty(findEncoderForFormat)) {
                String string = mediaFormat.getString("mime");
                MediaCodec createEncoderByType = MediaCodec.createEncoderByType(string);
                Logger.w(TAG, String.format("No encoder found that supports requested MediaFormat %s. Create encoder by MIME type. Dump codec info:\n%s", mediaFormat, DebugUtils.dumpCodecCapabilities(string, createEncoderByType, mediaFormat)));
                return createEncoderByType;
            }
            return MediaCodec.createByCodecName(findEncoderForFormat);
        } catch (IOException | IllegalArgumentException | NullPointerException e) {
            throw new InvalidConfigException("Encoder cannot created: " + findEncoderForFormat + ", isMediaFormatInQuirk: " + shouldCreateCodecByType(mediaFormat) + "\n" + DebugUtils.dumpMediaCodecListForFormat(mediaCodecList, mediaFormat), e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0069  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    java.lang.String findEncoderForFormat(android.media.MediaFormat r7, android.media.MediaCodecList r8) {
        /*
            r6 = this;
            java.lang.String r0 = "aac-profile"
            java.lang.String r1 = "frame-rate"
            r2 = 0
            boolean r3 = r6.mShouldRemoveKeyFrameRate     // Catch: java.lang.Throwable -> L5c
            if (r3 == 0) goto L1b
            boolean r3 = r7.containsKey(r1)     // Catch: java.lang.Throwable -> L5c
            if (r3 == 0) goto L1b
            int r3 = r7.getInteger(r1)     // Catch: java.lang.Throwable -> L5c
            java.lang.Integer r3 = java.lang.Integer.valueOf(r3)     // Catch: java.lang.Throwable -> L5c
            r7.setString(r1, r2)     // Catch: java.lang.Throwable -> L58
            goto L1c
        L1b:
            r3 = r2
        L1c:
            int r4 = android.os.Build.VERSION.SDK_INT     // Catch: java.lang.Throwable -> L58
            r5 = 23
            if (r4 > r5) goto L37
            boolean r4 = r7.containsKey(r0)     // Catch: java.lang.Throwable -> L58
            if (r4 == 0) goto L37
            int r4 = r7.getInteger(r0)     // Catch: java.lang.Throwable -> L58
            java.lang.Integer r4 = java.lang.Integer.valueOf(r4)     // Catch: java.lang.Throwable -> L58
            r7.setString(r0, r2)     // Catch: java.lang.Throwable -> L35
            r2 = r4
            goto L37
        L35:
            r8 = move-exception
            goto L5a
        L37:
            java.lang.String r4 = r8.findEncoderForFormat(r7)     // Catch: java.lang.Throwable -> L58
            if (r4 != 0) goto L45
            android.media.MediaCodecInfo[] r8 = r8.getCodecInfos()     // Catch: java.lang.Throwable -> L58
            java.lang.String r4 = r6.findEncoderWithNearestCompatibleBitrate(r7, r8)     // Catch: java.lang.Throwable -> L58
        L45:
            if (r3 == 0) goto L4e
            int r8 = r3.intValue()
            r7.setInteger(r1, r8)
        L4e:
            if (r2 == 0) goto L57
            int r8 = r2.intValue()
            r7.setInteger(r0, r8)
        L57:
            return r4
        L58:
            r8 = move-exception
            r4 = r2
        L5a:
            r2 = r3
            goto L5e
        L5c:
            r8 = move-exception
            r4 = r2
        L5e:
            if (r2 == 0) goto L67
            int r2 = r2.intValue()
            r7.setInteger(r1, r2)
        L67:
            if (r4 == 0) goto L70
            int r1 = r4.intValue()
            r7.setInteger(r0, r1)
        L70:
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.internal.workaround.EncoderFinder.findEncoderForFormat(android.media.MediaFormat, android.media.MediaCodecList):java.lang.String");
    }

    private String findEncoderWithNearestCompatibleBitrate(MediaFormat mediaFormat, MediaCodecInfo[] mediaCodecInfoArr) {
        int i;
        Integer num;
        MediaCodecInfo.CodecCapabilities capabilitiesForType;
        int i2;
        String string = mediaFormat.getString("mime");
        Integer num2 = null;
        if (string == null) {
            Logger.w(TAG, "MediaFormat does not contain mime info.");
            return null;
        }
        int length = mediaCodecInfoArr.length;
        while (i < length) {
            MediaCodecInfo mediaCodecInfo = mediaCodecInfoArr[i];
            if (mediaCodecInfo.isEncoder()) {
                try {
                    capabilitiesForType = mediaCodecInfo.getCapabilitiesForType(string);
                    Preconditions.checkArgument(capabilitiesForType != null, "MIME type is not supported");
                    i2 = -1;
                    if (mediaFormat.containsKey("bitrate")) {
                        MediaCodecInfo.VideoCapabilities videoCapabilities = capabilitiesForType.getVideoCapabilities();
                        Preconditions.checkArgument(videoCapabilities != null, "Not video codec");
                        num = Integer.valueOf(mediaFormat.getInteger("bitrate"));
                        try {
                            i2 = videoCapabilities.getBitrateRange().clamp(num).intValue();
                            mediaFormat.setInteger("bitrate", i2);
                        } catch (IllegalArgumentException unused) {
                            i = num == null ? i + 1 : 0;
                            mediaFormat.setInteger("bitrate", num.intValue());
                        } catch (Throwable th) {
                            th = th;
                            num2 = num;
                            if (num2 != null) {
                                mediaFormat.setInteger("bitrate", num2.intValue());
                            }
                            throw th;
                        }
                    } else {
                        num = null;
                    }
                } catch (IllegalArgumentException unused2) {
                    num = null;
                } catch (Throwable th2) {
                    th = th2;
                }
                if (capabilitiesForType.isFormatSupported(mediaFormat)) {
                    Logger.w(TAG, String.format("No encoder found that supports requested bitrate. Adjusting bitrate to nearest supported bitrate [requested: %dbps, nearest: %dbps]", num, Integer.valueOf(i2)));
                    String name = mediaCodecInfo.getName();
                    if (num != null) {
                        mediaFormat.setInteger("bitrate", num.intValue());
                    }
                    return name;
                }
                if (num == null) {
                }
                mediaFormat.setInteger("bitrate", num.intValue());
            }
        }
        return null;
    }

    private boolean shouldCreateCodecByType(MediaFormat mediaFormat) {
        MediaCodecInfoReportIncorrectInfoQuirk mediaCodecInfoReportIncorrectInfoQuirk = (MediaCodecInfoReportIncorrectInfoQuirk) DeviceQuirks.get(MediaCodecInfoReportIncorrectInfoQuirk.class);
        if (mediaCodecInfoReportIncorrectInfoQuirk == null) {
            return false;
        }
        return mediaCodecInfoReportIncorrectInfoQuirk.isUnSupportMediaCodecInfo(mediaFormat);
    }
}
