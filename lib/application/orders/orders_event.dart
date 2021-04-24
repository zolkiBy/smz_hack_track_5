part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetOrders extends OrdersEvent {}
