import 'package:equatable/equatable.dart';
import 'package:flutter_app/domain/orders/user.dart';

import 'order_status.dart';
export 'order_status.dart';

class Order extends Equatable {
  final String id;
  final int number;
  final String title;
  final OrderStatus status;
  final double price;
  final String startDate;
  final User contractor;
  final User? responsible;
  final String? description;

  const Order({
    required this.id,
    required this.number,
    required this.title,
    required this.status,
    required this.startDate,
    required this.price,
    required this.contractor,
    this.description,
    this.responsible,
  });

  factory Order.mock({User? responsible}) => Order(
        id: '1',
        number: 5265,
        title: 'Уборка после ремонта где-то там че-то там',
        status: OrderStatus.finished,
        price: 86654.24,
        startDate: '28 фев 2021',
        contractor: User(
          id: '1',
          name: 'Градиенко А.В.',
        ),
        responsible: responsible,
        description:
            'Требуется разработать эскизный проект и эскизную схему в соответствии со стандартом ГОСТ ЕН 13060-2011 для комплекса жилых помещенийТребуется разработать эскизный проект и эскизную схему в соответствии со стандартом ГОСТ ЕН 13060-2011 для комплекса жилых помещений',
      );

  @override
  List<Object?> get props => [id, number];
}
