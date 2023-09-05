import 'package:flutter/material.dart';

class TextFieldWithSwitch extends StatelessWidget {
  const TextFieldWithSwitch({
    super.key,
    required this.label,
    required this.hintText,
  });

  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'AvenirNextLTPro',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Display on card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontFamily: 'AvenirNextLTPro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: const Color(0XFFB4B4B4),
                    activeTrackColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFFB7B7B7),
                fontSize: 14,
                fontFamily: 'AvenirNextLTPro',
                fontWeight: FontWeight.w500,
              ),
              contentPadding: const EdgeInsets.only(left: 15),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              fillColor: const Color(0XFFFAFAFA),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
