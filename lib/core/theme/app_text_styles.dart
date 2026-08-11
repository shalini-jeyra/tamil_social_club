import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "app_colors.dart";

/// Space Grotesk for display/headings, Inter for body copy.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle display({
    Color color = AppColors.charcoal,
    double size = 40,
    FontWeight weight = FontWeight.w700,
  }) {
    return GoogleFonts.oswald(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.08,
    );
  }

  static TextStyle eyebrow({Color color = AppColors.teal800}) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 2.0,
      color: color,
    );
  }

  static TextStyle body({
    Color color = AppColors.charcoal,
    double size = 16,
    FontWeight weight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(fontSize: size, fontWeight: weight, color: color, height: 1.55);
  }

  static TextStyle button({Color color = AppColors.charcoal}) {
    return GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle handwriting({
    Color color = AppColors.gold,
    double size = 28,
  }) {
    return GoogleFonts.caveat(fontSize: size, color: color);
  }
}
