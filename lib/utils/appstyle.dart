import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyle({Color? color, double? fontSize, FontWeight? weight}) {
  return GoogleFonts.poppins(
    color: color ?? Colors.white,
    fontSize: fontSize ?? 18,
    fontWeight: weight ?? FontWeight.normal,
  );
}
