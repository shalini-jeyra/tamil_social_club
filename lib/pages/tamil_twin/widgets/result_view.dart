import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../models/twin_result.dart";
import "../../../services/analytics_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "share_sheet.dart";

/// Rewritten to read like a shareable personality reveal, not a UI card:
/// "You got..." instead of a label, one line of traits instead of pills,
/// "Your mission:" instead of a boxed callout.
class ResultView extends StatefulWidget {
  final TwinResult result;
  final VoidCallback onMeetPeople;
  final VoidCallback onRetake;

  const ResultView({
    super.key,
    required this.result,
    required this.onMeetPeople,
    required this.onRetake,
  });

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  bool _shareOpen = false;

  @override
  void initState() {
    super.initState();
    AnalyticsService.track("result_viewed", {"result": widget.result.key});
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.result;
    return Column(
      key: const ValueKey("result"),
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("YOU GOT...", style: AppTextStyles.eyebrow(color: AppColors.cream.withOpacity(0.6))),
        const SizedBox(height: 14),
        Text(r.emoji, style: const TextStyle(fontSize: 56)),
        const SizedBox(height: 8),
        Text(r.name.toUpperCase(), style: AppTextStyles.display(color: AppColors.gold, size: 34), textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Text(
          r.zinger,
          textAlign: TextAlign.center,
          style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 17),
        ),
        const SizedBox(height: 18),
        Text(
          r.tags.map((t) => t.toUpperCase()).join(" \u00b7 "),
          textAlign: TextAlign.center,
          style: AppTextStyles.body(color: AppColors.gold, size: 13, weight: FontWeight.w700),
        ),
        const SizedBox(height: 32),
        Text("YOUR MISSION:", style: AppTextStyles.eyebrow(color: AppColors.gold)),
        const SizedBox(height: 8),
        Text(
          r.mission,
          textAlign: TextAlign.center,
          style: AppTextStyles.body(color: AppColors.cream, size: 17),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            AppButton(
              label: "Share my result",
              variant: AppButtonVariant.gold,
              large: true,
              onPressed: () {
                AnalyticsService.track("result_shared", {"channel": "open_panel"});
                setState(() => _shareOpen = !_shareOpen);
              },
            ),
            AppButton(label: "Find my people \u2192", variant: AppButtonVariant.teal, large: true, onPressed: widget.onMeetPeople),
          ],
        ),
        if (_shareOpen) ...[
          const SizedBox(height: 28),
          ShareSheet(result: r),
        ],
        const SizedBox(height: 16),
        TextButton(
          onPressed: widget.onRetake,
          child: Text(
            "Take it again",
            style: AppTextStyles.body(color: AppColors.gold, size: 14, weight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
