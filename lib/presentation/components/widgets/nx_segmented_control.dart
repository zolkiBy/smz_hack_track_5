import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';

class NXSlidingSegmentedControl extends StatelessWidget {
  final Map<int, String> children;
  final void Function(int?) onValueChanged;
  final int groupValue;

  const NXSlidingSegmentedControl({
    Key? key,
    required this.children,
    required this.onValueChanged,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<int>(
      padding: const EdgeInsets.all(8),
      backgroundColor: NXColors.darkGrey.withOpacity(0.18),
      thumbColor: NXColors.quartenaryLightGrey,
      groupValue: groupValue,
      children: children.map((key, value) {
        return MapEntry(
            key,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(value,
                  style: primaryTextSemiBold15.copyWith(
                    color: groupValue == key ? NXColors.orange : Colors.white,
                  )),
            ));
      }),
      onValueChanged: onValueChanged,
    );
  }
}
