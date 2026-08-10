import "package:flutter/material.dart";
import "../../../core/constants/links.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../data/events.dart";
import "../../../services/analytics_service.dart";
import "../../../services/share_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "../../../widgets/sections/section_wrapper.dart";

/// PRD §10 — "WHAT'S HAPPENING" section.
/// Shows Chapter 0 listing with direct Luma CTA.
class Chapter0TeaserSection extends StatelessWidget {
  const Chapter0TeaserSection({super.key});

  @override
  Widget build(BuildContext context) {
    final event = chapter0Event;
    return SectionWrapper(
      background: SectionBackground.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("WHAT'S HAPPENING", style: AppTextStyles.eyebrow(color: AppColors.gold)),
          const SizedBox(height: 20),
          Text(
            "🎲 CHAPTER 0",
            style: AppTextStyles.display(color: AppColors.cream, size: 28),
          ),
          const SizedBox(height: 6),
          Text(
            "Late-Night Mafia",
            style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.6), size: 16, weight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 14,
            runSpacing: 10,
            children: [
              _detail("📅 ${event.dateLabel}"),
              _detail("🕗 ${event.timeLabel}"),
              _detail("📍 ${event.location}"),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "15–20 people. One living room. Questionable alliances.",
            style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 17),
          ),
          const SizedBox(height: 8),
          Text(
            event.price,
            style: AppTextStyles.display(color: AppColors.gold, size: 26),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              AppButton(
                label: "Apply for a spot →",
                variant: AppButtonVariant.gold,
                large: true,
                onPressed: () {
                  AnalyticsService.track("luma_clicked", {"from": "home_teaser"});
                  ShareService.openUrl(event.lumaUrl);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detail(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cream.withOpacity(0.08),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: AppTextStyles.body(color: AppColors.cream, size: 14, weight: FontWeight.w600)),
    );
  }
}
