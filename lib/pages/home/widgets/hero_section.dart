import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../widgets/buttons/app_button.dart";

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.teal900,
      padding: EdgeInsets.fromLTRB(20, isMobile ? 80 : 100, 20, 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "YOUR PEOPLE ARE\nSOMEWHERE IN BENGALURU.",
                style: AppTextStyles.display(color: AppColors.cream, size: isMobile ? 38 : 62),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Text(
                  "Tamil Social Club is an independent community bringing Tamil people "
                  "across Bengaluru together for games, conversations, food and genuinely "
                  "good weekends.",
                  style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.82), size: 17),
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  AppButton(
                    label: "Find your Tamil Twin 🎲",
                    variant: AppButtonVariant.gold,
                    onPressed: () {
                      AnalyticsService.track("twin_game_started", {"from": "hero"});
                      context.goNamed("tamilTwin");
                    },
                  ),
                  AppButton(
                    label: "See Chapter 0 →",
                    variant: AppButtonVariant.ghostLight,
                    onPressed: () => context.goNamed("chapter0"),
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
