import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_app_bar.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/multiple_category_card.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/search_bar_widget.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/upload_picture_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar(context, label: 'Change Design'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Category',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 14),
            const Searchbar(),
            const SizedBox(height: 34),
            const UploadPictureCard(),
            const SizedBox(height: 34),
            Text(
              'Select multiple categories',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const MultipleCategoriesCard(),
            const Spacer(),
            CustomRedButton(
              labelText: 'Continue',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
