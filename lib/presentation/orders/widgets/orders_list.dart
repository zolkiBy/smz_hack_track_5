import 'package:flutter/material.dart';
import 'package:flutter_app/application/orders/orders_bloc.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_container.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({Key? key}) : super(key: key);

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
          return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.orders.size,
              itemBuilder: (context, index) {
                final order = state.orders[index];
                return OrderContainer(order: order);
              });
        }
        return Container();
      },
    );
  }
}
