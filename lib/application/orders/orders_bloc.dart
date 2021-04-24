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

  static final _orders = KtList.of(
    Order(
      id: "0",
      number: 63276,
      title: 'Проектирование систем водоснабжения - ЖК',
      status: OrderStatus.finished,
      startDate: '28 фев 2021',
      price: 86654.24,
      contractor: User(id: '', name: 'Петров А.Н.'),
      responsible: User(id: '', name: 'Борисюк Андрей'),
    ),
    Order(
      id: '1',
      number: 64266,
      title: 'Корректировка решений РД',
      status: OrderStatus.finished,
      startDate: '03 мар 2021',
      price: 98000.00,
      contractor: User(id: '', name: 'Сергеенко В.П.'),
      responsible: User(id: '', name: 'Борисюк Андрей'),
    ),
    Order(
      id: '2',
      number: 64199,
      title: 'Наладка тех. оборудования',
      status: OrderStatus.inProgress,
      startDate: '03 мар 2021',
      price: 449000.00,
      contractor: User(id: '', name: 'Антонов В.П.'),
      responsible: User(id: '', name: 'Волчик Антон'),
    ),
    Order(
      id: '3',
      number: 65234,
      title: 'Наладка тех. оборудования',
      status: OrderStatus.pending,
      startDate: '05 мар 2021',
      price: 9000.00,
      contractor: User(id: '', name: 'Марчиков С.П.'),
      responsible: User(id: '', name: 'Волчик Антон'),
    ),
    Order(
      id: '4',
      number: 65237,
      title: 'Выкладка товара',
      status: OrderStatus.payed,
      startDate: '09 мар 2021',
      price: 3000.00,
      contractor: User(id: '', name: 'Андреев А.С.'),
      responsible: User(id: '', name: 'Черкасов Павел'),
    ),
  );

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
    yield OrdersFetched(orders: _orders);
  }
}
