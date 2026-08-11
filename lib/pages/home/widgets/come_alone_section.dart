import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

/// New — the emotional core of the brand. Dark/cream contrast, no card,
/// no icon. Replaces the never-wired-in AboutSection on the homepage.
class ComeAloneSection extends StatelessWidget {
  const ComeAloneSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: isMobile ? 90 : 140),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Come alone.",
                style: AppTextStyles.display(color: AppColors.cream, size: isMobile ? 40 : 64).copyWith(letterSpacing: -1),
              ),
              const SizedBox(height: 14),
              Text(
                "Seriously.",
                style: AppTextStyles.body(color: AppColors.gold, size: isMobile ? 18 : 22, weight: FontWeight.w600),
              ),
              const SizedBox(height: 36),
              Text(
                "You don't need to bring a group of friends.\nYou don't need to know anyone before you arrive.",
                style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.75), size: isMobile ? 17 : 19),
              ),
              const SizedBox(height: 44),
              Text(
                "Come for the plan.\nStay for the people.",
                style: AppTextStyles.display(color: AppColors.cream, size: isMobile ? 26 : 36).copyWith(height: 1.15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
