import 'package:custom_card_module/sourav_modules/core/constants/routes.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BuildImagePickerIcons extends StatelessWidget {
  const BuildImagePickerIcons({
    super.key,
    this.isGallery = false,
    required this.isEditCard,
    required this.iconPath,
    required this.label,
  });

  final bool isGallery;
  final bool isEditCard;
  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImages(context, isEditCard, isGallery: isGallery),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(width: 0.75, color: Color(0xFFD8D7D7)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'AvenirNextLTPro',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

void _pickImages(BuildContext context, bool isEditCard,
    {required bool isGallery}) {
  context
      .read<CustomCardVM>()
      .pickImageFromCameraOrGallery(
          isGallery: isGallery, isEditCard: isEditCard)
      .then((imgPath) {
    if (imgPath != null) {
      if (isEditCard) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pushNamed(Routes.uploadScreen);
      }
    }
  });
}
