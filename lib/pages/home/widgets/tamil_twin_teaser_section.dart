import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../services/analytics_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "../../../widgets/cards/id_card_preview.dart";
import "../../../widgets/cards/stat_chip.dart";
import "../../../widgets/sections/section_wrapper.dart";

class TamilTwinTeaserSection extends StatelessWidget {
  const TamilTwinTeaserSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("THE GAME", style: AppTextStyles.eyebrow()),
        const SizedBox(height: 8),
        Text("Okay, but what's YOUR Tamil Twin?", style: AppTextStyles.display(size: isMobile ? 28 : 38)),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Text(
            "A completely unscientific test to discover what kind of Tamil person you are in Bengaluru.",
            style: AppTextStyles.body(size: 18, color: AppColors.charcoal.withOpacity(0.78)),
          ),
        ),
        const SizedBox(height: 20),
        const Wrap(spacing: 10, runSpacing: 10, children: [
          StatChip(value: "8", label: "questions"),
          StatChip(value: "2", label: "minutes"),
          StatChip(value: "0%", label: "scientific accuracy"),
        ]),
        const SizedBox(height: 22),
        AppButton(
          label: "Find my Twin →",
          variant: AppButtonVariant.teal,
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
              const SizedBox(height: 32),
              const Center(child: IdCardPreview()),
            ])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 6, child: copy),
                const SizedBox(width: 36),
                const Expanded(flex: 4, child: Center(child: IdCardPreview())),
              ],
            ),
    );
  }
}
