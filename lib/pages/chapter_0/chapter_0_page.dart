import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../../data/events.dart";
import "../../models/event.dart";
import "../../services/analytics_service.dart";
import "../../services/share_service.dart";
import "../../widgets/buttons/app_button.dart";
import "../../widgets/navigation/app_drawer.dart";
import "../../widgets/navigation/app_footer.dart";
import "../../widgets/navigation/app_header.dart";

/// Route: "/chapter-0" — event details + Luma hand-off.
/// Registration happens on Luma; this app stays payment-free (PRD section 14).
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
              padding: const EdgeInsets.fromLTRB(20, 90, 20, 50),
              child: Column(
                children: [
                  Text("CHAPTER 0", style: AppTextStyles.display(color: AppColors.cream, size: 40)),
                  const SizedBox(height: 12),
                  Text(
                    "One Friday night. 15–20 strangers. Let's see what happens.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 17),
                  ),
                ],
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 780),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 44, 20, 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.cream, borderRadius: BorderRadius.circular(16)),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            _pill("📅 ${event.dateLabel}"),
                            _pill("🕗 ${event.timeLabel}"),
                            _pill("📍 ${event.location}"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      isMobile
                          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_whatHappens(event), const SizedBox(height: 28), _details(event)])
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _whatHappens(event)),
                                const SizedBox(width: 32),
                                Expanded(child: _details(event)),
                              ],
                            ),
                      const SizedBox(height: 32),
                      AppButton(
                        label: "Apply for a spot →",
                        variant: AppButtonVariant.gold,
                        large: true,
                        onPressed: () {
                          AnalyticsService.track("luma_clicked");
                          ShareService.openUrl(event.lumaUrl);
                        },
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: ["Apply on Luma", "Approval", "₹199 payment", "Private address", "WhatsApp group"]
                            .map((s) => Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(color: AppColors.cream, borderRadius: BorderRadius.circular(999)),
                                  child: Text(s, style: AppTextStyles.body(size: 12, color: AppColors.charcoal.withOpacity(0.7))),
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () => context.goNamed("tamilTwin"),
                        child: Text(
                          "Not sure you're in? Find your Tamil Twin first →",
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

  Widget _pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: AppColors.creamSoft, borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: AppTextStyles.body(size: 13, weight: FontWeight.w600)),
    );
  }

  Widget _whatHappens(ClubEvent event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("WHAT HAPPENS", style: AppTextStyles.eyebrow()),
        const SizedBox(height: 10),
        for (final a in event.activities)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(a, style: AppTextStyles.body(size: 16)),
          ),
      ],
    );
  }

  Widget _details(ClubEvent event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("THE DETAILS", style: AppTextStyles.eyebrow()),
        const SizedBox(height: 10),
        Text.rich(TextSpan(children: [
          TextSpan(text: "Price: ", style: AppTextStyles.body(size: 16, weight: FontWeight.w700)),
          TextSpan(text: event.price, style: AppTextStyles.body(size: 16)),
        ])),
        const SizedBox(height: 6),
        Text.rich(TextSpan(children: [
          TextSpan(text: "Capacity: ", style: AppTextStyles.body(size: 16, weight: FontWeight.w700)),
          TextSpan(text: event.capacityLabel, style: AppTextStyles.body(size: 16)),
        ])),
        const SizedBox(height: 10),
        Text(
          "Approved guests get the private address and a spot in the attendee WhatsApp group.",
          style: AppTextStyles.body(size: 15, color: AppColors.charcoal.withOpacity(0.75)),
        ),
      ],
    );
  }
}
