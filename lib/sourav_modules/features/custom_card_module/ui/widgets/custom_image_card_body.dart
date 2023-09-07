import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/botton_section_widget.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_app_bar.dart';
import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CustomImageCardBody extends StatelessWidget {
  const CustomImageCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildCustomAppBar(
        context,
        label: 'Custom Image Card',
        elevation: 3,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 10),
          CustomCard(),
          Spacer(),
          BottomSection(),
        ],
      ),
    );
  }
}
