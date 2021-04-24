import 'package:flutter/material.dart';

class GradientedBackground extends StatelessWidget {
  final Widget child;

  const GradientedBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-1, 1),
            radius: 1.3,
            colors: [
              Color(0xffFF5C00).withOpacity(0.15),
              Color(0xffFF3D00).withOpacity(0.02),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 0.7,
              center: Alignment(0.4, -0.3),
              colors: [
                Color(0xffFFA803).withOpacity(0.15),
                Color(0xffFF7628).withOpacity(0.05),
              ],
            ),
          ),
          child: child,
        ));
  }
}
