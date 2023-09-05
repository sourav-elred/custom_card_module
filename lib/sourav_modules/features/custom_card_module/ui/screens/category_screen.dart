import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/botton_sheet_for_image_upload.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/single_category_card.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            Text(
              'Change Design',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
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
            const SizedBox(height: 20),
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

class MultipleCategoriesCard extends StatelessWidget {
  const MultipleCategoriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.1,
      child: GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          childAspectRatio: 1.5,
        ),
        children: const [
          SingleCategoryCard(
            imageUrl: 'assets/images/photography.jpeg',
            label: 'Cricket',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/music.jpeg',
            label: 'Music',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/luxury.jpeg',
            label: 'Luxury',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/landscaping.jpeg',
            label: 'Landscape',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/teacher.jpeg',
            label: 'Teacher',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/cute.jpeg',
            label: 'Cute',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/fitness.jpeg',
            label: 'Fitness',
          ),
          SingleCategoryCard(
            imageUrl: 'assets/images/artist.jpeg',
            label: 'Artist',
          ),
        ],
      ),
    );
  }
}

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

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search categories',
          hintStyle: GoogleFonts.roboto(
            color: Colors.black.withOpacity(0.30000001192092896),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.29,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0.50,
              color: Color(0xFFC5C5C5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0.50,
              color: Color(0xFFC5C5C5),
            ),
          ),
        ),
      ),
    );
  }
}
