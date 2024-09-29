import 'package:flutter/material.dart';
import 'dart:math';

import 'package:sitegalleria/const.dart';
import 'package:sitegalleria/screens/home_screen.dart';

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

    // Navigate to the next screen once both animations are completed
    _ringsController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 1));
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
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
      lengthFactor: 1.0,
      verticalOffset: 20,
      horizontalOffset: -40,
    ),
    RingProperties(
      size: 175,
      angle: -pi / 3,
      color: Color.fromRGBO(140, 172, 252, 1),
      strokeWidth: 2.0,
      lengthFactor: 1.0,
      verticalOffset: 30,
      horizontalOffset: -40,
    ),
    RingProperties(
      size: 240,
      angle: -pi / 8,
      color: Color3,
      strokeWidth: 0.5,
      lengthFactor: 1.0,
      verticalOffset: 70,
      horizontalOffset: -45,
    ),
    RingProperties(
      size: 300,
      angle: -pi / 2,
      color: Color3,
      strokeWidth: 0.5,
      lengthFactor: 1.0,
      verticalOffset: 15,
      horizontalOffset: -40,
    ),
  ];

  // Define the properties of each container
  final List<ContainerProperties> containers = [
    ContainerProperties(
      size: 70,
      color: const Color.fromRGBO(61, 63, 109, 0.6),
      text: 'Family',
    ),
    ContainerProperties(
      size: 70,
      color: const Color.fromRGBO(61, 63, 109, 0.6),
      text: 'Career',
    ),
    ContainerProperties(
      size: 70,
      color: const Color.fromRGBO(61, 63, 109, 0.6),
      text: 'Health',
    ),
    ContainerProperties(
      size: 70,
      color: const Color.fromRGBO(61, 63, 109, 0.6),
      text: 'Marriage',
    ),
    ContainerProperties(
      size: 0,
      color: Colors.white,
      text: '5',
    ),
    ContainerProperties(
      size: 0,
      color: Colors.white,
      text: '6',
    ),
    ContainerProperties(
      size: 0,
      color: Colors.white,
      text: '7',
    ),
    ContainerProperties(
      size: 0,
      color: Colors.blue,
      text: '8',
    ),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    double sunLeftPosition = size.width * sunAnimationValue;
    Offset sunCenter = Offset(sunLeftPosition + sunRadius, size.height / 2.1);

    for (int i = 0; i < rings.length; i++) {
      RingProperties ring = rings[i];
      double ringRadius = (sunRadius + ring.size) * animationValue;
      double sweepAngle =
          pi * 2 * ring.lengthFactor; // Ensure this is wide enough
      Rect arcRect = Rect.fromCircle(
        center: Offset(
          sunCenter.dx + ring.horizontalOffset,
          sunCenter.dy + ring.verticalOffset,
        ),
        radius: ringRadius,
      );

      Paint ringPaint = Paint()
        ..color = ring.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = ring.strokeWidth;

      canvas.drawArc(arcRect, ring.angle, sweepAngle, false, ringPaint);

      // Place circular containers along the second ring (index 1)
      if (i == 1) {
        const int containerCount =
            8; // Update this to the desired number of containers
        double angleStep = sweepAngle / containerCount; // Distribute evenly
        double containerRadius =
            ringRadius; // Set container radius based on ring size

        for (int j = 0; j < containerCount; j++) {
          double angle =
              ring.angle + angleStep * j; // Calculate angle for each container

          // Calculate the position of each container
          double x = sunCenter.dx +
              ring.horizontalOffset +
              containerRadius * cos(angle);
          double y =
              sunCenter.dy + ring.verticalOffset + containerRadius * sin(angle);

          // Draw a circular container at the calculated position
          canvas.drawCircle(
            Offset(x, y),
            containers[j].size / 2,
            Paint()..color = containers[j].color,
          );

          // Add the text inside the containers
          TextSpan textSpan = TextSpan(
            text: containers[j].text,
            style: const TextStyle(
              color: Color.fromRGBO(140, 172, 252, 1),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          );

          TextPainter textPainter = TextPainter(
            text: textSpan,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          );

          textPainter.layout(
            minWidth: 0,
            maxWidth: containers[j].size,
          );

          // Center the text inside the circular container
          textPainter.paint(
            canvas,
            Offset(
              x - textPainter.width / 2,
              y - textPainter.height / 2,
            ),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RingProperties {
  final double size;
  final double angle;
  final Color color;
  final double strokeWidth;
  final double lengthFactor;
  final double verticalOffset;
  final double horizontalOffset;

  RingProperties({
    required this.size,
    required this.angle,
    required this.color,
    required this.strokeWidth,
    required this.lengthFactor,
    required this.verticalOffset,
    required this.horizontalOffset,
  });
}

class ContainerProperties {
  final double size;
  final Color color;
  final String text;

  ContainerProperties({
    required this.size,
    required this.color,
    required this.text,
  });
}
