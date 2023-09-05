import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomCardVM extends ChangeNotifier {
  String? imagePath;

  Future<String?> pickImageFromCameraOrGallery({bool isGallery = true}) async {
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
        // getSnackBar(
        //     context: navigatorKey.currentContext!,
        //     text: "Ismage size is larger than 10 Mb");
        return null;
      }

      return cropSelectedImage(response.path);
    }
    return null;
  }

  Future<String?> cropSelectedImage(String filePath) async {
    final response = await ImageCropper().cropImage(
      sourcePath: filePath,
      uiSettings: [
        AndroidUiSettings(
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );
    imagePath = response?.path;
    notifyListeners();
    return response?.path;
  }
}
