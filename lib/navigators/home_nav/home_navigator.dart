import 'package:flutter/material.dart';

import '../../screens/homescreen/homescreen.dart';


class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return HomeScreen();
                // case '/foodsByCategory':
                // return FoodsByCategoryScreen(categoryId: categoryId);
                default:
                  return CircularProgressIndicator();
              }
            });
      },
    );
  }
}
