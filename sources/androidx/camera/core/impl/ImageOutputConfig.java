package androidx.camera.core.impl;

import android.util.Pair;
import android.util.Size;
import androidx.camera.core.AspectRatio;
import androidx.camera.core.ResolutionSelector;
import androidx.camera.core.impl.Config;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;

/* loaded from: classes.dex */
public interface ImageOutputConfig extends ReadableConfig {
    public static final int INVALID_ROTATION = -1;
    public static final int ROTATION_NOT_SPECIFIED = -1;
    public static final Config.Option<Integer> OPTION_TARGET_ASPECT_RATIO = Config.Option.create("camerax.core.imageOutput.targetAspectRatio", AspectRatio.class);
    public static final Config.Option<Integer> OPTION_TARGET_ROTATION = Config.Option.create("camerax.core.imageOutput.targetRotation", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_APP_TARGET_ROTATION = Config.Option.create("camerax.core.imageOutput.appTargetRotation", Integer.TYPE);
    public static final Config.Option<Size> OPTION_TARGET_RESOLUTION = Config.Option.create("camerax.core.imageOutput.targetResolution", Size.class);
    public static final Config.Option<Size> OPTION_DEFAULT_RESOLUTION = Config.Option.create("camerax.core.imageOutput.defaultResolution", Size.class);
    public static final Config.Option<Size> OPTION_MAX_RESOLUTION = Config.Option.create("camerax.core.imageOutput.maxResolution", Size.class);
    public static final Config.Option<List<Pair<Integer, Size[]>>> OPTION_SUPPORTED_RESOLUTIONS = Config.Option.create("camerax.core.imageOutput.supportedResolutions", List.class);
    public static final Config.Option<ResolutionSelector> OPTION_RESOLUTION_SELECTOR = Config.Option.create("camerax.core.imageOutput.resolutionSelector", ResolutionSelector.class);

    public interface Builder<B> {
        B setDefaultResolution(Size size);

        B setMaxResolution(Size size);

        B setResolutionSelector(ResolutionSelector resolutionSelector);

        B setSupportedResolutions(List<Pair<Integer, Size[]>> list);

        B setTargetAspectRatio(int i);

        B setTargetResolution(Size size);

        B setTargetRotation(int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface OptionalRotationValue {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface RotationDegreesValue {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface RotationValue {
    }

    int getAppTargetRotation(int i);

    Size getDefaultResolution();

    Size getDefaultResolution(Size size);

    Size getMaxResolution();

    Size getMaxResolution(Size size);

    ResolutionSelector getResolutionSelector();

    ResolutionSelector getResolutionSelector(ResolutionSelector resolutionSelector);

    List<Pair<Integer, Size[]>> getSupportedResolutions();

    List<Pair<Integer, Size[]>> getSupportedResolutions(List<Pair<Integer, Size[]>> list);

    int getTargetAspectRatio();

    Size getTargetResolution();

    Size getTargetResolution(Size size);

    int getTargetRotation();

    int getTargetRotation(int i);

    boolean hasTargetAspectRatio();

    /* renamed from: androidx.camera.core.impl.ImageOutputConfig$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        static {
            int i = ImageOutputConfig.INVALID_ROTATION;
        }

        public static Size $default$getTargetResolution(ImageOutputConfig _this, Size size) {
            return (Size) _this.retrieveOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION, size);
        }

        public static Size $default$getTargetResolution(ImageOutputConfig _this) {
            return (Size) _this.retrieveOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION);
        }

        public static Size $default$getDefaultResolution(ImageOutputConfig _this, Size size) {
            return (Size) _this.retrieveOption(ImageOutputConfig.OPTION_DEFAULT_RESOLUTION, size);
        }

        public static Size $default$getDefaultResolution(ImageOutputConfig _this) {
            return (Size) _this.retrieveOption(ImageOutputConfig.OPTION_DEFAULT_RESOLUTION);
        }

        public static Size $default$getMaxResolution(ImageOutputConfig _this, Size size) {
            return (Size) _this.retrieveOption(ImageOutputConfig.OPTION_MAX_RESOLUTION, size);
        }

        public static Size $default$getMaxResolution(ImageOutputConfig _this) {
            return (Size) _this.retrieveOption(ImageOutputConfig.OPTION_MAX_RESOLUTION);
        }

        public static List $default$getSupportedResolutions(ImageOutputConfig _this, List list) {
            return (List) _this.retrieveOption(ImageOutputConfig.OPTION_SUPPORTED_RESOLUTIONS, list);
        }

        public static ResolutionSelector $default$getResolutionSelector(ImageOutputConfig _this, ResolutionSelector resolutionSelector) {
            return (ResolutionSelector) _this.retrieveOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelector);
        }

        public static ResolutionSelector $default$getResolutionSelector(ImageOutputConfig _this) {
            return (ResolutionSelector) _this.retrieveOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR);
        }

        public static List $default$getSupportedResolutions(ImageOutputConfig _this) {
            return (List) _this.retrieveOption(ImageOutputConfig.OPTION_SUPPORTED_RESOLUTIONS);
        }

        public static void validateConfig(ImageOutputConfig imageOutputConfig) {
            boolean hasTargetAspectRatio = imageOutputConfig.hasTargetAspectRatio();
            boolean z = imageOutputConfig.getTargetResolution(null) != null;
            if (hasTargetAspectRatio && z) {
                throw new IllegalArgumentException("Cannot use both setTargetResolution and setTargetAspectRatio on the same config.");
            }
            if (imageOutputConfig.getResolutionSelector(null) != null) {
                if (hasTargetAspectRatio || z) {
                    throw new IllegalArgumentException("Cannot use setTargetResolution or setTargetAspectRatio with setResolutionSelector on the same config.");
                }
            }
        }
    }
}
