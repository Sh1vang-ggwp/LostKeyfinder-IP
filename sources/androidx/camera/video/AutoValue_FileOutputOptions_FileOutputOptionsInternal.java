package androidx.camera.video;

import android.location.Location;
import androidx.camera.video.FileOutputOptions;
import java.io.File;
import java.util.Objects;

/* loaded from: classes.dex */
final class AutoValue_FileOutputOptions_FileOutputOptionsInternal extends FileOutputOptions.FileOutputOptionsInternal {
    private final long durationLimitMillis;
    private final File file;
    private final long fileSizeLimit;
    private final Location location;

    private AutoValue_FileOutputOptions_FileOutputOptionsInternal(long j, long j2, Location location, File file) {
        this.fileSizeLimit = j;
        this.durationLimitMillis = j2;
        this.location = location;
        this.file = file;
    }

    @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal
    long getFileSizeLimit() {
        return this.fileSizeLimit;
    }

    @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal
    long getDurationLimitMillis() {
        return this.durationLimitMillis;
    }

    @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal
    Location getLocation() {
        return this.location;
    }

    @Override // androidx.camera.video.FileOutputOptions.FileOutputOptionsInternal
    File getFile() {
        return this.file;
    }

    public String toString() {
        return "FileOutputOptionsInternal{fileSizeLimit=" + this.fileSizeLimit + ", durationLimitMillis=" + this.durationLimitMillis + ", location=" + this.location + ", file=" + this.file + "}";
    }

    public boolean equals(Object obj) {
        Location location;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof FileOutputOptions.FileOutputOptionsInternal)) {
            return false;
        }
        FileOutputOptions.FileOutputOptionsInternal fileOutputOptionsInternal = (FileOutputOptions.FileOutputOptionsInternal) obj;
        return this.fileSizeLimit == fileOutputOptionsInternal.getFileSizeLimit() && this.durationLimitMillis == fileOutputOptionsInternal.getDurationLimitMillis() && ((location = this.location) != null ? location.equals(fileOutputOptionsInternal.getLocation()) : fileOutputOptionsInternal.getLocation() == null) && this.file.equals(fileOutputOptionsInternal.getFile());
    }

    public int hashCode() {
        long j = this.fileSizeLimit;
        long j2 = this.durationLimitMillis;
        int i = (((((int) (j ^ (j >>> 32))) ^ 1000003) * 1000003) ^ ((int) ((j2 >>> 32) ^ j2))) * 1000003;
        Location location = this.location;
        return this.file.hashCode() ^ ((i ^ (location == null ? 0 : location.hashCode())) * 1000003);
    }

    static final class Builder extends FileOutputOptions.FileOutputOptionsInternal.Builder {
        private Long durationLimitMillis;
        private File file;
        private Long fileSizeLimit;
        private Location location;

        Builder() {
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileOutputOptions.FileOutputOptionsInternal.Builder setFileSizeLimit(long j) {
            this.fileSizeLimit = Long.valueOf(j);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileOutputOptions.FileOutputOptionsInternal.Builder setDurationLimitMillis(long j) {
            this.durationLimitMillis = Long.valueOf(j);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileOutputOptions.FileOutputOptionsInternal.Builder setLocation(Location location) {
            this.location = location;
            return this;
        }

        @Override // androidx.camera.video.FileOutputOptions.FileOutputOptionsInternal.Builder
        FileOutputOptions.FileOutputOptionsInternal.Builder setFile(File file) {
            Objects.requireNonNull(file, "Null file");
            this.file = file;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // androidx.camera.video.FileOutputOptions.FileOutputOptionsInternal.Builder, androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileOutputOptions.FileOutputOptionsInternal build() {
            String str = "";
            if (this.fileSizeLimit == null) {
                str = " fileSizeLimit";
            }
            if (this.durationLimitMillis == null) {
                str = str + " durationLimitMillis";
            }
            if (this.file == null) {
                str = str + " file";
            }
            if (!str.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + str);
            }
            return new AutoValue_FileOutputOptions_FileOutputOptionsInternal(this.fileSizeLimit.longValue(), this.durationLimitMillis.longValue(), this.location, this.file);
        }
    }
}
