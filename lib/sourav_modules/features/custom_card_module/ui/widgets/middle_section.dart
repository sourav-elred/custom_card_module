import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/awards_sections.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/bottom_section_for_card.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/cta_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiddleSection extends StatelessWidget {
  const MiddleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 58.0,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/artist.jpeg',
            ),
            radius: 50.0,
          ),
        ),
        Text(
          'Alexandra',
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.90,
          ),
        ),
        Text(
          'Stanton',
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.54,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Developer',
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.80,
          ),
        ),
        Text(
          'Bangalore, India',
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 40),
        const AwardsSection(),
        const SizedBox(height: 50),
        const CTAWidgets(),
        const Spacer(),
        const BottomSectionForCard(),
      ],
    );
  }
}
