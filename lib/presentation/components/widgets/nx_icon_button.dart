import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_svg/svg.dart';

class NXIconButton extends StatelessWidget {
  final String svgName;
  final VoidCallback? onTap;

  const NXIconButton({
    Key? key,
    required this.svgName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: NXColors.darkGrey.withOpacity(0.18)),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/$svgName.svg',
            width: 21,
            height: 21,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
