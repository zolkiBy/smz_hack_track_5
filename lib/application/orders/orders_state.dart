part of 'orders_bloc.dart';

@immutable
abstract class OrdersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersFetched extends OrdersState {
  final KtList<Order> orders;

  OrdersFetched({required this.orders});

  @override
  List<Object?> get props => [orders];
}
