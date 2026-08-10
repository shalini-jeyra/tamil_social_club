import "package:flutter/material.dart";
import "../../../core/constants/links.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../services/share_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "../../../widgets/sections/section_wrapper.dart";

class CommunitySection extends StatelessWidget {
  const CommunitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      background: SectionBackground.cream,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "COME FOR THE EVENT.\nSTAY FOR THE PEOPLE.",
            textAlign: TextAlign.center,
            style: AppTextStyles.display(size: 32),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Text(
              "We're building a community for Tamil people in Bengaluru who want more than another networking event.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body(size: 18, color: AppColors.charcoal.withOpacity(0.78)),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              AppButton(
                label: "Join the WhatsApp community →",
                variant: AppButtonVariant.teal,
                onPressed: () {
                  AnalyticsService.track("whatsapp_clicked", {"from": "community_section"});
                  ShareService.openUrl(AppLinks.whatsapp);
                },
              ),
              AppButton(
                label: "Follow @tamilsocialclub →",
                variant: AppButtonVariant.ghostDark,
                onPressed: () {
                  AnalyticsService.track("instagram_clicked", {"from": "community_section"});
                  ShareService.openUrl(AppLinks.instagram);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
