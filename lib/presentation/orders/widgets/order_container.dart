import 'package:flutter/material.dart';
import 'package:flutter_app/domain/orders/order.dart';
import 'package:flutter_app/presentation/components/widgets/styles.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
          decoration: BoxDecoration(
            color: NXColors.fillDarkPrimary.withOpacity(.38),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Icon(Icons.share),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
          decoration: BoxDecoration(
            color: NXColors.fillDarkPrimary.withOpacity(.38),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Icon(Icons.share),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
          decoration: BoxDecoration(
            color: NXColors.fillDarkPrimary.withOpacity(.38),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Icon(Icons.share),
          ),
        ),
      ],
      secondaryActions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          // padding: const EdgeInsets.symmetric(horizontal: 27),
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
      ],
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
          price.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: NXColors.lightGrey.withOpacity(0.6),
          ),
        )
      ],
    );
  }
}