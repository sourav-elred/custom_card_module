import 'dart:io';

import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadPictureScreen extends StatelessWidget {
  const UploadPictureScreen({super.key});

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
            GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              'Upload Picture',
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Consumer<CustomCardVM>(
                builder: (context, customCardVm, child) {
                  if (customCardVm.imagePath != null) {
                    return Image.file(
                      File(customCardVm.imagePath!),
                      fit: BoxFit.cover,
                    );
                  } else {
                    return const Text('No Image');
                  }
                },
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Picture ready to be saved',
              style: GoogleFonts.roboto(
                color: Colors.black.withOpacity(.7),
              ),
            ),
            const Spacer(),
            CustomRedButton(
              labelText: 'Save & Continue',
              onTap: () {
                Navigator.of(context).pushNamed('/custom-card-screen');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
