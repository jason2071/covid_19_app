import 'package:covid_19_app/pages/bottom_nav/bottom_nav_screen.dart';
import 'package:covid_19_app/routes.dart';
import 'package:covid_19_app/services/stats_service.dart';
import 'package:covid_19_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => StatsService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: BottomNavScreen.routeName,
      routes: routes,
    );
  }
}
