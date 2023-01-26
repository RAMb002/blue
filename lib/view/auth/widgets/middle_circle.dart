import 'package:flutter/material.dart';

class MiddleCircle extends StatelessWidget {
  const MiddleCircle({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      // right: -(width * 0.93).clamp(500, 550).toDouble(),
      right: -350,
      child: Container(
          height: width * 1.3,
          width: width * 1.3,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Color(0xFFFF8B54),
                  Color(0xFFFFECC1)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topLeft,
              ),

              // color: Colors.red,
              shape: BoxShape.circle)),
    );
  }
}