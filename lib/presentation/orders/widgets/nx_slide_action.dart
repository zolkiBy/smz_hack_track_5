import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_svg/svg.dart';

class NXSlideAction extends StatelessWidget {
  final String svgName;
  final VoidCallback? onTap;

  const NXSlideAction({
    Key? key,
    required this.svgName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: NXColors.fillDarkPrimary.withOpacity(.38),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: SvgPicture.asset('assets/icons/$svgName.svg'),
      ),
    );
  }
}
