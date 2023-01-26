import 'package:flutter/material.dart';

class TopCircle extends StatelessWidget {
  const TopCircle({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -220,
      left: -140,
      child: Container(
          height: width * 1.35,
          width: width * 1.35,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Color(0xFFFF8B54),
                  Color(0xFFFFECC1)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.centerRight,
              ),

              // color: Colors.red,
              shape: BoxShape.circle)),
    );
  }
}