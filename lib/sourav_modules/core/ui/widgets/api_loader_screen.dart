import 'package:custom_card_module/sourav_modules/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ApiLoaderScreen extends StatelessWidget {
  final Color? bgColor;
  const ApiLoaderScreen({Key? key, this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: bgColor ?? Colors.black.withOpacity(0.4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(color: ColorConstants.elRed),
              Text('Saving...', style: TextStyle(color: ColorConstants.elRed))
            ],
          ),
        ),
      ),
    );
  }
}
