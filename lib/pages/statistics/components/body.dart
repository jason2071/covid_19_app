import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'chart_data.dart';
import 'stats_card.dart';
import 'stats_title.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> _tabsCountry = ['My Country', 'Global'];
  List<String> _tabsDay = ['Total', 'Today', 'Yesterday'];

  int _tabsCountryIndex = 0;
  int _tabsDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatsTitle(title: "Statistics"),
            _buildCountryTab(),
            _buildDayTab(),
            _buildTopRowCard(),
            _buildBottomRowCard(),
            ChartData(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomRowCard() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          StatsCard(
            title: "Recovered",
            number: "17,977",
            color: Color(0xFF4CD97B),
            width: SizeConfig.screenWidth * 0.315 - 17,
          ),
          SizedBox(width: 16),
          StatsCard(
            title: "Active",
            number: "301,251",
            color: Color(0xFF4DB5FF),
            width: SizeConfig.screenWidth * 0.315 - 17,
          ),
          SizedBox(width: 16),
          StatsCard(
            title: "8,702",
            number: "9,620",
            color: Color(0xFF9059FF),
            width: SizeConfig.screenWidth * 0.315 - 17,
          ),
        ],
      ),
    );
  }

  Widget _buildTopRowCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          StatsCard(
            title: "Affected",
            number: "336,851",
            color: Color(0xFFFFB259),
          ),
          SizedBox(width: 16),
          StatsCard(
            title: "Death",
            number: "9,620",
            color: Color(0xFFFF5959),
          ),
        ],
      ),
    );
  }

  Widget _buildDayTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelStyle: TextStyle(fontSize: 16),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: [
            ...List.generate(
              _tabsDay.length,
              (index) => Text(
                _tabsDay[index],
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _tabsDayIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildCountryTab() {
    return DefaultTabController(
      length: 2,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TabBar(
          indicator: BubbleTabIndicator(
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            indicatorHeight: 40.0,
            indicatorColor: Colors.white,
          ),
          labelStyle: TextStyle(fontSize: 16),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: [
            ...List.generate(
              _tabsCountry.length,
              (index) => Text(
                _tabsCountry[index],
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _tabsCountryIndex = index;
            });
          },
        ),
      ),
    );
  }
}
