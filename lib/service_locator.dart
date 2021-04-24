import 'package:flutter_app/application/orders/orders_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<OrdersBloc>(() => OrdersBloc());
}
