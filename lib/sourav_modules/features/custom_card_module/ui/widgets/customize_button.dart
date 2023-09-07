import 'package:custom_card_module/sourav_modules/core/constants/colors.dart';
import 'package:custom_card_module/sourav_modules/core/constants/routes.dart';
import 'package:flutter/material.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 18,
      right: 15,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.customizeCardScreen);
        },
        child: Container(
          width: 100,
          height: 26,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.9),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          child: Row(
            children: const [
              SizedBox(width: 2),
              Icon(Icons.edit, color: ColorConstants.elRed, size: 18),
              SizedBox(width: 4),
              Text(
                'Customize',
                style: TextStyle(
                  color: ColorConstants.elRed,
                  fontSize: 14,
                  fontFamily: 'AvenirNextLTPro',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
