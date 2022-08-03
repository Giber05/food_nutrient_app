import 'package:FoodNutrient/features/authenticated/presentation/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileNavigator extends StatefulWidget {
  @override
  _ProfileNavigatorState createState() => _ProfileNavigatorState();
}

class _ProfileNavigatorState extends State<ProfileNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return ProfileScreen();
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
