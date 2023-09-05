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
              CircularProgressIndicator(color: Color(0xffE72D38)),
              Text('Saving...', style: TextStyle(color: Color(0xffE72D38)))
            ],
          ),
        ),
      ),
    );
  }
}
