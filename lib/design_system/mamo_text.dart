import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MamoText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const MamoText(
    this.text, {
    super.key,
    this.color = Colors.black,
    this.fontSize = 14,
  });

  factory MamoText.title(String text) => MamoText(text, fontSize: 24);

  factory MamoText.button(String text) => MamoText(
        text,
        fontSize: 14,
        color: Colors.white,
      );
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ptSans(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
