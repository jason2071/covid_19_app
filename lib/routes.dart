import 'package:covid_19_app/pages/bottom_nav/bottom_nav_screen.dart';
import 'package:covid_19_app/pages/home/home_screen.dart';
import 'package:covid_19_app/pages/statistics/stats_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  BottomNavScreen.routeName: (context) => BottomNavScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  StatsScreen.routeName: (context) => StatsScreen(),
};
