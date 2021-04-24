import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/string_formatter.dart';
import 'package:flutter_app/utils/styles.dart';
import 'package:flutter_svg/svg.dart';

class FinanceList extends StatefulWidget {
  FinanceList({Key? key}) : super(key: key);

  @override
  _FinanceListState createState() => _FinanceListState();
}

class _FinanceListState extends State<FinanceList> {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
  };

  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Text(
                'Январь 2021 - Апрель 2021',
                style: secondaryText16,
              ),
            ),
            const SizedBox(height: 21),
            _buildPriceRow(title: 'Расходы', price: 35540700),
            const SizedBox(height: 16),
            _buildPriceRow(title: 'Сумма размещенных заказов', price: 1180100),
            const SizedBox(height: 24),
            Text(
              'ПО ПРОЕКТАМ',
              style: secondaryText16,
            ),
            const SizedBox(height: 16),
            _buildPieProjectDescription(
              title: 'Центральный офис',
              price: 1483010,
              pieColor: NXColors.chartBlue,
            ),
            const SizedBox(height: 8),
            _buildPieProjectDescription(
              title: 'Юр. консультации',
              price: 902880,
              pieColor: NXColors.greenGradientStart,
            ),
            const SizedBox(height: 8),
            _buildPieProjectDescription(
              title: 'Ит-проекты',
              price: 430575,
              pieColor: NXColors.orange,
            ),
            _buildPieChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
            pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
              setState(() {
                final desiredTouch =
                    pieTouchResponse.touchInput is! PointerExitEvent &&
                        pieTouchResponse.touchInput is! PointerUpEvent;
                if (desiredTouch && pieTouchResponse.touchedSection != null) {
                  touchedIndex =
                      pieTouchResponse.touchedSection?.touchedSectionIndex;
                } else {
                  touchedIndex = -1;
                }
              });
            }),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 8,
            centerSpaceRadius: 50,
            sections: showingSections()),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double radius = isTouched ? 62 : 60;
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: NXColors.chartBlue,
              value: 52.7,
              title: '52.7%',
              radius: radius,
              titlePositionPercentageOffset: 1.6,
              titleStyle: primaryText16);
        case 1:
          return PieChartSectionData(
            color: NXColors.greenGradientStart,
            value: 32.1,
            titlePositionPercentageOffset: 1.6,
            title: '32.1%',
            radius: radius,
            titleStyle: primaryText16,
          );
        case 2:
          return PieChartSectionData(
            color: NXColors.orange,
            value: 15.3,
            title: '15.3%',
            titlePositionPercentageOffset: 1.6,
            radius: radius,
            titleStyle: primaryText16,
          );
        default:
          return PieChartSectionData();
      }
    });
  }

  Widget _buildPriceRow({
    required String title,
    required double price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: primaryText13,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                numberWithSpaces(price),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/icons/rub.svg',
                width: 22,
                height: 22,
                color: Colors.white,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPieProjectDescription({
    required String title,
    required double price,
    required Color pieColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: primaryText16,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                numberWithSpaces(price),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/icons/rub.svg',
                width: 22,
                height: 22,
                color: pieColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
