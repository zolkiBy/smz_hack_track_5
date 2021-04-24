import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scaleBound;

  BouncingButton({
    Key? key,
    required this.child,
    this.scaleBound = 0.1,
    this.onTap,
  })  : assert(scaleBound >= 0 && scaleBound <= 1),
        super(key: key);

  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: widget.scaleBound,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTap: widget.onTap,
      child: Listener(
        onPointerDown: (_) => _tapDown(),
        onPointerUp: (_) => _tapUp(),
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ),
      ),
    );
  }

  void _tapDown() {
    _controller.forward();
  }

  void _tapUp() {
    _controller.reverse();
  }
}
