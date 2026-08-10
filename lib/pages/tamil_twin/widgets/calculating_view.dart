import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

class CalculatingView extends StatefulWidget {
  const CalculatingView({super.key});

  @override
  State<CalculatingView> createState() => _CalculatingViewState();
}

class _CalculatingViewState extends State<CalculatingView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("calculating"),
      mainAxisSize: MainAxisSize.min,
      children: [
        RotationTransition(
          turns: _controller,
          child: const Text("🎲", style: TextStyle(fontSize: 56)),
        ),
        const SizedBox(height: 20),
        Text(
          "Calculating your Tamil Twin...",
          style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 17),
        ),
      ],
    );
  }
}
