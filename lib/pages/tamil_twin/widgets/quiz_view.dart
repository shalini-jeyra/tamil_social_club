import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";
import "../../../models/quiz_question.dart";

class QuizView extends StatelessWidget {
  final int index;
  final int total;
  final QuizQuestion question;
  final void Function(String archetypeKey) onAnswer;

  const QuizView({
    super.key,
    required this.index,
    required this.total,
    required this.question,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey("question-$index"),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: index / total,
            minHeight: 6,
            backgroundColor: AppColors.cream.withOpacity(0.15),
            valueColor: const AlwaysStoppedAnimation(AppColors.gold),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "QUESTION ${index + 1} OF $total",
          style: AppTextStyles.eyebrow(color: AppColors.cream.withOpacity(0.6)),
        ),
        const SizedBox(height: 26),
        Text(
          question.text,
          style: AppTextStyles.display(color: AppColors.cream, size: 26),
        ),
        const SizedBox(height: 30),
        ...question.options.map(
          (opt) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _OptionButton(label: opt.label, onTap: () => onAnswer(opt.archetypeKey)),
          ),
        ),
      ],
    );
  }
}

class _OptionButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _OptionButton({required this.label, required this.onTap});

  @override
  State<_OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<_OptionButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: _hovering ? AppColors.gold.withOpacity(0.16) : AppColors.cream.withOpacity(0.06),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _hovering ? AppColors.gold : AppColors.cream.withOpacity(0.18)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.label, style: AppTextStyles.body(color: AppColors.cream, size: 16, weight: FontWeight.w500)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
