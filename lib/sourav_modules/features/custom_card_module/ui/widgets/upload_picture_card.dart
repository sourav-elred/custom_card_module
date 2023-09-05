import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/botton_sheet_for_image_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadPictureCard extends StatelessWidget {
  const UploadPictureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottonSheetForImageUpload(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 13,
        decoration: ShapeDecoration(
          color: const Color(0xFFD7E8FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(
                    'assets/icons/material-symbols_magic-button.svg',
                  ),
                ),
              ],
            ),
            const Text(
              'Upload picture',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF147BFF),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SvgPicture.asset(
                    'assets/icons/material-symbols_magic-button-2.svg',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
