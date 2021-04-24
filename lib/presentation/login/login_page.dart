import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/components/widgets/background.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/presentation/components/widgets/buttons.dart';
import 'package:flutter_app/presentation/pin/pin_page.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientedBackground(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(image: AssetImage('assets/images/logo.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'НАЙМИКС',
                      style: primaryTextBold18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Вход',
                          style: primaryTextBold34,
                        )
                      ],
                    ),
                  ),
                  TextFormField(
                    style: primaryTextBold16,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: NXColors.inputFieldFillColor,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(Constants.widgetBorderRadius)),
                      hintText: 'Введите логин',
                      hintStyle: secondaryTextSemiBold16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: TextFormField(
                      obscureText: true,
                      style: primaryTextBold16,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                        filled: true,
                        fillColor: NXColors.inputFieldFillColor,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Constants.widgetBorderRadius)),
                        hintText: 'Введите пароль',
                        hintStyle: secondaryTextSemiBold16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: BouncingButton(
                      child: FilledActionButton(
                        text: 'Забыли пароль',
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: BouncingButton(
                      scaleBound: 0.03,
                      child: GradientedActionButton(
                          text: 'Войти',
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (context) => PinPage()))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
