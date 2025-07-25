import 'dart:math';
import 'package:flutter/material.dart';

class OnboardingProgressPainter extends CustomPainter {
  final int currentSection;
  final int totalSections;
  final double strokeWidth;
  final Color activeColor;
  final Color inactiveColor;

  OnboardingProgressPainter({
    required this.currentSection,
    this.totalSections = 3,
    this.strokeWidth = 4,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final sectionAngle = 2 * pi / totalSections;

    final gapSize = pi / 30; // ← زاوية الفاصل (صغيرة لكنها واضحة)

    final inactivePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = inactiveColor
      ..strokeCap = StrokeCap.butt; // ← هذا هو التغيير المهم

    final activePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = activeColor
      ..strokeCap = StrokeCap.butt; // ← نفس الشيء هنا

    for (int i = 0; i < totalSections; i++) {
      final startAngle = i * sectionAngle + gapSize / 2;
      final sweepAngle = sectionAngle - gapSize;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        i < currentSection ? activePaint : inactivePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant OnboardingProgressPainter oldDelegate) {
    return oldDelegate.currentSection != currentSection;
  }
}
