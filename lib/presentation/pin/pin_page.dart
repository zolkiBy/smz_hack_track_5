import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/components/widgets/background.dart';
import 'package:flutter_app/presentation/components/widgets/bouncing_button.dart';
import 'package:flutter_app/presentation/components/widgets/buttons.dart';
import 'package:flutter_app/presentation/components/widgets/pin.dart';
import 'package:flutter_app/presentation/tab_bar/tab_bar_page.dart';
import 'package:flutter_app/utils/nx_colors.dart';
import 'package:flutter_app/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PinPage extends StatefulWidget {
  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  var _biometricEnabled = false;
  var _pin = '';

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientedBackground(
        child: Scaffold(
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              padding: EdgeInsets.only(
                top: 84.0,
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Column(children: [
                Text(
                  'Создайте PIN код',
                  style: primaryTextBold28,
                ),
                const SizedBox(height: 37),
                Pin(
                  onChanged: (pin) {
                    if (_scrollController.offset != _scrollController.position.maxScrollExtent) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.linear,
                      );
                    }
                    setState(() {
                      _pin = pin;
                    });
                  },
                ),
                const SizedBox(height: 64),
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(top: 32.0),
                  decoration: BoxDecoration(
                    color: NXColors.bgWidgets,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 0,
                        child: SvgPicture.asset(
                          'assets/icons/biometric.svg',
                          width: 32.0,
                          height: 32.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Разрешить вход с помощью биометрии',
                          style: secondaryTextSemiBold15,
                        ),
                      ),
                      Expanded(
                        child: CupertinoSwitch(
                          activeColor: NXColors.orange,
                          value: _biometricEnabled,
                          onChanged: (isEnabled) {
                            setState(() {
                              _biometricEnabled = isEnabled;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: BouncingButton(
                    scaleBound: 0.02,
                    child: GradientedActionButton(
                        disabled: _pin.length != 4,
                        text: 'Продолжить',
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (context) => TabBarPage()))),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
