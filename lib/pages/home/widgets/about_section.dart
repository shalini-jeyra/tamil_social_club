import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../widgets/sections/section_wrapper.dart";

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Why does making friends after 25 feel like a full-time job?",
          style: AppTextStyles.display(size: isMobile ? 26 : 32),
        ),
        const SizedBox(height: 14),
        Text(
          "You move to Bengaluru. You meet people at work. You have 47 people on "
          "WhatsApp. And somehow, when Friday comes, you still don't know who to call.",
          style: AppTextStyles.body(size: 16, color: AppColors.charcoal.withOpacity(0.8)),
        ),
        const SizedBox(height: 12),
        Text(
          "Tamil Social Club started because we thought that was a little ridiculous.",
          style: AppTextStyles.body(size: 16, color: AppColors.charcoal.withOpacity(0.8)),
        ),
      ],
    );

    final tags = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        _TagLine("Small gatherings."),
        SizedBox(height: 10),
        _TagLine("New people."),
        SizedBox(height: 10),
        _TagLine("Shared culture."),
        SizedBox(height: 10),
        _TagLine("No forced networking."),
      ],
    );

    return SectionWrapper(
      background: SectionBackground.offWhite,
      child: isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [copy, const SizedBox(height: 28), tags])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: copy),
                const SizedBox(width: 40),
                Expanded(flex: 4, child: tags),
              ],
            ),
    );
  }
}

class _TagLine extends StatelessWidget {
  final String text;
  const _TagLine(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18),
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: AppColors.gold, width: 3)),
      ),
      child: Text(text, style: AppTextStyles.display(size: 18, weight: FontWeight.w600)),
    );
  }
}
