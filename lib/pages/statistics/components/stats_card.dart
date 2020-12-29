import 'package:flutter/material.dart';

import '../../../size_config.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key key,
    this.title,
    this.number,
    this.color,
    this.width,
  }) : super(key: key);

  final String title, number;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width : SizeConfig.screenWidth * 0.5 - 28,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            number,
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
