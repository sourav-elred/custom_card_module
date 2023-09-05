import 'package:custom_card_module/sourav_modules/core/ui/widgets/custom_red_button.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/choose_picture_widget.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_card.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/view_models/custom_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomizedCardBody extends StatelessWidget {
  const CustomizedCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.1,
      child: Column(
        children: [
          const ChoosePictureWidget(),
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
                onTap: () {
                  context.read<CustomCardVM>().postImage(onSuccess: () {
                    Navigator.of(context).pop();
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
