import "package:flutter/material.dart";
import "../../../core/constants/links.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../services/share_service.dart";
import "../../../widgets/buttons/app_button.dart";

class CommunitySection extends StatelessWidget {
  const CommunitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 72 : 112,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Come for the event.\nStay for the people.",
                textAlign: TextAlign.center,
                style: AppTextStyles.display(
                  size: isMobile ? 32 : 46,
                  color: AppColors.cream,
                ).copyWith(height: 1.1, letterSpacing: -0.5),
              ),
              const SizedBox(height: 24),
              Text(
                "We're building a community for Tamil professionals and creatives in Bengaluru to connect, collaborate, and unwind.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body(
                  size: isMobile ? 18 : 20,
                  color: AppColors.cream.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 44),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  AppButton(
                    label: "Join the WhatsApp community →",
                    variant: AppButtonVariant.gold,
                    large: isMobile ? false : true,
                    onPressed: () {
                      AnalyticsService.track("whatsapp_clicked", {"from": "community_section"});
                      ShareService.openUrl(AppLinks.whatsapp);
                    },
                  ),
                  AppButton(
                    label: "Follow @tamilsocialclub →",
                    variant: AppButtonVariant.ghostLight,
                    large: isMobile ? false : true,
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
