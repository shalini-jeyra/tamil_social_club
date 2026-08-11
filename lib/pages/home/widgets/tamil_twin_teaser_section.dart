import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "../../../widgets/cards/personality_card_preview.dart";
import "../../../widgets/sections/section_wrapper.dart";

/// Moved to sit right after the hero — this is the site's interactive
/// hook and shouldn't be buried near the bottom.
class TamilTwinTeaserSection extends StatelessWidget {
  const TamilTwinTeaserSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("BEFORE YOU MEET THE CLUB...", style: AppTextStyles.eyebrow()),
        const SizedBox(height: 10),
        Text("Who's your\nTamil Twin?", style: AppTextStyles.display(size: isMobile ? 34 : 46)),
        const SizedBox(height: 16),
        Text(
          "8 questions.\nZero scientific accuracy.\nPotentially concerning results.",
          style: AppTextStyles.body(size: 17, color: AppColors.charcoal.withOpacity(0.75)),
        ),
        const SizedBox(height: 26),
        AppButton(
          label: "Find out →",
          variant: AppButtonVariant.teal,
          large: true,
          onPressed: () {
            AnalyticsService.track("twin_game_started", {"from": "home_teaser"});
            context.goNamed("tamilTwin");
          },
        ),
      ],
    );

    return SectionWrapper(
      background: SectionBackground.cream,
      child: isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              copy,
              const SizedBox(height: 40),
              const Center(child: PersonalityCardPreview()),
            ])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 6, child: copy),
                const SizedBox(width: 40),
                const Expanded(flex: 4, child: Center(child: PersonalityCardPreview())),
              ],
            ),
    );
  }
}
