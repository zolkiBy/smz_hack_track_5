import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/domain/orders/order.dart';
import 'package:flutter_app/domain/orders/user.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitial());

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    if (event is GetOrders) {
      yield* _mapGetOrdersEvent();
    }
  }

  Stream<OrdersState> _mapGetOrdersEvent() async* {
    yield OrdersLoading();
    await Future.delayed(Duration(milliseconds: 300));
    final orders = KtList.from([
      Order.mock(),
      Order.mock(
          responsible: User(
        id: '1',
        name: 'Ельцин Б.Н.',
      )),
      Order.mock(),
      Order.mock(),
      Order.mock(
          responsible: User(
        id: '1',
        name: 'Ельцин Б.Н.',
      )),
      Order.mock(),
      Order.mock(),
      Order.mock(
          responsible: User(
        id: '1',
        name: 'Ельцин Б.Н.',
      )),
      Order.mock(),
    ]);
    yield OrdersFetched(orders: orders);
  }
}
