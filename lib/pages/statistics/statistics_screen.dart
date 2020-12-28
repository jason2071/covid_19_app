import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  static const routeName = '/statistics_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("statistics"),
      ),
      body: Center(
        child: Text(
          'this is the statistics screen.',
        ),
      ),
    );
  }
}
