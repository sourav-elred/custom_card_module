import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
                GestureDetector(
                  onTap: () {
                    context
                        .read<CustomCardVM>()
                        .pickImageFromCameraOrGallery(isGallery: false)
                        .then((imgPath) {
                      if (imgPath != null) {
                        if (isEditCard) {
                          Navigator.of(context)
                              .pushNamed('/customize-card-screen');
                        } else {
                          Navigator.of(context).pushNamed('/upload-screen');
                        }
                      }
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(
                                width: 0.75, color: Color(0xFFD8D7D7)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icons/material-symbols_photo-camera.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      const Text(
                        'Camera',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () {
                    context
                        .read<CustomCardVM>()
                        .pickImageFromCameraOrGallery()
                        .then((imgPath) {
                      if (imgPath != null) {
                        if (isEditCard) {
                          Navigator.of(context)
                              .pushNamed('/customize-card-screen');
                        } else {
                          Navigator.of(context).pushNamed('/upload-screen');
                        }
                      }
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(
                                width: 0.75, color: Color(0xFFD8D7D7)),
                          ),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/bi_image.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Text(
                        'Gallery',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
