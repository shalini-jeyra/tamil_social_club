import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../core/constants/links.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../../data/events.dart";
import "../../services/analytics_service.dart";
import "../../services/share_service.dart";
import "../../widgets/buttons/app_button.dart";
import "../../widgets/navigation/app_drawer.dart";
import "../../widgets/navigation/app_footer.dart";
import "../../widgets/navigation/app_header.dart";

/// Route: "/experiences" — simple listing of all experiences.
/// Chapter 0 is the only active one in V1. Others show as Coming Soon.
class ExperiencesPage extends StatelessWidget {
  const ExperiencesPage({super.key});

  static const _comingSoon = [
    _ComingSoonPillar("🎤", "Music Night", "Belting out SPB hits, kuthu beats, and acoustic jamming."),
    _ComingSoonPillar("🪩", "Social Mixer", "House parties, mixers, and yapping in Tanglish till 3 AM."),
    _ComingSoonPillar("🍜", "Food Crawl", "Filter kaapi, proper biryani, and finding the best spots."),
    _ComingSoonPillar("🏕️", "Weekend Escape", "Touching grass. Weekend trips and escaping Silk Board traffic."),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final event = chapter0Event;

    return Scaffold(
      appBar: const AppHeader(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Page header
            Container(
              width: double.infinity,
              color: AppColors.teal900,
              padding: EdgeInsets.fromLTRB(20, isMobile ? 56 : 72, 20, 48),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 780),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("EXPERIENCES",
                          style: AppTextStyles.eyebrow(color: AppColors.gold)),
                      const SizedBox(height: 12),
                      Text(
                        "What's happening.",
                        style: AppTextStyles.display(
                            color: AppColors.cream, size: isMobile ? 32 : 48),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Small gatherings. New people. Shared culture.",
                        style: AppTextStyles.body(
                            color: AppColors.cream.withOpacity(0.75), size: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Chapter 0 — Active event
            Container(
              width: double.infinity,
              color: AppColors.cream,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 48 : 72,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 780),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("HAPPENING NOW", style: AppTextStyles.eyebrow()),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: AppColors.teal900,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: isMobile
                            ? _chapter0Mobile(context, event, isMobile)
                            : _chapter0Desktop(context, event, isMobile),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Coming soon grid
            Container(
              width: double.infinity,
              color: AppColors.creamSoft,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 48 : 72,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 780),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("COMING UP", style: AppTextStyles.eyebrow()),
                      const SizedBox(height: 8),
                      Text(
                        "More experiences on the way.",
                        style: AppTextStyles.display(size: isMobile ? 22 : 30),
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: _comingSoon
                            .map((p) => _comingSoonCard(p, isMobile))
                            .toList(),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "Join the WhatsApp community to be the first to know when new experiences drop.",
                        style: AppTextStyles.body(
                          size: 15,
                          color: AppColors.charcoal.withOpacity(0.65),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppButton(
                        label: "Join WhatsApp community →",
                        variant: AppButtonVariant.teal,
                        onPressed: () {
                          AnalyticsService.track(
                              "whatsapp_clicked", {"from": "experiences_page"});
                          ShareService.openUrl(AppLinks.whatsapp);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _chapter0Desktop(BuildContext context, dynamic event, bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: _chapter0Info(context, event, isMobile)),
        const SizedBox(width: 32),
        Expanded(flex: 4, child: _chapter0Cta(context, event)),
      ],
    );
  }

  Widget _chapter0Mobile(BuildContext context, dynamic event, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _chapter0Info(context, event, isMobile),
        const SizedBox(height: 24),
        _chapter0Cta(context, event),
      ],
    );
  }

  Widget _chapter0Info(BuildContext context, dynamic event, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            "🎲 CHAPTER 0",
            style: AppTextStyles.eyebrow(color: AppColors.charcoal),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          "Late-Night Mafia",
          style: AppTextStyles.display(
              color: AppColors.cream, size: isMobile ? 24 : 30),
        ),
        const SizedBox(height: 16),
        _detailRow("📅", event.dateLabel),
        const SizedBox(height: 6),
        _detailRow("🕗", event.timeLabel),
        const SizedBox(height: 6),
        _detailRow("📍", event.location),
        const SizedBox(height: 18),
        Text(
          "15–20 people. One living room. Questionable alliances.",
          style: AppTextStyles.body(
              color: AppColors.cream.withOpacity(0.75), size: 15),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _ActivityChip("🎲 Mafia in Tamil/Tanglish"),
            _ActivityChip("🎬 Cinema + pop culture"),
            _ActivityChip("🍿 Snacks & drinks"),
            _ActivityChip("🤝 Real conversations"),
          ],
        ),
      ],
    );
  }

  Widget _chapter0Cta(BuildContext context, dynamic event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cream.withOpacity(0.06),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.cream.withOpacity(0.15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Entry by approval",
                  style: AppTextStyles.eyebrow(color: AppColors.gold)),
              const SizedBox(height: 8),
              Text(
                event.price,
                style: AppTextStyles.display(color: AppColors.gold, size: 36),
              ),
              const SizedBox(height: 4),
              Text(
                event.capacityLabel,
                style: AppTextStyles.body(
                    color: AppColors.cream.withOpacity(0.6), size: 13),
              ),
              const SizedBox(height: 18),
              AppButton(
                label: "Apply for a spot →",
                variant: AppButtonVariant.gold,
                large: true,
                onPressed: () {
                  AnalyticsService.track(
                      "luma_clicked", {"from": "experiences_page"});
                  ShareService.openUrl(event.lumaUrl);
                },
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.goNamed("chapter0"),
                child: Text(
                  "Full event details →",
                  style: AppTextStyles.body(
                    color: AppColors.cream.withOpacity(0.5),
                    size: 13,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _detailRow(String emoji, String text) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Text(text,
            style: AppTextStyles.body(
                color: AppColors.cream.withOpacity(0.75), size: 14)),
      ],
    );
  }

  Widget _comingSoonCard(_ComingSoonPillar p, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 340,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cream.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.charcoal.withOpacity(0.07)),
      ),
      child: Row(
        children: [
          Text(p.emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.name,
                    style: AppTextStyles.display(
                        size: 14, color: AppColors.charcoal.withOpacity(0.5))),
                const SizedBox(height: 2),
                Text(p.description,
                    style: AppTextStyles.body(
                        size: 13, color: AppColors.charcoal.withOpacity(0.35))),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.charcoal.withOpacity(0.06),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text("SOON",
                style: AppTextStyles.eyebrow(
                    color: AppColors.charcoal.withOpacity(0.3))),
          ),
        ],
      ),
    );
  }
}

class _ComingSoonPillar {
  final String emoji;
  final String name;
  final String description;
  const _ComingSoonPillar(this.emoji, this.name, this.description);
}

class _ActivityChip extends StatelessWidget {
  final String label;
  const _ActivityChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.cream.withOpacity(0.08),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.cream.withOpacity(0.15)),
      ),
      child: Text(label,
          style: AppTextStyles.body(
              color: AppColors.cream.withOpacity(0.75), size: 13)),
    );
  }
}
