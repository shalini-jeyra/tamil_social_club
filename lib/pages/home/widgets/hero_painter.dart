import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";

/// A quiet, hand-drawn skyline + string-lights motif for the hero.
/// Replaces the old giant "TSC" watermark — the brand element should sit
/// in the background, not compete with the headline.
class HeroPainter extends CustomPainter {
  const HeroPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final skyline = Paint()..color = const Color(0xFF0B2E2B);
    void building(double x, double y, double bw, double bh) {
      canvas.drawRect(Rect.fromLTWH(x, y, bw, bh), skyline);
    }

    building(w * 0.86, h * 0.55, w * 0.10, h * 0.45);
    building(w * 0.94, h * 0.42, w * 0.10, h * 0.58);
    building(-w * 0.02, h * 0.60, w * 0.10, h * 0.40);

    final lightPaint = Paint()..color = AppColors.gold;
    final haloPaint = Paint()..color = AppColors.gold.withOpacity(0.16);
    final stringPaint = Paint()
      ..color = AppColors.gold.withOpacity(0.28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path()..moveTo(w * 0.55, h * 0.10);
    path.quadraticBezierTo(w * 0.75, h * 0.22, w * 0.97, h * 0.08);
    canvas.drawPath(path, stringPaint);

    for (final t in [0.58, 0.66, 0.74, 0.82, 0.90]) {
      final dx = w * 0.55 + (w * 0.42) * t;
      final dy = h * 0.10 + (h * 0.12) * (t < 0.75 ? t * 1.6 : (1 - t) * 1.6);
      canvas.drawCircle(Offset(dx, dy), 7, haloPaint);
      canvas.drawCircle(Offset(dx, dy), 2.6, lightPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
