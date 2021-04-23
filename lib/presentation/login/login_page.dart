import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/components/widgets/background.dart';
import 'package:flutter_app/presentation/components/widgets/buttons.dart';
import 'package:flutter_app/presentation/components/widgets/styles.dart';
import 'package:flutter_app/utils/nx_colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientedBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image(image: AssetImage('assets/images/logo.png')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'НАЙМИКС',
                    style: primaryText18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/icons/emoji_monocle.png'),
                    ),
                    Text(
                      'Вход',
                      style: primaryText34,
                    )
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: NXColors.inputFieldFillColor,
                    border: OutlineInputBorder(),
                    hintText: 'Введите логин',
                    hintStyle: secondaryText16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: NXColors.inputFieldFillColor,
                      border: OutlineInputBorder(),
                      hintText: 'Введите пароль',
                      hintStyle: secondaryText16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                  child: FilledActionButton(text: 'Забыли пароль', onPressed: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GradientedActionButton(text: 'Войти', onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
