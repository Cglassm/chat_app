import 'dart:typed_data';

import 'package:image_cropper/image_cropper.dart';

/// {@template cropper_service}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class CropperService {
  /// {@macro cropper_service}
  CropperService({
    ImageCropper? imageCropper,
  }) : _imageCropper = imageCropper ?? ImageCropper();

  final ImageCropper _imageCropper;

  /// Returns the image in [filePath] cropped as a in-memory byte list
  Future<Uint8List?> cropImage({required String filePath}) async {
    final cropped = await _imageCropper.cropImage(
      sourcePath: filePath,
      // maxWidth: null,
      // maxHeight: null,
      // aspectRatio: null,
      // aspectRatioPresets: aspectRatioPresets,
      // cropStyle: null,
      // compressFormat: null,
      // compressQuality: null,
      // uiSettings: null,
    );

    return cropped?.readAsBytes();
  }
}
