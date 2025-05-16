package androidx.camera.core;

import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

/* loaded from: classes.dex */
public final class UseCaseGroup {
    private final List<CameraEffect> mEffects;
    private final List<UseCase> mUseCases;
    private final ViewPort mViewPort;

    UseCaseGroup(ViewPort viewPort, List<UseCase> list, List<CameraEffect> list2) {
        this.mViewPort = viewPort;
        this.mUseCases = list;
        this.mEffects = list2;
    }

    public ViewPort getViewPort() {
        return this.mViewPort;
    }

    public List<UseCase> getUseCases() {
        return this.mUseCases;
    }

    public List<CameraEffect> getEffects() {
        return this.mEffects;
    }

    public static final class Builder {
        private static final List<Integer> SUPPORTED_TARGETS = Arrays.asList(1, 4);
        private ViewPort mViewPort;
        private final List<UseCase> mUseCases = new ArrayList();
        private final List<CameraEffect> mEffects = new ArrayList();

        public Builder setViewPort(ViewPort viewPort) {
            this.mViewPort = viewPort;
            return this;
        }

        public Builder addEffect(CameraEffect cameraEffect) {
            this.mEffects.add(cameraEffect);
            return this;
        }

        private void checkEffectTargets() {
            HashMap hashMap = new HashMap();
            for (CameraEffect cameraEffect : this.mEffects) {
                int targets = cameraEffect.getTargets();
                if (!SUPPORTED_TARGETS.contains(Integer.valueOf(targets))) {
                    throw new IllegalArgumentException(String.format(Locale.US, "Target %s is not in the supported list %s.", getHumanReadableTargets(targets), getHumanReadableSupportedTargets()));
                }
                if (hashMap.containsKey(Integer.valueOf(cameraEffect.getTargets()))) {
                    Locale locale = Locale.US;
                    CameraEffect cameraEffect2 = (CameraEffect) hashMap.get(Integer.valueOf(cameraEffect.getTargets()));
                    Objects.requireNonNull(cameraEffect2);
                    throw new IllegalArgumentException(String.format(locale, "%s and %s contain duplicate targets %s.", cameraEffect2.getClass().getName(), cameraEffect.getClass().getName(), getHumanReadableTargets(targets)));
                }
                hashMap.put(Integer.valueOf(cameraEffect.getTargets()), cameraEffect);
            }
        }

        static String getHumanReadableSupportedTargets() {
            ArrayList arrayList = new ArrayList();
            Iterator<Integer> it = SUPPORTED_TARGETS.iterator();
            while (it.hasNext()) {
                arrayList.add(getHumanReadableTargets(it.next().intValue()));
            }
            return "[" + UseCaseGroup$Builder$$ExternalSyntheticBackport0.m(", ", arrayList) + "]";
        }

        static String getHumanReadableTargets(int i) {
            ArrayList arrayList = new ArrayList();
            if ((i & 4) != 0) {
                arrayList.add("IMAGE_CAPTURE");
            }
            if ((i & 1) != 0) {
                arrayList.add("PREVIEW");
            }
            if ((i & 2) != 0) {
                arrayList.add("VIDEO_CAPTURE");
            }
            return UseCaseGroup$Builder$$ExternalSyntheticBackport0.m("|", arrayList);
        }

        public Builder addUseCase(UseCase useCase) {
            this.mUseCases.add(useCase);
            return this;
        }

        public UseCaseGroup build() {
            Preconditions.checkArgument(!this.mUseCases.isEmpty(), "UseCase must not be empty.");
            checkEffectTargets();
            return new UseCaseGroup(this.mViewPort, this.mUseCases, this.mEffects);
        }
    }
}
