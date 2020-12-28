import 'package:covid_19_app/pages/bottom_nav/bottom_nav_screen.dart';
import 'package:covid_19_app/routes.dart';
import 'package:covid_19_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
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
