import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../data/events.dart";
import "../../../services/analytics_service.dart";
import "../../../services/share_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "../../../widgets/sections/section_wrapper.dart";

/// Made visually dominant per the redesign brief — this is "here's
/// something we're actually doing," not a philosophy slide. Plain lines
/// instead of pill chips; one CTA.
class Chapter0TeaserSection extends StatelessWidget {
  const Chapter0TeaserSection({super.key});

  @override
  Widget build(BuildContext context) {
    final event = chapter0Event;
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SectionWrapper(
      background: SectionBackground.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("CHAPTER 0", style: AppTextStyles.eyebrow(color: AppColors.gold)),
          const SizedBox(height: 18),
          Text(
            "One living room.\n20 strangers.\nQuestionable\nalliances.",
            style: AppTextStyles.display(color: AppColors.cream, size: isMobile ? 34 : 54).copyWith(height: 1.06),
          ),
          const SizedBox(height: 22),
          Text(
            "Late-Night Mafia",
            style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.7), size: 17, weight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(
            "FRI 14 AUG · 8 PM · HSR",
            style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 15, weight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            "${event.price} · ${event.capacityLabel.toUpperCase()}",
            style: AppTextStyles.display(color: AppColors.gold, size: 24),
          ),
          const SizedBox(height: 28),
          AppButton(
            label: "Get a spot →",
            variant: AppButtonVariant.gold,
            large: true,
            onPressed: () {
              AnalyticsService.track("luma_clicked", {"from": "home_teaser"});
              ShareService.openUrl(event.lumaUrl);
            },
          ),
          const SizedBox(height: 36),
          for (final a in event.activities)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(a, style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.75), size: 15)),
            ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => context.goNamed("chapter0"),
            child: Text(
              "Entry by approval. Full details →",
              style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.55), size: 13, weight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
