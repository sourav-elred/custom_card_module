import 'dart:io';
import 'dart:math';

import 'package:custom_card_module/sourav_modules/features/custom_card_module/services/custom_card_service.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/utlis/media.dart';
import 'package:flutter/material.dart';
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

  Future<String?> callImagePickerAndCropper(
      {bool isGallery = true, required bool isEditCard}) async {
    final path = await MediaUtlis.pickImageFromCameraOrGallery(
      isGallery: isGallery,
      isEditCard: isEditCard,
    );

    if (path != null) {
      if (isEditCard) {
        setTempImage = File(path);
      } else {
        image = File(path);
      }
    }
    return path;
  }

  File? _tempImage;
  File? get tempImage => _tempImage;
  set setTempImage(File? newImage) {
    _tempImage = newImage;
    notifyListeners();
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
