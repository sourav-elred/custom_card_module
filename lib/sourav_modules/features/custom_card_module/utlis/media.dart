import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MediaUtlis {
  static Future<String?> pickImageFromCameraOrGallery(
      {bool isGallery = true, required bool isEditCard}) async {
    final ImagePicker picker = ImagePicker();
    final response = await picker.pickImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 100,
        maxHeight: 1800,
        maxWidth: 1800);
    if (response != null) {
      final bytes = File(response.path).readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      final mb = kb / 1024;
      if (mb > 10) {
        return null;
      }
      return cropSelectedImage(response.path, isEditCard);
    }
    return null;
  }

  static Future<String?> cropSelectedImage(
      String filePath, bool isEditCard) async {
    final response = await ImageCropper().cropImage(
      sourcePath: filePath,
      uiSettings: [
        AndroidUiSettings(
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );
    return response!.path;
  }
}
