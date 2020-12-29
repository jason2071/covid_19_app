import 'package:covid_19_app/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ChartData extends StatelessWidget {
  const ChartData({
    Key key,
    @required this.value,
    this.color = kPrimaryColor,
  }) : super(key: key);

  final List<double> value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
        width: SizeConfig.screenWidth * 0.85,
        padding: EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 10),
        child: BarChart(
          BarChartData(
            barGroups: getBarGroups(),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
                leftTitles: SideTitles(showTitles: false),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: getWeek,
                  getTextStyles: (_) => TextStyle(
                    color: Color(0xFF7589A2),
                    fontSize: 10,
                    fontWeight: FontWeight.w200,
                  ),
                )),
          ),
        ),
      ),
    );
  }

  getBarGroups() {
    List<double> barChartDatas = value;
    List<BarChartGroupData> barChartGroups = [];
    barChartDatas.asMap().forEach(
          (i, value) => barChartGroups.add(
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  y: value,
                  colors: [color],
                  width: 10,
                )
              ],
            ),
          ),
        );
    return barChartGroups;
  }

  String getWeek(double value) {
    switch (value.toInt()) {
      case 0:
        return 'MON';
      case 1:
        return 'TUE';
      case 2:
        return 'WED';
      case 3:
        return 'THU';
      case 4:
        return 'FRI';
      case 5:
        return 'SAT';
      case 6:
        return 'SUN';
      default:
        return '';
    }
  }
}
