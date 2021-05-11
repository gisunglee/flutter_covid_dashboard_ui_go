import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui_go/wedgets/stats_grid.dart';

import '../config/palette.dart';
import '../config/styles.dart';
import '../config/styles.dart';
import '../wedgets/custom_app_bar.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(
      ),
      body: CustomScrollView(
        // physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionTabBar(),
          _bulidStatsTabBar(),
          SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
          sliver: SliverToBoxAdapter(
            child: StatsGrid(

            ),
          ),),

        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(

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
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
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
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text('My Country'),
              Text('Clobal'),
            ],
            onTap: (index){},
          ),
        ),
      ),
    );
  }

  SliverPadding _bulidStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Total'),
              Text('Taday'),
              Text('Yesterday'),
            ],
            onTap: (index) {},
          ),

        ),
      ),
    );
  }
}
