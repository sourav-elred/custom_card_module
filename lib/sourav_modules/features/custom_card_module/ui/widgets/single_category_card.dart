import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleCategoryCard extends StatelessWidget {
  const SingleCategoryCard(
      {super.key, required this.imageUrl, required this.label});
  final String imageUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  height: 110,
                  width: 300,
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 110,
                  width: 300,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(.4)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  bottom: 10,
                  child: Text(
                    label,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Stack(
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 0.50, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
