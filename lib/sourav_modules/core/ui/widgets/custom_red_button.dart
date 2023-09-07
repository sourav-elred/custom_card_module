import 'package:custom_card_module/sourav_modules/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomRedButton extends StatelessWidget {
  const CustomRedButton({
    super.key,
    this.onTap,
    this.invert = false,
    required this.labelText,
  });

  final String labelText;
  final bool invert;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                color: onTap == null
                    ? ColorConstants.elRedDisabled
                    : invert
                        ? Colors.white
                        : ColorConstants.elRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(42),
                    side: const BorderSide(color: ColorConstants.elRed)),
              ),
            ),
            Center(
              child: Text(
                labelText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: invert ? ColorConstants.elRed : Colors.white,
                  fontSize: 20,
                  fontFamily: 'AvenirNextLTPro',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
