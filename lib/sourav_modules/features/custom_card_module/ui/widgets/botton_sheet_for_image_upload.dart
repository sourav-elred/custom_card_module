import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/build_image_picker_icons.dart';
import 'package:flutter/material.dart';

PersistentBottomSheetController<dynamic> showBottonSheetForImageUpload(
  BuildContext context, {
  bool isEditCard = false,
}) {
  return showBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * .2,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildImagePickerIcons(
                  isEditCard: isEditCard,
                  iconPath: 'assets/icons/material-symbols_photo-camera.svg',
                  label: 'Camera',
                ),
                const SizedBox(width: 40),
                BuildImagePickerIcons(
                  isEditCard: isEditCard,
                  iconPath: 'assets/icons/bi_image.svg',
                  label: 'Gallery',
                  isGallery: true,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
