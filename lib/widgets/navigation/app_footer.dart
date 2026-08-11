import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../core/constants/links.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../../services/analytics_service.dart";
import "../../services/share_service.dart";

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      padding: const EdgeInsets.fromLTRB(20, 44, 20, 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset("assets/images/logo.png", height: 40, width: 40, fit: BoxFit.cover),
              ),
              const SizedBox(width: 10),
              Text("Tamil Social Club", style: AppTextStyles.display(color: AppColors.offWhite, size: 16, weight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "A social club for Tamil people in Bengaluru.",
            style: AppTextStyles.body(color: AppColors.offWhite.withOpacity(0.6), size: 14),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 12,
            children: [
              TextButton(
                onPressed: () => context.goNamed("tamilTwin"),
                child: Text("Tamil Twin", style: AppTextStyles.body(color: AppColors.offWhite, size: 14)),
              ),
              TextButton(
                onPressed: () => context.goNamed("chapter0"),
                child: Text("Chapter 0", style: AppTextStyles.body(color: AppColors.offWhite, size: 14)),
              ),
              TextButton(
                onPressed: () {
                  AnalyticsService.track("instagram_clicked", {"from": "footer"});
                  ShareService.openUrl(AppLinks.instagram);
                },
                child: Text("Instagram", style: AppTextStyles.body(color: AppColors.offWhite, size: 14)),
              ),
              TextButton(
                onPressed: () {
                  AnalyticsService.track("whatsapp_clicked", {"from": "footer"});
                  ShareService.openUrl(AppLinks.whatsapp);
                },
                child: Text("WhatsApp", style: AppTextStyles.body(color: AppColors.offWhite, size: 14)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Bengaluru \u00b7 2026",
            style: AppTextStyles.body(color: AppColors.offWhite.withOpacity(0.4), size: 12),
          ),
        ],
      ),
    );
  }
}
