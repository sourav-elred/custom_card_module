import 'dart:io';

import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_app_bar.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/middle_section_with_text_field.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class CustomImageCardWithFields extends StatelessWidget {
  const CustomImageCardWithFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          buildCustomAppBar(context, label: 'Custom Image Card', elevation: 3),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Consumer<CustomCardVM>(
                          builder: (context, customCardVm, child) {
                            if (customCardVm.image != null) {
                              return Opacity(
                                opacity: .7,
                                child: PhotoView(
                                  disableGestures: true,
                                  imageProvider: FileImage(customCardVm.image!),
                                  initialScale: PhotoViewComputedScale.covered,
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        const MiddleSectionWithTextFIelds(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // const Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * .08,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomRedButton(
                  labelText: 'Save',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
