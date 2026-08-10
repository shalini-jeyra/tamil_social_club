import "package:flutter/material.dart";
import "../../core/theme/app_colors.dart";

enum SectionBackground { cream, offWhite, teal }

/// Consistent horizontal padding + max content width + background for every
/// homepage / Chapter 0 section, so spacing never drifts between them.
class SectionWrapper extends StatelessWidget {
  final Widget child;
  final SectionBackground background;
  final double maxWidth;

  const SectionWrapper({
    super.key,
    required this.child,
    this.background = SectionBackground.cream,
    this.maxWidth = 980,
  });

  Color get _bg {
    switch (background) {
      case SectionBackground.cream:
        return AppColors.cream;
      case SectionBackground.offWhite:
        return AppColors.offWhite;
      case SectionBackground.teal:
        return AppColors.teal900;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: _bg,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: isMobile ? 48 : 72),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
