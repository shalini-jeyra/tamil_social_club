import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "hero_painter.dart";

/// PRD redesign — hero stays a headline and one dominant CTA.
/// No paragraph, no "professionals and creatives", no third button.
/// A quiet skyline + string-lights motif replaces the old giant
/// "TSC" watermark (see hero_painter.dart).
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.teal900,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/hero_bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Dark Gradient Overlay for text legibility
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.85),
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              isMobile ? 20 : 80,
              isMobile ? 120 : 160,
              isMobile ? 20 : 40,
              isMobile ? 100 : 140,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Dear Bengaluru,",
                    style: AppTextStyles.handwriting(color: AppColors.cream.withOpacity(0.8), size: 32),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.display(
                        color: AppColors.cream,
                        size: isMobile ? 54 : 96,
                      ).copyWith(height: 1.0, letterSpacing: -1, textBaseline: TextBaseline.alphabetic),
                      children: const [
                        TextSpan(text: "YOUR PEOPLE\nARE SOMEWHERE IN\n"),
                        TextSpan(text: "BENGALURU.", style: TextStyle(color: AppColors.gold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Text(
                      "Tamil Social Club is a community for Tamil people in Bengaluru to meet, hang out and find something fun to do together.",
                      style: AppTextStyles.body(
                        color: AppColors.cream.withOpacity(0.85),
                        size: isMobile ? 18 : 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      AppButton(
                        label: "Find your Tamil Twin →",
                        variant: AppButtonVariant.gold,
                        large: true,
                        onPressed: () {
                          AnalyticsService.track("twin_game_started", {"from": "hero"});
                          context.goNamed("tamilTwin");
                        },
                      ),
                      AppButton(
                        label: "See what's happening ↓",
                        variant: AppButtonVariant.ghostLight,
                        large: true,
                        onPressed: () => context.goNamed("experiences"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      // Avatar placeholder group
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: Stack(
                          children: List.generate(4, (index) {
                            return Positioned(
                              left: index * 24.0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.charcoal,
                                  border: Border.all(color: Colors.black, width: 2),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/logo.png"), // Using logo as placeholder avatar for now
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "A growing community of\nTamil people in Bengaluru.",
                        style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.6), size: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
