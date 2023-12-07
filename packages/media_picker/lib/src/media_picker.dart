import 'dart:typed_data';

import 'package:cropper_service/cropper_service.dart';
import 'package:image_picker/image_picker.dart';

/// {@template media_picker}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class MediaPicker {
  /// {@macro media_picker}
  MediaPicker({
    ImagePicker? imagePicker,
    CropperService? cropperService,
  })  : _imagePicker = imagePicker ?? ImagePicker(),
        _cropperService = cropperService ?? CropperService();

  final ImagePicker _imagePicker;
  final CropperService _cropperService;

  /// Pick an image from the device storage or take a picture with the camera
  Future<Uint8List?> pickImage({
    required ImageSource source,
    bool crop = true,
  }) async {
    final pickedImage = await _imagePicker.pickImage(source: source);

    if (pickedImage == null || !crop) return pickedImage?.readAsBytes();

    final cropped = await _cropperService.cropImage(filePath: pickedImage.path);

    return cropped;
  }
}
