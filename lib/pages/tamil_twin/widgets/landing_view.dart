import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../widgets/buttons/app_button.dart";

class LandingView extends StatelessWidget {
  final VoidCallback onStart;
  const LandingView({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("landing"),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("TAMIL SOCIAL CLUB", style: AppTextStyles.eyebrow(color: AppColors.gold)),
        const SizedBox(height: 20),
        Text(
          "Who's your\nTamil Twin? \ud83d\udc40",
          textAlign: TextAlign.center,
          style: AppTextStyles.display(color: AppColors.cream, size: 40),
        ),
        const SizedBox(height: 24),
        Text(
          "8 questions.\n2 minutes.\n0% scientific accuracy.",
          textAlign: TextAlign.center,
          style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 17),
        ),
        const SizedBox(height: 32),
        AppButton(label: "Let's find out \u2192", variant: AppButtonVariant.gold, large: true, onPressed: onStart),
        const SizedBox(height: 18),
        Text(
          "No data. No login. Just vibes.",
          style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.5), size: 13),
        ),
      ],
    );
  }
}
