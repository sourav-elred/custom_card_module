import 'package:custom_card_module/sourav_modules/core/constants/assets.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/botton_sheet_for_image_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoosePictureWidget extends StatelessWidget {
  const ChoosePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          showBottonSheetForImageUpload(context, isEditCard: true);
        },
        child: Container(
          margin: const EdgeInsets.all(18),
          height: MediaQuery.of(context).size.height * .07,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFCDDAEA).withOpacity(.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsConstants.galleryIcon,
                height: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'Change picture here and adjust',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
