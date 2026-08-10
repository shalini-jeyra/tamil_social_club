import "package:flutter/material.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";

/// Small pill used for "8 questions / 2 minutes / 0% accuracy" style stats.
class StatChip extends StatelessWidget {
  final String value;
  final String label;

  const StatChip({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.creamSoft,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.charcoal.withOpacity(0.12)),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "$value ", style: AppTextStyles.body(size: 13, weight: FontWeight.w700, color: AppColors.teal800)),
            TextSpan(text: label, style: AppTextStyles.body(size: 13)),
          ],
        ),
      ),
    );
  }
}
