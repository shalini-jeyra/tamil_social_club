import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "../../../widgets/sections/section_wrapper.dart";

class Chapter0TeaserSection extends StatelessWidget {
  const Chapter0TeaserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      background: SectionBackground.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("THE EVENT", style: AppTextStyles.eyebrow(color: AppColors.gold)),
          const SizedBox(height: 8),
          Text("CHAPTER 0", style: AppTextStyles.display(color: AppColors.cream, size: 34)),
          const SizedBox(height: 14),
          Text(
            "One Friday night. 15–20 strangers. Let's see what happens.",
            style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 18),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 14,
            runSpacing: 10,
            children: [
              _detail("📅 Fri, 14 Aug 2026"),
              _detail("🕗 8 PM – 12 AM"),
              _detail("📍 HSR Layout"),
              _detail("₹199"),
            ],
          ),
          const SizedBox(height: 24),
          AppButton(
            label: "See Chapter 0 →",
            variant: AppButtonVariant.gold,
            onPressed: () {
              AnalyticsService.track("chapter_0_viewed", {"from": "home_teaser"});
              context.goNamed("chapter0");
            },
          ),
        ],
      ),
    );
  }

  Widget _detail(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: AppColors.cream.withOpacity(0.08), borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: AppTextStyles.body(color: AppColors.cream, size: 14, weight: FontWeight.w600)),
    );
  }
}
