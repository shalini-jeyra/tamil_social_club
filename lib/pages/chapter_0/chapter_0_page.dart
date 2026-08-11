import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../../data/events.dart";
import "../../services/analytics_service.dart";
import "../../services/share_service.dart";
import "../../widgets/buttons/app_button.dart";
import "../../widgets/navigation/app_drawer.dart";
import "../../widgets/navigation/app_footer.dart";
import "../../widgets/navigation/app_header.dart";

/// Route: "/chapter-0" — rewritten to feel cinematic rather than
/// document-like: no pill rows, one CTA, the private-address explanation
/// lives here (not on the homepage teaser).
class Chapter0Page extends StatefulWidget {
  const Chapter0Page({super.key});

  @override
  State<Chapter0Page> createState() => _Chapter0PageState();
}

class _Chapter0PageState extends State<Chapter0Page> {
  @override
  void initState() {
    super.initState();
    AnalyticsService.track("chapter_0_viewed");
  }

  @override
  Widget build(BuildContext context) {
    final event = chapter0Event;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      appBar: const AppHeader(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.teal900,
              padding: EdgeInsets.fromLTRB(20, isMobile ? 88 : 110, 20, isMobile ? 60 : 84),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 780),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CHAPTER 0", style: AppTextStyles.eyebrow(color: AppColors.gold)),
                      const SizedBox(height: 16),
                      Text(
                        "One living room.\n20 strangers.\nQuestionable\nalliances.",
                        style: AppTextStyles.display(color: AppColors.cream, size: isMobile ? 36 : 58).copyWith(height: 1.05),
                      ),
                      const SizedBox(height: 26),
                      Text(
                        "${event.dateLabel.split(",").last.trim()} \u00b7 ${event.timeLabel}",
                        style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 16, weight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event.location.toUpperCase(),
                        style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.6), size: 14, weight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 780),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, isMobile ? 56 : 84, 20, isMobile ? 56 : 84),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("THE PLAN", style: AppTextStyles.eyebrow()),
                      const SizedBox(height: 26),
                      const _PlanLine(emoji: "\ud83c\udfb2", title: "Late-Night Mafia", body: "Tamil / Tanglish. Bluffs. Accusations. Chaos."),
                      const _PlanLine(emoji: "\ud83c\udfac", title: "Cinema & pop culture", body: "Tamil movie arguments nobody asked for."),
                      const _PlanLine(emoji: "\ud83c\udf7f", title: "Snacks & drinks", body: "Enough to keep the alliances alive."),
                      const _PlanLine(emoji: "\ud83e\udd1d", title: "Actually meeting people", body: "Because that's the whole point.", last: true),
                      const SizedBox(height: 48),
                      Container(width: 48, height: 3, color: AppColors.gold),
                      const SizedBox(height: 32),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "${event.price} \u00b7 ${event.capacityLabel}\n", style: AppTextStyles.display(size: isMobile ? 24 : 30)),
                          TextSpan(text: "Entry by approval.\n\n", style: AppTextStyles.body(size: 16, weight: FontWeight.w600, color: AppColors.charcoal.withOpacity(0.8))),
                          TextSpan(
                            text: "Since this is hosted at a private residential space, the exact address is shared only with approved attendees after payment.",
                            style: AppTextStyles.body(size: 15, color: AppColors.charcoal.withOpacity(0.65)),
                          ),
                        ]),
                      ),
                      const SizedBox(height: 40),
                      Text("WANT IN?", style: AppTextStyles.eyebrow()),
                      const SizedBox(height: 16),
                      AppButton(
                        label: "Apply for a spot \u2192",
                        variant: AppButtonVariant.gold,
                        large: true,
                        onPressed: () {
                          AnalyticsService.track("luma_clicked");
                          ShareService.openUrl(event.lumaUrl);
                        },
                      ),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () => context.goNamed("tamilTwin"),
                        child: Text(
                          "Not sure you're in? Find your Tamil Twin first \u2192",
                          style: AppTextStyles.body(color: AppColors.teal800, size: 14, weight: FontWeight.w600),
                        ),
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
}

class _PlanLine extends StatelessWidget {
  final String emoji;
  final String title;
  final String body;
  final bool last;
  const _PlanLine({required this.emoji, required this.title, required this.body, this.last = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: last ? 0 : 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.display(size: 18)),
                const SizedBox(height: 4),
                Text(body, style: AppTextStyles.body(size: 15, color: AppColors.charcoal.withOpacity(0.65))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
