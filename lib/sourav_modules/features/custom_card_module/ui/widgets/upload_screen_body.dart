import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/core/constants/routes.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_app_bar.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadPictureBody extends StatelessWidget {
  const UploadPictureBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar(context, label: 'Upload Picture'),
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
                  if (customCardVm.image != null) {
                    return Image.file(
                      customCardVm.image!,
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
                context.read<CustomCardVM>().postImage(onSuccess: () {
                  Navigator.of(context).pushNamed(Routes.customCardScreen);
                });
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
