import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> _tabsCountry = ['My Country', 'Global'];
  List<String> _tabsDay = ['Total', 'Today', 'Yesterday'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Statistics',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: DefaultTabController(
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
                onTap: (index) {},
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          sliver: SliverToBoxAdapter(
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
                onTap: (index) {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
