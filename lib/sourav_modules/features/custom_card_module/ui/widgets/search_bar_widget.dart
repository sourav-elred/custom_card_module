import 'package:custom_card_module/sourav_modules/core/constants/assets.dart';
import 'package:custom_card_module/sourav_modules/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: SvgPicture.asset(AssetsConstants.searchIcon),
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
              color: ColorConstants.elRedGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0.50,
              color: ColorConstants.elRedGrey,
            ),
          ),
        ),
      ),
    );
  }
}
