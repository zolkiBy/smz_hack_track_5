import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';

class GradientedActionButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final VoidCallback? onPressed;

  const GradientedActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      key: key,
      gradient: LinearGradient(
        colors: [
          disabled ? NXColors.bgStartGradientActionButton.withOpacity(0.2) : NXColors.bgStartGradientActionButton,
          disabled ? NXColors.bgEndGradientActionButton.withOpacity(0.2) : NXColors.bgEndGradientActionButton,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      text: text,
      onPressed: disabled ? null : onPressed,
      textStyle: primaryTextSemiBold17,
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
      color: (color ?? NXColors.materialDark),
      text: text,
      onPressed: onPressed,
      textStyle: primaryTextSemiBold17,
    );
  }
}

class ActionButton extends StatelessWidget {
  final Color? color;
  final TextStyle? textStyle;
  final Gradient? gradient;
  final String text;
  final bool disabled;
  final VoidCallback? onPressed;

  const ActionButton({
    Key? key,
    this.gradient,
    this.disabled = false,
    this.color,
    required this.text,
    this.textStyle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.buttonHeight,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.widgetBorderRadius))),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Constants.widgetBorderRadius),
            gradient: gradient,
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle == null ? null : textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
