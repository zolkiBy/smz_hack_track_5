import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/application/orders/orders_bloc.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/presentation/components/widgets/nx_app_bar.dart';
import 'package:flutter_app/presentation/components/widgets/nx_icon_button.dart';
import 'package:flutter_app/presentation/components/widgets/nx_segmented_control.dart';
import 'package:flutter_app/presentation/orders/widgets/finance_list.dart';
import 'package:flutter_app/presentation/orders/widgets/orders_list.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/string_formatter.dart';
import 'package:flutter_app/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _currentSegmentedIndex == 0,
                  child: BouncingButton(
                    child: NXIconButton(
                      svgName: 'stack',
                    ),
                  ),
                ),
                Visibility(
                  visible: _currentSegmentedIndex == 1,
                  child: SizedBox(
                    height: 44,
                    width: 44,
                  ),
                ),
                const Spacer(),
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
                const Spacer(),
                Visibility(
                  visible: _currentSegmentedIndex == 0,
                  child: BouncingButton(
                    child: NXIconButton(
                      svgName: 'plus',
                    ),
                  ),
                ),
                Visibility(
                  visible: _currentSegmentedIndex == 1,
                  child: BouncingButton(
                    child: NXIconButton(
                      svgName: 'calendar',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Баланс',
                  style: primaryText18,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(numberWithSpaces(52398475038), style: primaryText22),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      'assets/icons/rub.svg',
                      width: 22,
                      height: 22,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_currentSegmentedIndex) {
      case 0:
        return OrdersList();
      default:
        return FinanceList();
    }
  }
}
