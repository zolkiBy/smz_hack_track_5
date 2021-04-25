import 'package:flutter/material.dart';
import 'package:flutter_app/application/orders/orders_bloc.dart';
import 'package:flutter_app/presentation/orders/utils/order_filter_mode.dart';
import 'package:flutter_app/presentation/orders/widgets/stacked_orders.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_container.dart';

class OrdersList extends StatelessWidget {
  final OrderFilterMode filterMode;

  const OrdersList({
    Key? key,
    required this.filterMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(NXColors.orange),
            ),
          );
        }
        if (state is OrdersFetched) {
          switch (filterMode) {
            case OrderFilterMode.allOrders:
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .add(EdgeInsets.only(bottom: 96)),
                  itemCount: state.orders.size,
                  itemBuilder: (context, index) {
                    final order = state.orders[index];
                    return OrderContainer(order: order);
                  });
            default:
              return StackedOrders(orders: state.orders.asList());
          }
        }
        return Container();
      },
    );
  }
}
