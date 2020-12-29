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

enum StatsTypes { confirmed, recovered, hospitalized, deaths }

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  StatsService get service => GetIt.I<StatsService>();
  APIResponse<TodayModel> _apiResponse;
  APIResponse<TimelineModel> _apiResponseTimeline;
  bool _isLoading = false;

  TodayModel todayModel;
  TimelineModel timelineModel;

  List<String> _tabs = ['Total', 'Today', 'Yesterday'];
  int _currentIndex = 0;
  StatsTypes _type = StatsTypes.confirmed;

  List<double> confirmedLatest = [];

  @override
  void initState() {
    if (todayModel == null) {
      _fetchData();
    }

    super.initState();
  }

  void _fetchData() async {
    _isLoading = true;

    _apiResponse = await service.getTodayData();
    todayModel = _apiResponse.data;

    _apiResponseTimeline = await service.getTimelineData();
    timelineModel = _apiResponseTimeline.data;

    _isLoading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _renderDisplay();
    _renderChartData();

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
                    SizedBox(height: 20),
                    StatsTitle(title: "Statistics"),
                    SizedBox(height: 20),
                    _buildCountryTab(),
                    TopRowCard(
                      confirmed: displayStatsArgs.confirmed,
                      deaths: displayStatsArgs.deaths,
                      confirmedPress: () {
                        setState(() {
                          _type = StatsTypes.confirmed;
                          confirmedLatest.clear();
                        });
                      },
                      deathsPress: () {
                        setState(() {
                          _type = StatsTypes.deaths;
                          confirmedLatest.clear();
                        });
                      },
                    ),
                    BottomRowCard(
                      recovered: displayStatsArgs.recovered,
                      hospitalized: displayStatsArgs.hospitalized,
                      recoveredPress: () {
                        setState(() {
                          _type = StatsTypes.recovered;
                          confirmedLatest.clear();
                        });
                      },
                      hospitalizedPress: () {
                        setState(() {
                          _type = StatsTypes.hospitalized;
                          confirmedLatest.clear();
                        });
                      },
                    ),
                    ChartData(
                      value: confirmedLatest,
                      color: Color(0xFFFF5959),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void _renderChartData() {
    List<TimelineData> items =
        timelineModel.data.skip(timelineModel.data.length - 7).toList();

    for (var item in items) {
      double newData = item.confirmed.toDouble();
      switch (_type) {
        case StatsTypes.deaths:
          newData = item.deaths.toDouble();
          break;
        case StatsTypes.recovered:
          newData = item.recovered.toDouble();
          break;
        case StatsTypes.hospitalized:
          newData = item.hospitalized.toDouble();
          break;
        default:
          newData = item.confirmed.toDouble();
          break;
      }

      confirmedLatest.add(newData);
    }
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
          TimelineData items = timelineModel.data.last;
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
