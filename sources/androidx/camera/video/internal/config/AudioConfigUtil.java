package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Rational;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.internal.AudioSource;
import androidx.camera.video.internal.encoder.AudioEncoderConfig;
import androidx.core.util.Supplier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/* loaded from: classes.dex */
public final class AudioConfigUtil {
    static final int AUDIO_CHANNEL_COUNT_DEFAULT = 1;
    static final int AUDIO_SAMPLE_RATE_DEFAULT = 44100;
    static final int AUDIO_SOURCE_DEFAULT = 5;
    static final int AUDIO_SOURCE_FORMAT_DEFAULT = 2;
    private static final String TAG = "AudioConfigUtil";

    private AudioConfigUtil() {
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x00c5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static androidx.camera.video.internal.config.MimeInfo resolveAudioMimeInfo(androidx.camera.video.MediaSpec r9, androidx.camera.core.impl.CamcorderProfileProxy r10) {
        /*
            int r0 = r9.getOutputFormat()
            java.lang.String r0 = androidx.camera.video.MediaSpec.outputFormatToAudioMime(r0)
            int r1 = r9.getOutputFormat()
            int r1 = androidx.camera.video.MediaSpec.outputFormatToAudioProfile(r1)
            r2 = 1
            if (r10 == 0) goto Lba
            java.lang.String r3 = r10.getAudioCodecMimeType()
            int r4 = r10.getRequiredAudioProfile()
            java.lang.String r5 = ")]"
            java.lang.String r6 = "AudioConfigUtil"
            java.lang.String r7 = "(profile: "
            if (r3 != 0) goto L42
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            r9.<init>()
            java.lang.String r2 = "CamcorderProfile contains undefined AUDIO mime type so cannot be used. May rely on fallback defaults to derive settings [chosen mime type: "
            r9.append(r2)
            r9.append(r0)
            r9.append(r7)
            r9.append(r1)
            r9.append(r5)
            java.lang.String r9 = r9.toString()
            androidx.camera.core.Logger.d(r6, r9)
            goto Lba
        L42:
            int r9 = r9.getOutputFormat()
            r8 = -1
            if (r9 != r8) goto L69
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            r9.<init>()
            java.lang.String r0 = "MediaSpec contains OUTPUT_FORMAT_AUTO. Using CamcorderProfile to derive AUDIO settings [mime type: "
            r9.append(r0)
            r9.append(r3)
            r9.append(r7)
            r9.append(r4)
            r9.append(r5)
            java.lang.String r9 = r9.toString()
            androidx.camera.core.Logger.d(r6, r9)
        L66:
            r0 = r3
            r1 = r4
            goto Lbb
        L69:
            boolean r9 = java.util.Objects.equals(r0, r3)
            if (r9 == 0) goto L8f
            if (r1 != r4) goto L8f
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            r9.<init>()
            java.lang.String r0 = "MediaSpec audio mime/profile matches CamcorderProfile. Using CamcorderProfile to derive AUDIO settings [mime type: "
            r9.append(r0)
            r9.append(r3)
            r9.append(r7)
            r9.append(r4)
            r9.append(r5)
            java.lang.String r9 = r9.toString()
            androidx.camera.core.Logger.d(r6, r9)
            goto L66
        L8f:
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            r9.<init>()
            java.lang.String r2 = "MediaSpec audio mime or profile does not match CamcorderProfile, so CamcorderProfile settings cannot be used. May rely on fallback defaults to derive AUDIO settings [CamcorderProfile mime type: "
            r9.append(r2)
            r9.append(r3)
            r9.append(r7)
            r9.append(r4)
            java.lang.String r2 = "), chosen mime type: "
            r9.append(r2)
            r9.append(r0)
            r9.append(r7)
            r9.append(r1)
            r9.append(r5)
            java.lang.String r9 = r9.toString()
            androidx.camera.core.Logger.d(r6, r9)
        Lba:
            r2 = 0
        Lbb:
            androidx.camera.video.internal.config.MimeInfo$Builder r9 = androidx.camera.video.internal.config.MimeInfo.builder(r0)
            androidx.camera.video.internal.config.MimeInfo$Builder r9 = r9.setProfile(r1)
            if (r2 == 0) goto Lc8
            r9.setCompatibleCamcorderProfile(r10)
        Lc8:
            androidx.camera.video.internal.config.MimeInfo r9 = r9.build()
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.internal.config.AudioConfigUtil.resolveAudioMimeInfo(androidx.camera.video.MediaSpec, androidx.camera.core.impl.CamcorderProfileProxy):androidx.camera.video.internal.config.MimeInfo");
    }

    public static AudioSource.Settings resolveAudioSourceSettings(MimeInfo mimeInfo, AudioSpec audioSpec) {
        Supplier audioSourceSettingsDefaultResolver;
        if (mimeInfo.getCompatibleCamcorderProfile() != null) {
            audioSourceSettingsDefaultResolver = new AudioSourceSettingsCamcorderProfileResolver(audioSpec, mimeInfo.getCompatibleCamcorderProfile());
        } else {
            audioSourceSettingsDefaultResolver = new AudioSourceSettingsDefaultResolver(audioSpec);
        }
        return (AudioSource.Settings) audioSourceSettingsDefaultResolver.get();
    }

    public static AudioEncoderConfig resolveAudioEncoderConfig(MimeInfo mimeInfo, Timebase timebase, AudioSource.Settings settings, AudioSpec audioSpec) {
        Supplier audioEncoderConfigDefaultResolver;
        if (mimeInfo.getCompatibleCamcorderProfile() != null) {
            audioEncoderConfigDefaultResolver = new AudioEncoderConfigCamcorderProfileResolver(mimeInfo.getMimeType(), mimeInfo.getProfile(), timebase, audioSpec, settings, mimeInfo.getCompatibleCamcorderProfile());
        } else {
            audioEncoderConfigDefaultResolver = new AudioEncoderConfigDefaultResolver(mimeInfo.getMimeType(), mimeInfo.getProfile(), timebase, audioSpec, settings);
        }
        return (AudioEncoderConfig) audioEncoderConfigDefaultResolver.get();
    }

    static int resolveAudioSource(AudioSpec audioSpec) {
        int source = audioSpec.getSource();
        if (source == -1) {
            Logger.d(TAG, "Using default AUDIO source: 5");
            return 5;
        }
        Logger.d(TAG, "Using provided AUDIO source: " + source);
        return source;
    }

    static int resolveAudioSourceFormat(AudioSpec audioSpec) {
        int sourceFormat = audioSpec.getSourceFormat();
        if (sourceFormat == -1) {
            Logger.d(TAG, "Using default AUDIO source format: 2");
            return 2;
        }
        Logger.d(TAG, "Using provided AUDIO source format: " + sourceFormat);
        return sourceFormat;
    }

    static int selectSampleRateOrNearestSupported(Range<Integer> range, int i, int i2, final int i3) {
        ArrayList arrayList = null;
        int i4 = 0;
        int i5 = i3;
        while (true) {
            if (range.contains((Range<Integer>) Integer.valueOf(i5))) {
                if (AudioSource.isSettingsSupported(i5, i, i2)) {
                    return i5;
                }
                Logger.d(TAG, "Sample rate " + i5 + "Hz is not supported by audio source with channel count " + i + " and source format " + i2);
            } else {
                Logger.d(TAG, "Sample rate " + i5 + "Hz is not in target range " + range);
            }
            if (arrayList == null) {
                Logger.d(TAG, "Trying common sample rates in proximity order to target " + i3 + "Hz");
                arrayList = new ArrayList(AudioSource.COMMON_SAMPLE_RATES);
                Collections.sort(arrayList, new Comparator() { // from class: androidx.camera.video.internal.config.AudioConfigUtil$$ExternalSyntheticLambda0
                    @Override // java.util.Comparator
                    public final int compare(Object obj, Object obj2) {
                        return AudioConfigUtil.lambda$selectSampleRateOrNearestSupported$0(i3, (Integer) obj, (Integer) obj2);
                    }
                });
            }
            if (i4 < arrayList.size()) {
                i5 = ((Integer) arrayList.get(i4)).intValue();
                i4++;
            } else {
                Logger.d(TAG, "No sample rate found in target range or supported by audio source. Falling back to default sample rate of 44100Hz");
                return AUDIO_SAMPLE_RATE_DEFAULT;
            }
        }
    }

    static /* synthetic */ int lambda$selectSampleRateOrNearestSupported$0(int i, Integer num, Integer num2) {
        float signum;
        int abs = Math.abs(num.intValue() - i) - Math.abs(num2.intValue() - i);
        if (abs == 0) {
            signum = Math.signum(num.intValue() - num2.intValue());
        } else {
            signum = Math.signum(abs);
        }
        return (int) signum;
    }

    static int scaleAndClampBitrate(int i, int i2, int i3, int i4, int i5, Range<Integer> range) {
        int doubleValue = (int) (i * new Rational(i2, i3).doubleValue() * new Rational(i4, i5).doubleValue());
        String format = Logger.isDebugEnabled(TAG) ? String.format("Base Bitrate(%dbps) * Channel Count Ratio(%d / %d) * Sample Rate Ratio(%d / %d) = %d", Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3), Integer.valueOf(i4), Integer.valueOf(i5), Integer.valueOf(doubleValue)) : "";
        if (!AudioSpec.BITRATE_RANGE_AUTO.equals(range)) {
            doubleValue = range.clamp(Integer.valueOf(doubleValue)).intValue();
            if (Logger.isDebugEnabled(TAG)) {
                format = format + String.format("\nClamped to range %s -> %dbps", range, Integer.valueOf(doubleValue));
            }
        }
        Logger.d(TAG, format);
        return doubleValue;
    }
}
