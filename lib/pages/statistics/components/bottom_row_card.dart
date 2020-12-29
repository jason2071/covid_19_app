import 'package:covid_19_app/utils/format_decimal.dart';
import 'package:flutter/material.dart';

import 'stats_card.dart';

class BottomRowCard extends StatelessWidget {
  const BottomRowCard({
    Key key,
    @required this.recovered,
    @required this.hospitalized,
  }) : super(key: key);

  final int recovered, hospitalized;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          StatsCard(
            title: "Recovered",
            number: formatDecimal(recovered),
            color: Color(0xFF4CD97B),
          ),
          SizedBox(width: 16),
          StatsCard(
            title: "Hospitalized",
            number: formatDecimal(hospitalized),
            color: Color(0xFF9059FF),
          ),
        ],
      ),
    );
  }
}
