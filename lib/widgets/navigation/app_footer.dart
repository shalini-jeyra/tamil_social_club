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
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text("Tamil Social Club", style: AppTextStyles.display(color: AppColors.offWhite, size: 15, weight: FontWeight.w600)),
                ],
              ),
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
          const SizedBox(height: 16),
          Text(
            "Independent Tamil community in Bengaluru. Not affiliated with any political or religious organisation.",
            style: AppTextStyles.body(color: AppColors.offWhite.withOpacity(0.5), size: 12),
          ),
        ],
      ),
    );
  }
}
