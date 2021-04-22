import 'package:flutter/cupertino.dart';
import 'package:flutter_app/utils/nx_colors.dart';

class NXSlidingSegmentedControl extends StatelessWidget {
  final Map<int, Widget> children;
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
      thumbColor: NXColors.orange,
      groupValue: groupValue,
      children: children,
      onValueChanged: onValueChanged,
    );
  }
}
