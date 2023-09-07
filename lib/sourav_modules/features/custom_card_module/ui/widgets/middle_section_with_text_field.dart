import 'package:custom_card_module/sourav_modules/core/constants/assets.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/customize_button.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/text_field_with_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiddleSectionWithTextFIelds extends StatelessWidget {
  const MiddleSectionWithTextFIelds({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CustomizeButton(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 58.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(AssetsConstants.userDP),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Developer',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.80,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.edit_rounded, color: Colors.white, size: 18),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bangalore, India',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.edit_rounded, color: Colors.white, size: 18),
                ],
              ),
              const SizedBox(height: 20),
              const TextFieldWithSwitch(
                  label: 'Phone number', hintText: 'Enter Phone Number'),
              const TextFieldWithSwitch(
                  label: 'Email', hintText: 'Enter Email id'),
              const TextFieldWithSwitch(
                  label: 'Address', hintText: 'Enter address'),
              const TextFieldWithSwitch(
                  label: 'Website URL', hintText: 'Enter website URL'),
              const TextFieldWithSwitch(
                  label: 'Social media links',
                  hintText: 'Enter social media links'),
            ],
          ),
        ],
      ),
    );
  }
}
