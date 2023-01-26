import 'package:flutter/material.dart';

class BottomCicle extends StatelessWidget {
  const BottomCicle({super.key,required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -120,
      left: -90,
      child: Container(
          height: width * 0.65,
          width: width * 0.65,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Color(0xFFFF8B54), Color(0xFFFFECC1)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),

              // color: Colors.red,
              shape: BoxShape.circle)),
    );
  }
}
