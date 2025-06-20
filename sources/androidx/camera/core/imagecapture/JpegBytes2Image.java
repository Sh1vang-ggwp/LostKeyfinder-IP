package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProcessingUtil;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.ImageReaderProxys;
import androidx.camera.core.SafeCloseImageReaderProxy;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import java.util.Objects;

/* loaded from: classes.dex */
public class JpegBytes2Image implements Operation<Packet<byte[]>, Packet<ImageProxy>> {
    private static final int MAX_IMAGES = 2;

    @Override // androidx.camera.core.processing.Operation
    public Packet<ImageProxy> apply(Packet<byte[]> packet) throws ImageCaptureException {
        SafeCloseImageReaderProxy safeCloseImageReaderProxy = new SafeCloseImageReaderProxy(ImageReaderProxys.createIsolatedReader(packet.getSize().getWidth(), packet.getSize().getHeight(), 256, 2));
        ImageProxy convertJpegBytesToImage = ImageProcessingUtil.convertJpegBytesToImage(safeCloseImageReaderProxy, packet.getData());
        safeCloseImageReaderProxy.safeClose();
        Objects.requireNonNull(convertJpegBytesToImage);
        Exif exif = packet.getExif();
        Objects.requireNonNull(exif);
        return Packet.of(convertJpegBytesToImage, exif, packet.getCropRect(), packet.getRotationDegrees(), packet.getSensorToBufferTransform(), packet.getCameraCaptureResult());
    }
}
