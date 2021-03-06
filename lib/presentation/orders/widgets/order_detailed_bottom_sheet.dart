import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/domain/orders/order.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/presentation/components/widgets/buttons.dart';
import 'package:flutter_app/presentation/orders/widgets/pay_confirmation_bottom_sheet.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/string_formatter.dart';
import 'package:flutter_app/utils/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OrderDetailedBottomSheet extends StatelessWidget {
  final Order order;

  const OrderDetailedBottomSheet({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 44, sigmaY: 44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: NXColors.lightGrey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  '???${order.number} ??? ${order.title}',
                  style: primaryTextSemiBold17,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatus(),
                    _buildPrice(price: order.price),
                  ],
                ),
                _buildDivider(),
                _buildContractor(),
                _buildDivider(),
                _buildResponsible(),
                Visibility(
                  visible: order.description == null,
                  child: const SizedBox(height: 16),
                ),
                _buildDescription(),
                _buildActions(),
                const SizedBox(height: 16),
                Visibility(
                  visible: order.status != OrderStatus.payed,
                  child: BouncingButton(
                    scaleBound: 0.02,
                    child: GradientedActionButton(
                      text: '????????????????',
                      onPressed: () {
                        showMaterialModalBottomSheet(
                            animationCurve: Curves.easeInOut,
                            context: context,
                            backgroundColor: Colors.black.withOpacity(0.03),
                            expand: true,
                            builder: (context) => PayConfirmationBottomSheet()).then((value) {
                          if (value == true) {
                            Navigator.of(context).pop();
                          }
                        });
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: order.status == OrderStatus.payed,
                  child: BouncingButton(
                    scaleBound: 0.02,
                    child: ActionButton(
                      color: NXColors.materialDark.withOpacity(.45),
                      text: '??????????????',
                      textStyle: primaryTextSemiBold17.copyWith(color: NXColors.orange),
                      disabled: true,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDescription() {
    if (order.description == null || order.description!.isEmpty) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Text(
                order.description ?? "",
                style: secondaryTextRegular15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAction(svgName: 'share', title: '??????'),
        const SizedBox(width: 8),
        _buildAction(svgName: 'message', title: '??????'),
        const SizedBox(width: 8),
        _buildAction(svgName: 'disput', title: '????????'),
      ],
    );
  }

  Widget _buildAction({
    required String svgName,
    required String title,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: BouncingButton(
          scaleBound: 0.03,
          child: Container(
            height: 54,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: NXColors.darkGrey.withOpacity(0.18)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/$svgName.svg',
                    width: 21,
                    height: 21,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: primaryTextSemiBold17,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        Divider(
          color: NXColors.separatorDarkGrey.withOpacity(.65),
          thickness: 0.5,
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildResponsible() {
    if (order.responsible == null) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          '??????????????????????????',
          style: secondaryTextRegular13,
        ),
        const SizedBox(height: 4),
        Text(
          order.responsible!.name,
          style: primaryTextSemiBold15,
        ),
        Visibility(
          visible: order.description == null,
          child: const SizedBox(height: 16),
        ),
        Visibility(visible: order.description != null, child: _buildDivider())
      ],
    );
  }

  Widget _buildContractor() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '??????????',
              style: secondaryTextRegular13,
            ),
            const SizedBox(height: 4),
            Text(
              order.startDate,
              style: primaryTextSemiBold15,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '??????????????????????',
              style: secondaryTextRegular13,
            ),
            const SizedBox(height: 4),
            Text(
              order.contractor.name,
              style: primaryTextSemiBold15,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildStatus() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: order.status.iconColor,
          ),
          child: order.status.icon,
        ),
        const SizedBox(width: 4),
        Text(
          order.status.name,
          style: primaryTextMedium12,
        )
      ],
    );
  }

  Widget _buildPrice({required double price}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          numberWithSpaces(price),
          style: primaryTextSemiBold22,
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          'assets/icons/rub.svg',
          width: 22,
          height: 22,
          color: Colors.white,
        )
      ],
    );
  }
}
