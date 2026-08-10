import "package:flutter/material.dart";
import "../../../core/constants/links.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../models/twin_result.dart";
import "../../../services/analytics_service.dart";
import "../../../services/share_service.dart";
import "../../../widgets/buttons/app_button.dart";

/// The shareable card + share actions shown after tapping "Share my result".
class ShareSheet extends StatefulWidget {
  final TwinResult result;
  const ShareSheet({super.key, required this.result});

  @override
  State<ShareSheet> createState() => _ShareSheetState();
}

class _ShareSheetState extends State<ShareSheet> {
  bool _copied = false;

  String get _shareText {
    final r = widget.result;
    return "I'm the ${r.emoji} ${r.name.toUpperCase()} — who's your Tamil Twin? "
        "${AppLinks.website}/tamil-twin";
  }

  Future<void> _copyLink() async {
    await ShareService.copyLink("${AppLinks.website}/tamil-twin");
    AnalyticsService.track("result_shared", {"channel": "copy_link"});
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.result;
    final isMobile = MediaQuery.of(context).size.width < 600;

    final card = Container(
      width: 240,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(color: AppColors.offWhite, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text("TAMIL SOCIAL CLUB", style: AppTextStyles.display(size: 13, weight: FontWeight.w700)),
          const SizedBox(height: 18),
          Text("I'M THE", style: AppTextStyles.body(size: 12, color: AppColors.charcoal.withOpacity(0.6))),
          const SizedBox(height: 6),
          Text(
            "${r.emoji} ${r.name.replaceFirst('The ', '').toUpperCase()}",
            textAlign: TextAlign.center,
            style: AppTextStyles.display(size: 20, color: AppColors.teal800),
          ),
          const SizedBox(height: 16),
          Text("Who's your Tamil Twin?", style: AppTextStyles.body(size: 14)),
          const SizedBox(height: 16),
          Text("tamilsocialclub.in", style: AppTextStyles.body(size: 12, weight: FontWeight.w600, color: AppColors.teal800)),
        ],
      ),
    );

    final actions = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton(
          label: "Share to WhatsApp",
          variant: AppButtonVariant.teal,
          onPressed: () {
            AnalyticsService.track("result_shared", {"channel": "whatsapp"});
            ShareService.shareToWhatsapp(_shareText);
          },
        ),
        const SizedBox(height: 10),
        AppButton(
          label: _copied ? "Link copied ✓" : "Copy link",
          variant: AppButtonVariant.ghostLight,
          onPressed: _copyLink,
        ),
        const SizedBox(height: 12),
        Text(
          "For Instagram: screenshot this card and post it to your story — tag @tamilsocialclub.",
          style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.7), size: 13),
        ),
      ],
    );

    return isMobile
        ? Column(children: [card, const SizedBox(height: 20), actions])
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              card,
              const SizedBox(width: 24),
              Expanded(child: actions),
            ],
          );
  }
}
