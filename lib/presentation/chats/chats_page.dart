import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/presentation/components/widgets/nx_app_bar.dart';
import 'package:flutter_app/presentation/components/widgets/nx_icon_button.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';

class ChatsPage extends StatefulWidget {
  ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final chats = [
    '№64294 Выкладка товара ТЦ Колумбус',
    '№64291 Выкладка товара ТЦ Колумбус',
    '№63276 - Проектирование систем водоснабжения - ЖК',
    '№64266 Корректировка решений РД',
    '№64199 Наладка тех. оборудования ',
    '№62161 Разработка мобильного приложения'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NXAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Чаты',
              style: primaryText28,
            ),
            BouncingButton(
              child: NXIconButton(
                svgName: 'plus',
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return BouncingButton(
              scaleBound: 0.02,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: NXColors.darkGreyOpacity18,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  chats[index],
                  style: primaryText16,
                ),
              ),
            );
          }),
    );
  }
}
