import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ChartData extends StatelessWidget {
  const ChartData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.35,
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
                leftTitles: SideTitles(
                  margin: 20,
                  showTitles: true,
                  reservedSize: 0,
                  getTextStyles: (value) => TextStyle(color: kSecondaryColor),
                  getTitles: (value) {
                    if (value == 0) {
                      return '0';
                    } else if (value % 3 == 0) {
                      return '${value ~/ 3 * 3}';
                    }
                    return '';
                  },
                ),
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
    List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
    List<BarChartGroupData> barChartGroups = [];
    barChartDatas.asMap().forEach(
          (i, value) => barChartGroups.add(
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  y: value,
                  colors: [Color(0xFFFF5959)],
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
