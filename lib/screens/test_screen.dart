import 'package:flutter/material.dart';
import 'dart:math';

import 'package:sitegalleria/const.dart';

class SolarSystemWithPartialRings extends StatefulWidget {
  @override
  _SolarSystemWithPartialRingsState createState() =>
      _SolarSystemWithPartialRingsState();
}

class _SolarSystemWithPartialRingsState
    extends State<SolarSystemWithPartialRings> with TickerProviderStateMixin {
  late AnimationController _sunController;
  late AnimationController _ringsController;
  late Animation<double> _sunAnimation;
  late Animation<double> _ringAnimation;

  @override
  void initState() {
    super.initState();

    // Sun sliding in from the left
    _sunController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Rings expanding outward and then stopping
    _ringsController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Tween for sun movement (partially visible sun sliding in)
    _sunAnimation = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(
        parent: _sunController,
        curve: Curves.easeInOut,
      ),
    );

    // Tween for ring expansion (grows from 0 to full size)
    _ringAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ringsController,
        curve: Curves.easeOut,
      ),
    );

    // Start the sun animation and then trigger the rings
    _sunController.forward().then((_) => _ringsController.forward());
  }

  @override
  void dispose() {
    _sunController.dispose();
    _ringsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      body: Stack(
        children: [
          // Ring Animation - Custom painter for the rings
          AnimatedBuilder(
            animation: _ringAnimation,
            builder: (context, child) {
              return CustomPaint(
                size: Size(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height),
                painter: PartialRingsPainter(
                  animationValue: _ringAnimation.value,
                  sunAnimationValue: _sunAnimation.value,
                ),
              );
            },
          ),
          // Sun Animation with 25% hidden on the left
          AnimatedBuilder(
            animation: _sunAnimation,
            builder: (context, child) {
              return Positioned(
                left: MediaQuery.of(context).size.width * _sunAnimation.value,
                top: MediaQuery.of(context).size.height / 2 - 85,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.centerRight,
                    widthFactor: 0.75, // Show only 75% of the width
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [
                                Color2,
                                Color1,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Custom Painter for drawing partial rings originating from the center of the sun
class PartialRingsPainter extends CustomPainter {
  final double animationValue; // Value for ring animation
  final double sunAnimationValue; // Value for sun position
  final double sunRadius = 60; // Radius of the sun

  PartialRingsPainter({
    required this.animationValue,
    required this.sunAnimationValue,
  });

  // Define the properties of each ring
  final List<RingProperties> rings = [
    RingProperties(
      size: 120,
      angle: -pi / 4,
      color: Color3,
      strokeWidth: 0.5,
      lengthFactor: 3,
      verticalOffset: 20,
      horizontalOffset: -40, // Example horizontal offset
    ),
    RingProperties(
      size: 175,
      angle: -pi / 3,
      color: Color3,
      strokeWidth: 0.5,
      lengthFactor: 4.0,
      verticalOffset: 30,
      horizontalOffset: -40, // Example horizontal offset
    ),
    RingProperties(
      size: 240,
      angle: -pi / 8,
      color: Color3,
      strokeWidth: 0.5,
      lengthFactor: 3.0,
      verticalOffset: 70,
      horizontalOffset: -45, // Example horizontal offset
    ),
    RingProperties(
      size: 300,
      angle: -pi / 2,
      color: Color3,
      strokeWidth: 0.5,
      lengthFactor: 3.5,
      verticalOffset: 15,
      horizontalOffset: -40, // Example horizontal offset
    ),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the sun's position based on the animation value
    double sunLeftPosition = size.width * sunAnimationValue;
    Offset sunCenter = Offset(sunLeftPosition + sunRadius, size.height / 2.1);

    // Draw each ring with custom properties
    for (RingProperties ring in rings) {
      double ringRadius =
          (sunRadius + ring.size) * animationValue; // Expanding radius
      double sweepAngle = pi * 0.75 * ring.lengthFactor; // Adjustable length
      Rect arcRect = Rect.fromCircle(
        center: Offset(
            sunCenter.dx + ring.horizontalOffset,
            sunCenter.dy +
                ring.verticalOffset), // Apply vertical and horizontal offset
        radius: ringRadius,
      );

      // Create a paint object for each ring
      Paint ringPaint = Paint()
        ..color = ring.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = ring.strokeWidth;

      // Draw the arc for the ring
      canvas.drawArc(arcRect, ring.angle, sweepAngle, false, ringPaint);
    }
  }

  @override
  bool shouldRepaint(PartialRingsPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.sunAnimationValue != sunAnimationValue;
  }
}

// Class for defining ring properties
class RingProperties {
  final double size; // Radius of the ring
  final double angle; // Starting angle of the ring
  final Color color; // Color of the ring
  final double strokeWidth; // Width of the ring stroke
  final double lengthFactor; // Fraction of the ring length to display
  final double verticalOffset; // Vertical offset for positioning the ring
  final double horizontalOffset; // Horizontal offset for positioning the ring

  RingProperties({
    required this.size,
    required this.angle,
    required this.color,
    required this.strokeWidth,
    required this.lengthFactor,
    required this.verticalOffset, // Existing parameter
    required this.horizontalOffset, // New parameter for horizontal positioning
  });
}
