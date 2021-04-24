import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/application/orders/orders_bloc.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/presentation/components/widgets/nx_app_bar.dart';
import 'package:flutter_app/presentation/components/widgets/nx_icon_button.dart';
import 'package:flutter_app/presentation/components/widgets/nx_segmented_control.dart';
import 'package:flutter_app/presentation/orders/widgets/orders_list.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BouncingButton(
              child: NXIconButton(
                svgName: 'stack',
              ),
            ),
            NXSlidingSegmentedControl(
              groupValue: _currentSegmentedIndex,
              onValueChanged: (index) {
                setState(() {
                  _currentSegmentedIndex = index ?? 0;
                });
              },
              children: {
                0: 'Заказы',
                1: 'Финансы',
              },
            ),
            BouncingButton(
              child: NXIconButton(
                svgName: 'plus',
              ),
            ),
          ],
        ),
      ),
      body: OrdersList(),
    );
  }
}
