import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';

const double _btnHeight = 50;
const double _borderRadius = 14;

class GradientedActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const GradientedActionButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      key: key,
      gradient: LinearGradient(
        colors: [NXColors.bgStartGradientActionButton, NXColors.bgEndGradientActionButton],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      text: text,
      onPressed: onPressed,
    );
  }
}

class FilledActionButton extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback? onPressed;

  const FilledActionButton({Key? key, this.color, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      key: key,
      color: color ?? NXColors.materialDark,
      text: text,
      onPressed: onPressed,
    );
  }
}

class ActionButton extends StatelessWidget {
  final Color? color;
  final Gradient? gradient;
  final String text;
  final VoidCallback? onPressed;

  const ActionButton({Key? key, this.gradient, this.color, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _btnHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius))),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(_borderRadius),
            gradient: gradient,
          ),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}