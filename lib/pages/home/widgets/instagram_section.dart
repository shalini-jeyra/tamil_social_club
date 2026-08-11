import "package:flutter/material.dart";
import "../../../core/constants/links.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../services/share_service.dart";

/// A thin strip right above the footer — Instagram already gets a slot
/// in the header, footer, CTAs and every share flow. It doesn't need a
/// full section of its own.
class InstagramStrip extends StatelessWidget {
  const InstagramStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AnalyticsService.track("instagram_clicked", {"from": "instagram_strip"});
        ShareService.openUrl(AppLinks.instagram);
      },
      child: Container(
        width: double.infinity,
        color: AppColors.creamSoft,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 980),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "More TSC → @tamilsocialclub",
                  style: AppTextStyles.body(size: 14, weight: FontWeight.w600, color: AppColors.charcoal.withOpacity(0.8)),
                ),
                Text(
                  "Follow →",
                  style: AppTextStyles.body(size: 14, weight: FontWeight.w700, color: AppColors.teal800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
