import "package:flutter/material.dart";
import "../../../core/constants/links.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../services/share_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "../../../widgets/sections/section_wrapper.dart";

class InstagramSection extends StatelessWidget {
  const InstagramSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      background: SectionBackground.cream,
      child: Column(
        children: [
          Text("FOLLOW THE CLUB", style: AppTextStyles.eyebrow()),
          const SizedBox(height: 8),
          Text("@tamilsocialclub", style: AppTextStyles.display(size: 30)),
          const SizedBox(height: 18),
          AppButton(
            label: "Follow on Instagram →",
            variant: AppButtonVariant.teal,
            onPressed: () {
              AnalyticsService.track("instagram_clicked", {"from": "instagram_section"});
              ShareService.openUrl(AppLinks.instagram);
            },
          ),
        ],
      ),
    );
  }
}
