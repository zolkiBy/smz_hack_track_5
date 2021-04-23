import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/components/widgets/nx_app_bar.dart';
import 'package:flutter_app/presentation/components/widgets/nx_icon_button.dart';
import 'package:flutter_app/presentation/components/widgets/nx_segmented_control.dart';

class Styles {
  static const segmentedValue = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _currentSegmentedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NXAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NXIconButton(
              icon: Icons.sort,
            ),
            NXSlidingSegmentedControl(
              groupValue: _currentSegmentedIndex,
              onValueChanged: (index) {
                setState(() {
                  _currentSegmentedIndex = index ?? 0;
                });
              },
              children: {
                0: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Заказы',
                    style: Styles.segmentedValue,
                  ),
                ),
                1: Text(
                  'Оплаты',
                  style: Styles.segmentedValue,
                ),
              },
            ),
            NXIconButton(
              icon: Icons.add,
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
