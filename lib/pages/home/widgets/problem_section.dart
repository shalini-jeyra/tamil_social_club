import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

/// PRD §7 — "The Problem" section.
/// Editorial magazine feel — giant decorative quotation mark as backdrop.
class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.offWhite,
      child: Stack(
        children: [
          // Giant decorative quotation mark
          Positioned(
            top: isMobile ? 8 : 0,
            left: isMobile ? 8 : 28,
            child: Text(
              "\u201C",
              style: TextStyle(
                fontSize: isMobile ? 200 : 320,
                fontWeight: FontWeight.w900,
                color: AppColors.teal900.withOpacity(0.055),
                height: 1,
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 72 : 108,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 780),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\u201CWe should meet sometime.\u201D",
                      style: AppTextStyles.display(
                        size: isMobile ? 28 : 46,
                        color: AppColors.charcoal,
                      ).copyWith(height: 1.1, letterSpacing: -0.3),
                    ),
                    const SizedBox(height: 36),
                    Container(width: 48, height: 2, color: AppColors.gold),
                    const SizedBox(height: 36),
                    Text(
                      "We've all said it.",
                      style: AppTextStyles.body(
                        size: isMobile ? 18 : 22,
                        color: AppColors.charcoal.withOpacity(0.85),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "Somehow, \u201Csometime\u201D never becomes a plan.",
                      style: AppTextStyles.body(
                        size: isMobile ? 18 : 22,
                        color: AppColors.charcoal.withOpacity(0.55),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.teal800,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "So we're making the plan.",
                          style: AppTextStyles.display(
                            size: isMobile ? 20 : 28,
                            color: AppColors.teal800,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
