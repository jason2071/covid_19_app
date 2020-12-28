import 'package:covid_19_app/pages/home/home_screen.dart';
import 'package:covid_19_app/pages/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  StatisticsScreen.routeName: (context) => StatisticsScreen(),
};
