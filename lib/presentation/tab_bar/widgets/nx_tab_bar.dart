import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';

class NXTabBar extends StatefulWidget {
  final List<IconData> items;
  final int initialIndex;
  final void Function(int)? onChanged;

  const NXTabBar({
    Key? key,
    required this.items,
    this.initialIndex = 0,
    this.onChanged,
  }) : super(key: key);

  @override
  _NXTabBarState createState() => _NXTabBarState();
}

class _NXTabBarState extends State<NXTabBar> {
  final double tabBarHeight = 70;

  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      height: tabBarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: NXColors.darkGrey.withOpacity(0.18),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.items
              .map(
                (item) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = widget.items.indexOf(item);
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(_currentIndex);
                      }
                    },
                    child: Container(
                      height: tabBarHeight,
                      color: Colors.transparent,
                      child: Icon(
                        item,
                        color: _currentIndex == widget.items.indexOf(item)
                            ? NXColors.orange
                            : NXColors.systemGrey,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
