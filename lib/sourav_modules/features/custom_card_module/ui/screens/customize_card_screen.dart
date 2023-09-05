import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/botton_sheet_for_image_upload.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizeCardScreen extends StatelessWidget {
  const CustomizeCardScreen({super.key});

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
            Text(
              'Customize your card',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                color: const Color(0xFFE72D38).withOpacity(.2),
                child: const Icon(Icons.close, color: Color(0xFFE72D38)),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.1,
          child: Column(
            children: [
              Builder(builder: (context) {
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
                          'assets/icons/gallery-icon.svg',
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
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: const CustomCard(disableGesture: false),
              ),
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * .08,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: .1,
                      blurRadius: 1.0,
                      offset: Offset(1.0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CustomRedButton(
                    labelText: 'Save',
                    onTap: () {},
                  ),
                ),
              ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
