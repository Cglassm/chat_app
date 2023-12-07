// ignore_for_file: prefer_const_constructors

import 'package:cropper_service/cropper_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mocktail/mocktail.dart';

class MockImageCropper extends Mock implements ImageCropper {}

void main() {
  group('CropperService', () {
    test('can be instantiated', () {
      expect(CropperService(imageCropper: MockImageCropper()), isNotNull);
    });
  });
}
