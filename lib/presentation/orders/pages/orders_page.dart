import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/application/orders/orders_bloc.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/presentation/components/widgets/nx_app_bar.dart';
import 'package:flutter_app/presentation/components/widgets/nx_icon_button.dart';
import 'package:flutter_app/presentation/components/widgets/nx_segmented_control.dart';
import 'package:flutter_app/presentation/orders/utils/order_filter_mode.dart';
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
  var _filterOpened = false;

  var _currentFilterMode = OrderFilterMode.allOrders;

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
                    onTap: () {
                      setState(() {
                        _filterOpened = !_filterOpened;
                      });
                    },
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
      body: Stack(
        children: [
          _buildBody(),
          IgnorePointer(
            ignoring: !_filterOpened,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AnimatedOpacity(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 200),
                opacity: _filterOpened ? 1 : 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 49, sigmaY: 49),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: NXColors.quartenaryLightGrey.withOpacity(.18),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ГРУППИРОВАТЬ',
                            style: secondaryText16,
                          ),
                          const SizedBox(height: 8),
                          _buildRadioButton(
                            title: 'Все заказы',
                            mode: OrderFilterMode.allOrders,
                          ),
                          const SizedBox(height: 8),
                          _buildRadioButton(
                            title: 'По статусам',
                            mode: OrderFilterMode.byStatus,
                          ),
                          const SizedBox(height: 8),
                          _buildRadioButton(
                            title: 'По проектам',
                            mode: OrderFilterMode.byProject,
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton({
    required String title,
    required OrderFilterMode mode,
  }) {
    return BouncingButton(
      scaleBound: 0.02,
      onTap: () {
        setState(() {
          _currentFilterMode = mode;
          _filterOpened = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: NXColors.materialDark,
        ),
        child: Row(
          children: [
            _RadioButton(
              isSelected: mode == _currentFilterMode,
              onTap: () {},
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: primaryText16,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentSegmentedIndex) {
      case 0:
        return OrdersList(
          filterMode: _currentFilterMode,
        );
      default:
        return FinanceList();
    }
  }
}

class _RadioButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _RadioButton({
    Key? key,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: NXColors.fillDarkPrimary.withOpacity(.32),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: NXColors.thinMaterialDark.withOpacity(.45),
              shape: BoxShape.circle,
            ),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: isSelected ? 1 : 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: NXColors.orange,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
