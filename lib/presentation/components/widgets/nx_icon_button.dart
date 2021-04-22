import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';

class NXIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const NXIconButton({
    Key? key,
    required this.icon,
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
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
