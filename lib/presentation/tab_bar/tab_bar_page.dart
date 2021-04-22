import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/orders/pages/orders_page.dart';
import 'package:flutter_app/presentation/tab_bar/widgets/nx_tab_bar.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  final tabItems = [
    Icons.book,
    Icons.person,
    Icons.message,
  ];

  final _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1B120E),
        gradient: RadialGradient(
          center: Alignment(-1, 1),
          radius: 1.3,
          colors: [
            Color(0xffFF5C00).withOpacity(0.15),
            Color(0xffFF3D00).withOpacity(0.02),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.7,
            center: Alignment(0.4, -0.3),
            colors: [
              Color(0xffFFA803).withOpacity(0.15),
              Color(0xffFF7628).withOpacity(0.05),
            ],
          ),
        ),
        child: Scaffold(
          body: Stack(
            children: [
              const OrdersPage(),
              Align(
                alignment: Alignment.bottomCenter,
                child: NXTabBar(
                  items: tabItems,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
