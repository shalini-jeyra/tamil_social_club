import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

/// "We should meet sometime." — kept from the previous draft, since the
/// copy already worked. Made more dramatic: bigger type, more whitespace,
/// no card, no border, no icon. Typography carries the section alone.
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
        vertical: isMobile ? 90 : 140,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\u201Cமச்சான், நாம சீக்கிரம்\nமீட் பண்ணனும்.\u201D",
                style: AppTextStyles.display(
                  size: isMobile ? 38 : 60,
                  color: AppColors.charcoal,
                ).copyWith(height: 1.1, letterSpacing: -0.5),
              ),
              const SizedBox(height: 40),
              Container(width: 48, height: 3, color: AppColors.gold),
              const SizedBox(height: 40),
              Text(
                "We've all said it.",
                style: AppTextStyles.body(size: isMobile ? 18 : 22, color: AppColors.charcoal.withOpacity(0.85)),
              ),
              const SizedBox(height: 10),
              Text(
                "Somehow, \u201Csometime\u201D never becomes a plan.",
                style: AppTextStyles.body(size: isMobile ? 18 : 22, color: AppColors.charcoal.withOpacity(0.55)),
              ),
              const SizedBox(height: 56),
              Text(
                "So we're making\nthe plan.",
                style: AppTextStyles.display(size: isMobile ? 30 : 46, color: AppColors.teal800).copyWith(height: 1.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
