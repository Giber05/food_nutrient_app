import 'package:flutter/material.dart';

import '../../screens/search_screen/search_screen.dart';


class SearchNavigator extends StatefulWidget {
  @override
  _SearchNavigatorState createState() => _SearchNavigatorState();
}

class _SearchNavigatorState extends State<SearchNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return SearchScreen();
                // case '/foodsByCategory':
                // return FoodsByCategoryScreen(categoryId: categoryId);
                default:
                  return const SizedBox();
              }
            });
      },
    );
  }
}
