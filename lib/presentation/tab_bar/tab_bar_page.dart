import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/application/orders/orders_bloc.dart';
import 'package:flutter_app/presentation/components/widgets/background.dart';
import 'package:flutter_app/presentation/orders/pages/orders_page.dart';
import 'package:flutter_app/presentation/tab_bar/widgets/nx_tab_bar.dart';
import 'package:flutter_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  final tabItems = [
    'assets/icons/home.svg',
    'assets/icons/work.svg',
    'assets/icons/settings.svg',
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrdersBloc>(
            create: (context) => getIt()..add(GetOrders())),
      ],
      child: GradientedBackground(
        child: Scaffold(
          body: Stack(
            children: [
              const OrdersPage(),
              Align(
                alignment: Alignment.bottomCenter,
                child: NXTabBar(
                  items: tabItems,
                  onChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
