import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';

enum OrderStatus { inProgress, pending, finished, payed }

extension OrderStatusExt on OrderStatus {
  static const _iconColors = {
    OrderStatus.inProgress: NXColors.orderStatusInProgress,
    OrderStatus.pending: NXColors.orderStatusPending,
    OrderStatus.finished: NXColors.orderStatusFinished,
    OrderStatus.payed: NXColors.orderStatusPayed,
  };

  static const _names = {
    OrderStatus.inProgress: 'В работе',
    OrderStatus.pending: 'Ждут отклика',
    OrderStatus.finished: 'Выполнен',
    OrderStatus.payed: 'Оплачен',
  };

  static const _icons = {
    OrderStatus.inProgress: null,
    OrderStatus.pending: null,
    OrderStatus.finished: const Icon(Icons.check, color: NXColors.backgroundBlack, size: 16),
    OrderStatus.payed: const Icon(Icons.check, color: NXColors.backgroundBlack, size: 16),
  };

  Color get iconColor => _iconColors[this] ?? NXColors.orderStatusDefault;

  String get name => _names[this] ?? "";

  Icon? get icon => _icons[this];
}
