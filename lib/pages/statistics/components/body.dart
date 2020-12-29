import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/models/api_response.dart';
import 'package:covid_19_app/models/display_stats_args.dart';
import 'package:covid_19_app/models/timeline_model.dart';
import 'package:covid_19_app/models/today_model.dart';
import 'package:covid_19_app/services/stats_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bottom_row_card.dart';
import 'chart_data.dart';
import 'stats_title.dart';
import 'top_row_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  StatsService get service => GetIt.I<StatsService>();
  APIResponse<TodayModel> _apiResponse;
  APIResponse<TimelineModel> _apiResponseTimeline;
  bool _isLoading = false;

  List<String> _tabs = ['Total', 'Today', 'Yesterday'];
  int _currentIndex = 0;

  @override
  void initState() {
    if (todayModel == null) {
      _fetchData();
    }

    super.initState();
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getTodayData();
    todayModel = _apiResponse.data;

    _apiResponseTimeline = await service.getTimelineData();
    timelineModel = _apiResponseTimeline.data;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _renderDisplay();

    return AnimatedSwitcher(
      duration: kAnimationDuration,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            )
          : SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatsTitle(title: "Statistics"),
                    _buildCountryTab(),
                    TopRowCard(
                      confirmed: displayStatsArgs.confirmed,
                      deaths: displayStatsArgs.deaths,
                    ),
                    BottomRowCard(
                      recovered: displayStatsArgs.recovered,
                      hospitalized: displayStatsArgs.hospitalized,
                    ),
                    ChartData(),
                  ],
                ),
              ),
            ),
    );
  }

  void _renderDisplay() {
    if (todayModel != null) {
      if (_currentIndex == 0) {
        displayStatsArgs = DisplayStatsArgs(
          confirmed: _apiResponse.data.confirmed,
          recovered: _apiResponse.data.recovered,
          hospitalized: _apiResponse.data.hospitalized,
          deaths: _apiResponse.data.deaths,
        );
      } else if (_currentIndex == 1) {
        displayStatsArgs = DisplayStatsArgs(
          confirmed: _apiResponse.data.newConfirmed,
          recovered: _apiResponse.data.newRecovered,
          hospitalized: _apiResponse.data.newHospitalized,
          deaths: _apiResponse.data.newDeaths,
        );
      } else {
        if (timelineModel != null) {
          TimelineData items =
              timelineModel.data[timelineModel.data.length - 1];

          displayStatsArgs = DisplayStatsArgs(
            confirmed: items.confirmed,
            recovered: items.recovered,
            hospitalized: items.hospitalized,
            deaths: items.deaths,
          );
        }
      }
    }
  }

  Widget _buildCountryTab() {
    return DefaultTabController(
      length: 3,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
              _tabs.length,
              (index) => Text(
                _tabs[index],
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
