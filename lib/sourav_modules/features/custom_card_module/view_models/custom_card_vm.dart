import 'dart:io';

import 'package:custom_card_module/sourav_modules/features/custom_card_module/services/custom_card_service.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomCardVM extends ChangeNotifier {
  final customCardService = CustomCardService();

  bool isLoading = false;
  void setLoading(newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  String? imagePath;
  double? scale;

  void onScaleChange(double? newScaleValue) {
    scale = newScaleValue;
    notifyListeners();
  }

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

  Future<void> postImage({VoidCallback? onSuccess}) async {
    setLoading(true);
    try {
      if (imagePath != null) {
        final result = await customCardService.postBannerImage(imagePath!);

        print('result =====> $result');

        if (result.statusCode == 200 && result.data['success']) {
          onSuccess?.call();
        }
      }
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }
}
