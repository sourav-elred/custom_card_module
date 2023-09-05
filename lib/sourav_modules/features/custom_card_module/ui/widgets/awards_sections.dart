import 'package:flutter/material.dart';

class AwardsSection extends StatelessWidget {
  const AwardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.dashboard_customize, color: Colors.black),
        ),
        SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.ramen_dining, color: Colors.black),
        ),
        SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.macro_off, color: Colors.black),
        ),
        SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            '+3',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
