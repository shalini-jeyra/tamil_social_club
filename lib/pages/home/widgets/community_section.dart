import "package:flutter/material.dart";
import "../../../core/constants/links.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../services/share_service.dart";
import "../../../widgets/buttons/app_button.dart";

/// "Come alone" already carried the emotional sentiment — this section
/// stays deliberately short and just closes the loop: are you coming?
class CommunitySection extends StatelessWidget {
  const CommunitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.cream,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: isMobile ? 80 : 120),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "So...\nare you coming?",
                textAlign: TextAlign.center,
                style: AppTextStyles.display(size: isMobile ? 32 : 48).copyWith(height: 1.08, letterSpacing: -0.5),
              ),
              const SizedBox(height: 18),
              Text(
                "New plans, new people, occasional chaos.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body(size: isMobile ? 17 : 19, color: AppColors.charcoal.withOpacity(0.75)),
              ),
              const SizedBox(height: 36),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                alignment: WrapAlignment.center,
                children: [
                  AppButton(
                    label: "Join the WhatsApp",
                    variant: AppButtonVariant.teal,
                    large: true,
                    onPressed: () {
                      AnalyticsService.track("whatsapp_clicked", {"from": "community_section"});
                      ShareService.openUrl(AppLinks.whatsapp);
                    },
                  ),
                  AppButton(
                    label: "Follow Instagram",
                    variant: AppButtonVariant.ghostDark,
                    large: true,
                    onPressed: () {
                      AnalyticsService.track("instagram_clicked", {"from": "community_section"});
                      ShareService.openUrl(AppLinks.instagram);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
