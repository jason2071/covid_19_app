import 'package:covid_19_app/utils/format_decimal.dart';
import 'package:flutter/material.dart';

import 'stats_card.dart';

class TopRowCard extends StatelessWidget {
  const TopRowCard({
    Key key,
    @required this.confirmed,
    @required this.deaths,
  }) : super(key: key);

  final int confirmed, deaths;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          StatsCard(
            title: "Confirmed",
            number: formatDecimal(confirmed),
            color: Color(0xFFFFB259),
          ),
          SizedBox(width: 16),
          StatsCard(
            title: "Deaths",
            number: formatDecimal(deaths),
            color: Color(0xFFFF5959),
          ),
        ],
      ),
    );
  }
}
