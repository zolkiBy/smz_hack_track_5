import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';

class NXAppBar extends PreferredSize {
  final Row _child;

  NXAppBar({
    Key? key,
    required Row child,
  })   : _child = child,
        super(
          child: child,
          preferredSize: Size.fromHeight(80),
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [NXColors.backgroundBlack, Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
        ),
        Container(
          height: 155,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _child,
            ),
          ),
        ),
      ],
    );
  }
}
