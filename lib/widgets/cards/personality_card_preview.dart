import "package:flutter/material.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";

/// The homepage's Tamil Twin teaser visual — a larger, slightly tilted
/// "personality card" (replaces the smaller, more UI-ish IdCardPreview).
/// Rotates upright on hover on wide screens.
class PersonalityCardPreview extends StatefulWidget {
  const PersonalityCardPreview({super.key});

  @override
  State<PersonalityCardPreview> createState() => _PersonalityCardPreviewState();
}

class _PersonalityCardPreviewState extends State<PersonalityCardPreview> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedRotation(
        turns: _hovering ? 0 : -0.035,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: Container(
          width: 260,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: AppColors.teal900,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.gold),
            boxShadow: [
              BoxShadow(color: AppColors.teal900.withOpacity(0.3), blurRadius: 26, offset: const Offset(0, 14)),
            ],
          ),
          child: Column(
            children: [
              Text("TAMIL SOCIAL CLUB", style: AppTextStyles.eyebrow(color: AppColors.gold)),
              const SizedBox(height: 22),
              const Text("🎲", style: TextStyle(fontSize: 40)),
              const SizedBox(height: 18),
              Text("THE CHAOS AGENT", style: AppTextStyles.display(color: AppColors.cream, size: 18), textAlign: TextAlign.center),
              const SizedBox(height: 14),
              Text(
                "Spontaneous\nPlayful\nSocial",
                textAlign: TextAlign.center,
                style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.7), size: 13, weight: FontWeight.w600),
              ),
              const SizedBox(height: 22),
              Text("TAMIL SOCIAL CLUB / 001", style: AppTextStyles.body(color: AppColors.gold.withOpacity(0.7), size: 11, weight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
