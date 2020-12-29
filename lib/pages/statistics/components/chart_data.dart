import 'package:covid_19_app/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'stats_title.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          StatsTitle(
            title: "Daily New Cases",
            color: Colors.black,
          ),
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.screenHeight * 0.25,
              child: BarChart(
                BarChartData(
                  barGroups: getBarGroups(),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: false,
                        margin: 20,
                        reservedSize: 0,
                        getTextStyles: (value) =>
                            TextStyle(color: kSecondaryColor),
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
          ),
        ],
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
                  colors:
                      i == barChartDatas.length - 1 ? [kPrimaryColor] : [color],
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
