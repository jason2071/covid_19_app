import 'package:flutter/material.dart';

class StatsTitle extends StatelessWidget {
  const StatsTitle({
    Key key,
    this.title,
    this.color = Colors.white,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
