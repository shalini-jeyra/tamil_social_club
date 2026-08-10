import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../models/twin_result.dart";
import "../../../services/analytics_service.dart";
import "../../../widgets/buttons/app_button.dart";
import "share_sheet.dart";

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
        Text("YOUR TAMIL TWIN IS", style: AppTextStyles.eyebrow(color: AppColors.cream.withOpacity(0.6))),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
          decoration: BoxDecoration(
            color: AppColors.cream.withOpacity(0.06),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.gold),
          ),
          child: Column(
            children: [
              Text(r.emoji, style: const TextStyle(fontSize: 52)),
              const SizedBox(height: 10),
              Text(r.name.toUpperCase(), style: AppTextStyles.display(color: AppColors.gold, size: 30)),
              const SizedBox(height: 14),
              Text(
                r.zinger,
                textAlign: TextAlign.center,
                style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 16),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: r.tags
                    .map((t) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.cream.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(t, style: AppTextStyles.body(color: AppColors.cream, size: 12)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.gold.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.gold, style: BorderStyle.solid),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("YOUR CHAPTER 0 MISSION", style: AppTextStyles.eyebrow(color: AppColors.gold)),
              const SizedBox(height: 6),
              Text(r.mission, style: AppTextStyles.body(color: AppColors.cream, size: 16)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            AppButton(
              label: "Share my result",
              variant: AppButtonVariant.gold,
              onPressed: () {
                AnalyticsService.track("result_shared", {"channel": "open_panel"});
                setState(() => _shareOpen = !_shareOpen);
              },
            ),
            AppButton(label: "Meet my people →", variant: AppButtonVariant.teal, onPressed: widget.onMeetPeople),
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
            "Retake the quiz",
            style: AppTextStyles.body(color: AppColors.gold, size: 14, weight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
