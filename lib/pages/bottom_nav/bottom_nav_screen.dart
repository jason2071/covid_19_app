import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/pages/home/home_screen.dart';
import 'package:covid_19_app/pages/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/bottom_nav_screen';

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List _screens = [
    HomeScreen(),
    StatisticsScreen(),
    Scaffold(),
    Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [
          "assets/icons/icon_round_home.svg",
          "assets/icons/icon_gridicons_stats.svg",
          "assets/icons/icon_newspaper.svg",
          "assets/icons/icon_ant_design_info_circle_filled.svg"
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: SvgPicture.asset(
                        value,
                        color: _currentIndex == key
                            ? Colors.white
                            : kSecondaryColor,
                      ),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
