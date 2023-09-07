import 'package:flutter/material.dart';

class RoundedCTAWidget extends StatelessWidget {
  const RoundedCTAWidget({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
