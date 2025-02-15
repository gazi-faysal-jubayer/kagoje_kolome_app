import 'package:flutter/material.dart';
import 'dart:ui';

class DashedLinePainter extends CustomPainter {
  final int tutorialStep;

  DashedLinePainter({required this.tutorialStep});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF94DAB0)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Paint bulbPaint = Paint()
      ..color = const Color.fromARGB(255, 118, 48, 5)
      ..style = PaintingStyle.fill;

    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(1.0)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.0)
      ..style = PaintingStyle.fill;

    // First dashed curved line
    double startX1 = 260;
    double startY1 = 690;
    double endX1 = 145;
    double endY1 = 600;
    double controlX1 = 140;
    double controlY1 = 600;

    // Second dashed curved line
    double startX2 = 260;
    double startY2 = 690;
    double endX2 = 120;
    double endY2 = 630;
    double controlX2 = 145;
    double controlY2 = 610;

    // Draw curved dashed lines based on tutorial step
    if (tutorialStep == 0) {
      drawDashedCurvedLine(
        canvas,
        Offset(startX1, startY1),
        Offset(endX1, endY1),
        Offset(controlX1, controlY1),
        paint
      );
      
      // Draw shadow and bulb for first line
      canvas.drawCircle(Offset(endX1, endY1 + 1), 4, shadowPaint);
      canvas.drawCircle(Offset(endX1, endY1), 4, bulbPaint);
      canvas.drawCircle(Offset(endX1 - 1, endY1 - 1), 1.5, bulbPaint);
    } else if (tutorialStep == 1) {
      drawDashedCurvedLine(
        canvas,
        Offset(startX2, startY2),
        Offset(endX2, endY2),
        Offset(controlX2, controlY2),
        paint
      );
      
      // Draw shadow and bulb for second line
      canvas.drawCircle(Offset(endX2, endY2 + 1), 4, shadowPaint);
      canvas.drawCircle(Offset(endX2, endY2), 4, bulbPaint);
      canvas.drawCircle(Offset(endX2 - 1, endY2 - 1), 1.5, bulbPaint);
    }
  }

  void drawDashedCurvedLine(Canvas canvas, Offset start, Offset end, Offset control, Paint paint) {
    Path path = Path();
    path.moveTo(start.dx, start.dy);
    path.quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

    final dashPath = Path();
    const dashLength = 10.0;
    const dashSpace = 5.0;
    
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double nextDistance = distance + dashLength;
        dashPath.addPath(
          pathMetric.extractPath(distance, nextDistance),
          Offset.zero,
        );
        distance = nextDistance + dashSpace;
      }
    }
    
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashedLine extends StatelessWidget {
  final int tutorialStep;

  const DashedLine({
    Key? key,
    required this.tutorialStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(tutorialStep: tutorialStep),
      size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
    );
  }
}