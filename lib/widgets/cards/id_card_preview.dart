import "package:flutter/material.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";

/// The homepage's teaser card for the Tamil Twin game — a small
/// membership-card motif that reappears (in fuller form) on the result screen.
class IdCardPreview extends StatelessWidget {
  const IdCardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.teal900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold),
        boxShadow: [
          BoxShadow(color: AppColors.teal900.withOpacity(0.25), blurRadius: 30, offset: const Offset(0, 12)),
        ],
      ),
      child: Column(
        children: [
          Text("TAMIL SOCIAL CLUB", style: AppTextStyles.eyebrow(color: AppColors.gold)),
          const SizedBox(height: 14),
          const Text("🎲🕶️🎬", style: TextStyle(fontSize: 30)),
          const SizedBox(height: 14),
          Text("WHO'S YOURS?", style: AppTextStyles.display(color: AppColors.cream, size: 14, weight: FontWeight.w700)),
        ],
      ),
    );
  }
}
