import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:custom_card_module/sourav_modules/features/custom_card_module/services/custom_card_service.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class CustomCardVM extends ChangeNotifier {
  final customCardService = CustomCardService();

  File? image;

  bool isLoading = false;
  void setLoading(newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  Future<String?> pickImageFromCameraOrGallery(
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

  File? _tempImage;
  File? get tempImage => _tempImage;
  set setTempImage(File? newImage) {
    _tempImage = newImage;
    notifyListeners();
  }

  Future<String?> cropSelectedImage(String filePath, bool isEditCard) async {
    final response = await ImageCropper().cropImage(
      sourcePath: filePath,
      uiSettings: [
        AndroidUiSettings(
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );
    if (isEditCard) {
      setTempImage = File(response!.path);
    } else {
      image = File(response!.path);
    }
    return response.path;
  }

  Future<void> changeImage(Uint8List? imageBytes,
      {VoidCallback? onSuccess}) async {
    try {
      if (imageBytes == null) {
        return;
      }

      setLoading(true);
      final directory = await getApplicationDocumentsDirectory();
      final imagePath =
          await File('${directory.path}/image${Random().nextDouble()} .png')
              .create();

      image =
          await imagePath.writeAsBytes(imageBytes, mode: FileMode.writeOnly);
      await postImage(onSuccess: () {
        onSuccess?.call();
        setTempImage = null;
      });
    } catch (e) {
      print(e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<void> postImage({VoidCallback? onSuccess}) async {
    setLoading(true);
    try {
      if (image != null) {
        final result = await customCardService.postBannerImage(image!.path);

        print('result =====> $result');

        if (result) {
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
