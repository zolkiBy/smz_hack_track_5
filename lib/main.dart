import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login/login_page.dart';
import 'package:flutter_app/service_locator.dart';
import 'package:flutter_app/utils/nx_colors.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: NXColors.backgroundBlack,
        primaryColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
