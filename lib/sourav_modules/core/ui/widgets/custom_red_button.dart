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
                    ? const Color(0x4CE72D38)
                    : invert
                        ? Colors.white
                        : const Color(0xFFE72D38),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(42),
                    side: const BorderSide(color: Color(0xFFE72D38))),
              ),
            ),
            Center(
              child: Text(
                labelText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: invert ? const Color(0xFFE72D38) : Colors.white,
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
