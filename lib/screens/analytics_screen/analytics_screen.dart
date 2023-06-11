import 'package:flutter/material.dart';
import 'package:take_care/screens/analytics_screen/widget/income_analytics.dart';
import 'package:take_care/screens/analytics_screen/widget/spent_analytics.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelStyle: Theme.of(context).textTheme.titleMedium,
          tabs: const [
            Tab(
              text: 'Spent',
            ),
            Tab(
              text: 'Income',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            SpentAnalytics(),
            IncomeAnalytics(),
          ]),
        ),
      ],
    );
  }
}
