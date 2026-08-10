import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

/// PRD §8 — "What TSC Is" section.
/// Punchy, editorial, not a networking event.
class WhatTscIsSection extends StatelessWidget {
  const WhatTscIsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.charcoal,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 64 : 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: isMobile
              ? _buildMobile(isMobile)
              : _buildDesktop(isMobile),
        ),
      ),
    );
  }

  Widget _buildDesktop(bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _headline(isMobile),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 5,
          child: _copy(isMobile),
        ),
      ],
    );
  }

  Widget _buildMobile(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headline(isMobile),
        const SizedBox(height: 36),
        _copy(isMobile),
      ],
    );
  }

  Widget _headline(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "More than just\nnetworking.",
          style: AppTextStyles.display(
            color: AppColors.cream,
            size: isMobile ? 30 : 42,
          ).copyWith(height: 1.1),
        ),
        const SizedBox(height: 20),
        Text(
          "We believe the best connections happen naturally. Swap the stiff pitches and formal panels for shared interests and genuinely good weekends.",
          style: AppTextStyles.body(
            color: AppColors.cream.withOpacity(0.85),
            size: isMobile ? 18 : 20,
          ),
        ),
      ],
    );
  }

  Widget _copy(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _line("No stiff panels or forced pitches."),
        const SizedBox(height: 16),
        _line("Organic networking over shared interests."),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gold.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Just people, shared interests\nand something fun to do.\n\nCome alone. Leave knowing someone.",
            style: AppTextStyles.body(
              color: AppColors.cream.withOpacity(0.9),
              size: isMobile ? 16 : 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _line(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.gold, shape: BoxShape.circle)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.75), size: 17)),
        ),
      ],
    );
  }
}
