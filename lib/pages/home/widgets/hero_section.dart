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
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.6, -0.4),
          radius: 1.4,
          colors: [
            Color(0xFF1A5550), // slightly lighter teal at the glow point
            AppColors.teal900,
            Color(0xFF081F1D), // deeper at the edges
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Decorative large background text — very subtle watermark
          Positioned(
            right: isMobile ? -20 : 0,
            bottom: 0,
            child: Text(
              "TSC",
              style: TextStyle(
                fontSize: isMobile ? 180 : 280,
                fontWeight: FontWeight.w900,
                color: AppColors.cream.withOpacity(0.025),
                height: 1,
                letterSpacing: -8,
              ),
            ),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.fromLTRB(isMobile ? 20 : 40, isMobile ? 80 : 100, isMobile ? 20 : 40, 72),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 980),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gold accent bar
                    Container(
                      width: 40,
                      height: 3,
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Your people are\nsomewhere in Bengaluru.",
                      style: AppTextStyles.display(
                        color: AppColors.cream,
                        size: isMobile ? 36 : 62,
                      ).copyWith(height: 1.06, letterSpacing: -0.5),
                    ),
                    const SizedBox(height: 22),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 460),
                      child: Text(
                        "Tamil Social Club is an independent community bringing Tamil people "
                        "across Bengaluru together for games, conversations, food and genuinely "
                        "good weekends.",
                        style: AppTextStyles.body(
                          color: AppColors.cream.withOpacity(0.75),
                          size: 17,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
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
                          label: "See what's happening →",
                          variant: AppButtonVariant.ghostLight,
                          onPressed: () => context.goNamed("experiences"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
