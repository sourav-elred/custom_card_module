import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/choose_picture_widget.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_card.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class CustomizedCardBody extends StatefulWidget {
  const CustomizedCardBody({super.key});

  @override
  State<CustomizedCardBody> createState() => _CustomizedCardBodyState();
}

class _CustomizedCardBodyState extends State<CustomizedCardBody> {
  late final ScreenshotController screenshotController;

  @override
  void initState() {
    screenshotController = ScreenshotController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.1,
      child: Column(
        children: [
          const ChoosePictureWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: CustomCard(
              screenshotController: screenshotController,
              disableGesture: false,
            ),
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
              padding: const EdgeInsets.all(14.0),
              child: CustomRedButton(
                labelText: 'Save',
                onTap: () {
                  screenshotController.capture().then((image) {
                    context.read<CustomCardVM>().changeImage(image,
                        onSuccess: () {
                      Navigator.of(context).pop();
                    });
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
