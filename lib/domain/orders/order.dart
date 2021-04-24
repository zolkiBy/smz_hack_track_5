import 'package:equatable/equatable.dart';

import 'order_status.dart';
export 'order_status.dart';

class Order extends Equatable {
  final String id;
  final int number;
  final String title;
  final OrderStatus status;
  final double price;

  Order({
    required this.id,
    required this.number,
    required this.title,
    required this.status,
    required this.price,
  });

  factory Order.mock() => Order(
        id: '1',
        number: 5265,
        title: 'Уборка после ремонта где-то там че-то там',
        status: OrderStatus.done,
        price: 86654.24,
      );

  @override
  List<Object?> get props => [id, number];
}
