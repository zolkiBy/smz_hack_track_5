import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/components/widgets/buttons.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';

class PaySuccessBottomSheet extends StatelessWidget {
  const PaySuccessBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 44, sigmaY: 44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.59),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Успешно',
                    style: primaryText16,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Исполнитель получит оплату в течение следующего рабочего дня',
                    style: primaryText13,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                ActionButton(
                  text: 'Закрыть',
                  color: NXColors.systemGrey6,
                  textStyle: primaryText16.copyWith(
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
