import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildCustomAppBar(BuildContext context,
    {required String label, double? elevation}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: elevation ?? 0,
    centerTitle: false,
    title: Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (Navigator.canPop(context)) ...[
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.close, color: Colors.black),
          ),
        ]
      ],
    ),
  );
}
