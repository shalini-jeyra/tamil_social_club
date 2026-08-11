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

  bool _secondLine = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 650), () {
      if (mounted) setState(() => _secondLine = true);
    });
  }

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
          child: const Text("\ud83c\udfb2", style: TextStyle(fontSize: 56)),
        ),
        const SizedBox(height: 20),
        Text(
          _secondLine ? "Your Tamil Twin is being summoned." : "Consulting absolutely no scientific data...",
          style: AppTextStyles.body(color: AppColors.cream.withOpacity(0.85), size: 17),
        ),
      ],
    );
  }
}
