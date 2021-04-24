import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/domain/orders/order.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/string_formatter.dart';
import 'package:flutter_app/utils/styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'nx_slide_action.dart';
import 'order_detailed_bottom_sheet.dart';

class OrderContainer extends StatelessWidget {
  final Order order;

  const OrderContainer({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      actionExtentRatio: 0.5,
      secondaryActions: [
        BouncingButton(
          scaleBound: 0.02,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            width: 108,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(colors: [
                  NXColors.orangeGradientStart,
                  NXColors.orangeGradientEnd,
                ])),
            child: Center(
              child: Text(
                'Оплатить',
                style: primaryText18,
              ),
            ),
          ),
        ),
      ],
      child: GestureDetector(
        child: BouncingButton(
          scaleBound: 0.02,
          onTap: () {
            showMaterialModalBottomSheet(
              animationCurve: Curves.easeInOut,
              context: context,
              backgroundColor: Colors.black.withOpacity(0.03),
              expand: true,
              builder: (context) => OrderDetailedBottomSheet(
                order: order,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: NXColors.darkGrey.withOpacity(0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  '№${order.number} – ${order.title}',
                  style: primaryText18,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatus(),
                    _buildPrice(price: order.price),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatus() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                NXColors.greenGradientStart,
                NXColors.greenGradientEnd,
              ])),
          child: Icon(
            Icons.check,
            color: NXColors.backgroundBlack,
            size: 16,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          'Выполнено',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildPrice({required double price}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          numberWithSpaces(price),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          'assets/icons/rub.svg',
          width: 22,
          height: 22,
          color: Colors.white,
        )
      ],
    );
  }
}
