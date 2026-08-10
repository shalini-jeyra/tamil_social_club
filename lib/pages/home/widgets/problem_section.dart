import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

/// PRD §7 — "The Problem" section.
/// Makes the visitor feel understood before the pitch.
class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.offWhite,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 64 : 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '"We should meet sometime."',
                style: AppTextStyles.display(
                  size: isMobile ? 32 : 50,
                  color: AppColors.charcoal,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 2,
                color: AppColors.gold,
              ),
              const SizedBox(height: 32),
              Text(
                "We've all said it.",
                style: AppTextStyles.body(
                  size: isMobile ? 18 : 22,
                  color: AppColors.charcoal.withOpacity(0.85),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Somehow, \"sometime\" never becomes a plan.",
                style: AppTextStyles.body(
                  size: isMobile ? 18 : 22,
                  color: AppColors.charcoal.withOpacity(0.65),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "So we're making the plan.",
                style: AppTextStyles.display(
                  size: isMobile ? 22 : 30,
                  color: AppColors.teal800,
                  weight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
