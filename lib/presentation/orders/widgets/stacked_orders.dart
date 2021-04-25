import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/orders/order.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/presentation/orders/widgets/order_container.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/string_formatter.dart';
import 'package:flutter_app/utils/styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class StackedOrders extends StatefulWidget {
  final List<Order> orders;

  StackedOrders({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  _StackedOrdersState createState() => _StackedOrdersState();
}

class _StackedOrdersState extends State<StackedOrders> {
  Map<OrderStatus, List<Order>> ordersByStatus = {};
  Map<OrderStatus, bool> ordersExpanded = {
    OrderStatus.inProgress: false,
    OrderStatus.pending: false,
    OrderStatus.finished: false,
    OrderStatus.payed: false,
  };

  @override
  void initState() {
    super.initState();

    final inProgressOrders = widget.orders
        .where((order) => order.status == OrderStatus.inProgress)
        .toList();

    final pendingOrders = widget.orders
        .where((order) => order.status == OrderStatus.pending)
        .toList();

    final finishedOrders = widget.orders
        .where((order) => order.status == OrderStatus.finished)
        .toList();

    final paidOrders = widget.orders
        .where((order) => order.status == OrderStatus.payed)
        .toList();

    setState(() {
      if (inProgressOrders.isNotEmpty) {
        ordersByStatus[OrderStatus.inProgress] = inProgressOrders;
      }
      if (pendingOrders.isNotEmpty) {
        ordersByStatus[OrderStatus.pending] = pendingOrders;
      }
      if (finishedOrders.isNotEmpty) {
        ordersByStatus[OrderStatus.finished] = finishedOrders;
      }
      if (paidOrders.isNotEmpty) {
        ordersByStatus[OrderStatus.payed] = paidOrders;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 100, top: 16),
      itemCount: ordersByStatus.keys.length,
      itemBuilder: (context, index) {
        final statusByIndex = ordersByStatus.keys.toList()[index];
        final orders = ordersByStatus[statusByIndex]!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatus(order: orders.first),
                  Visibility(
                    visible: ordersExpanded[statusByIndex]!,
                    child: BouncingButton(
                      scaleBound: 0.03,
                      onTap: () {
                        setState(() {
                          ordersExpanded[statusByIndex] = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: NXColors.darkGreyOpacity18,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          CupertinoIcons.chevron_up,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ordersExpanded[orders.first.status] =
                      !ordersExpanded[orders.first.status]!;
                });
              },
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 0),
                opacity: !ordersExpanded[statusByIndex]! ? 1 : 0,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: !ordersExpanded[statusByIndex]! ? null : 0,
                    child: _buildStack(orders)),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: ordersExpanded[statusByIndex]! ? null : 0,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orders.length,
                  itemBuilder: (contex, index) {
                    final order = orders[index];
                    return OrderContainer(order: order);
                  }),
            )
          ],
        );
      },
    );
  }

  Slidable _buildStack(List<Order> orders) {
    return Slidable(
      secondaryActions: [
        BouncingButton(
          scaleBound: 0.02,
          onTap: () {
            setState(() {
              ordersExpanded[orders.first.status] =
                  !ordersExpanded[orders.first.status]!;
            });
          },
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
                'Оплатить\n все заказы',
                style: primaryText18,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
      actionExtentRatio: 0.5,
      actionPane: SlidableScrollActionPane(),
      child: BouncingButton(
        scaleBound: 0.02,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              right: 32,
              left: 32,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: NXColors.primaryDark.withOpacity(0.36),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Positioned(
              right: 16,
              left: 16,
              bottom: 8,
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: NXColors.primaryDark.withOpacity(0.62),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: StackOrderContainer(
                ordersCount: orders.length,
                ordersPriceSum: _getSum(orders: orders),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getSum({required List<Order> orders}) {
    double sum = 0;
    widget.orders.forEach((order) {
      sum += order.price;
    });
    return sum;
  }
}

Widget _buildStatus({required Order order}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: order.status.iconColor,
        ),
        child: order.status.icon,
      ),
      const SizedBox(width: 4),
      Text(
        order.status.name.toUpperCase(),
        style: secondaryText16,
      )
    ],
  );
}

class StackOrderContainer extends StatelessWidget {
  final int ordersCount;
  final double ordersPriceSum;
  final double opacity;

  const StackOrderContainer({
    Key? key,
    required this.ordersCount,
    required this.ordersPriceSum,
    this.opacity = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: NXColors.primaryDark.withOpacity(opacity),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$ordersCount заказов',
            style: primaryText16,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Сумма всех заказов',
                style: primaryText13.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              _buildPrice(price: ordersPriceSum),
            ],
          ),
        ],
      ),
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
