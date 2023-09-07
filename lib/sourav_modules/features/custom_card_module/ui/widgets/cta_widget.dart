import 'package:custom_card_module/sourav_modules/features/custom_card_module/ui/widgets/rounded_cta_widget.dart';
import 'package:flutter/material.dart';

class CTAWidgets extends StatelessWidget {
  const CTAWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Center(
            child: Text(
              'S',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'AvenirNextLTPro',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const RoundedCTAWidget(icon: Icons.mail),
        const SizedBox(width: 8),
        const RoundedCTAWidget(icon: Icons.phone),
        const SizedBox(width: 8),
        const RoundedCTAWidget(icon: Icons.location_on),
        const SizedBox(width: 8),
        const RoundedCTAWidget(icon: Icons.web_asset_rounded),
      ],
    );
  }
}
