import 'package:flutter/material.dart';

class BottomSectionForCard extends StatelessWidget {
  const BottomSectionForCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/elRed-logo.png',
            height: 50,
            width: 50,
          ),
          Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'AvenirNextLTPro',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
