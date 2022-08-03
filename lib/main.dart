import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import 'core/navigators/home_nav/home_navigator.dart';
import 'core/navigators/profile_nav/profile_navigator.dart';
import 'core/navigators/search_nav/search_navigator.dart';
import 'core/utils/constants.dart';
import 'core/utils/common.dart';
import 'features/authenticated/presentation/screens/additional_screen/coming_soon_screen .dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Signika",
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: MainPage(),
      );
    });
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xFF91C788),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: "Home",
                icon: SvgPicture.asset(AssetConstant.icon + "botnav/home.svg"),
                activeIcon: SvgPicture.asset(
                    AssetConstant.icon + "botnav/selected_home.svg")),
            BottomNavigationBarItem(
                label: "Search",
                icon:
                    SvgPicture.asset(AssetConstant.icon + "botnav/search.svg"),
                activeIcon: SvgPicture.asset(
                    AssetConstant.icon + "botnav/selected_search.svg")),
            BottomNavigationBarItem(
                label: "Scan",
                icon:
                    SvgPicture.asset(AssetConstant.icon + "botnav/camera.svg"),
                activeIcon: SvgPicture.asset(
                    AssetConstant.icon + "botnav/selected_camera.svg")),
            BottomNavigationBarItem(
                label: "Favorite",
                icon: SvgPicture.asset(
                    AssetConstant.icon + "botnav/favorite.svg"),
                activeIcon: SvgPicture.asset(
                    AssetConstant.icon + "botnav/selected_favorite.svg")),
            BottomNavigationBarItem(
                label: "Profile",
                icon:
                    SvgPicture.asset(AssetConstant.icon + "botnav/profile.svg"),
                activeIcon: SvgPicture.asset(
                    AssetConstant.icon + "botnav/selected_profile.svg"))
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            HomeNavigator(),
            SearchNavigator(),
            const ComingSoonScreen(),
            const ComingSoonScreen(),
            ProfileNavigator(),
          ],
        ),
      ),
    );
  }
}
