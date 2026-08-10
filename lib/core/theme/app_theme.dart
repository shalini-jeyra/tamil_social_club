import "package:flutter/material.dart";
import "app_colors.dart";
import "app_text_styles.dart";

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.creamSoft,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.teal900,
        primary: AppColors.teal900,
        secondary: AppColors.gold,
        surface: AppColors.creamSoft,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.display(),
        bodyLarge: AppTextStyles.body(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        ),
      ),
      dividerColor: AppColors.charcoal.withOpacity(0.08),
    );
  }
}
