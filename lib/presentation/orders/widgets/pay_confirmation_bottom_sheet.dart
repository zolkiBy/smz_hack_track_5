import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/components/widgets/buttons.dart';
import 'package:flutter_app/presentation/orders/widgets/pay_success_bottom_sheet.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PayConfirmationBottomSheet extends StatelessWidget {
  const PayConfirmationBottomSheet({Key? key}) : super(key: key);

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
                    'Внимание',
                    style: primaryTextSemiBold16,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Вы уверены, что хотите совершить оплату?',
                    style: primaryTextRegular13,
                  ),
                ),
                const SizedBox(height: 32),
                ActionButton(
                  text: 'Да, оплатить',
                  color: NXColors.systemGrey6,
                  textStyle: primaryTextSemiBold17.copyWith(
                    color: NXColors.orange,
                  ),
                  onPressed: () {
                    showMaterialModalBottomSheet(
                        animationCurve: Curves.easeInOut,
                        context: context,
                        backgroundColor: Colors.black.withOpacity(0.03),
                        expand: true,
                        builder: (context) => PaySuccessBottomSheet()).then((value) => Navigator.of(context).pop(true)); // is paid
                  },
                ),
                const SizedBox(height: 16),
                ActionButton(
                  text: 'Отмена',
                  color: NXColors.systemGrey6,
                  textStyle: secondaryTextSemiBold17,
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
