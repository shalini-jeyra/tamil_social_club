import "package:flutter/material.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";

enum AppButtonVariant { gold, teal, ghostLight, ghostDark }

/// A single pill button used across the site (gold / teal / ghost variants)
/// so every CTA shares the same shape, sizing and hover behaviour.
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool large;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.gold,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color fg;
    Color? borderColor;

    switch (variant) {
      case AppButtonVariant.gold:
        bg = AppColors.gold;
        fg = AppColors.charcoal;
        break;
      case AppButtonVariant.teal:
        bg = AppColors.teal900;
        fg = AppColors.cream;
        break;
      case AppButtonVariant.ghostLight:
        bg = Colors.transparent;
        fg = AppColors.cream;
        borderColor = AppColors.cream.withOpacity(0.5);
        break;
      case AppButtonVariant.ghostDark:
        bg = Colors.transparent;
        fg = AppColors.teal900;
        borderColor = AppColors.teal900;
        break;
    }

    return Material(
      color: bg,
      shape: StadiumBorder(
        side: borderColor != null ? BorderSide(color: borderColor, width: 1.5) : BorderSide.none,
      ),
      child: InkWell(
        onTap: onPressed,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: large ? 30 : 22, vertical: large ? 18 : 15),
          child: Text(label, style: AppTextStyles.button(color: fg).copyWith(fontSize: large ? 16 : 15)),
        ),
      ),
    );
  }
}
