import 'package:flutter/material.dart';
import 'package:task_buddy_flutter/view/stats/widgets/stats_card_widget.dart';
import 'package:task_buddy_flutter/view/stats/widgets/streak_tracker_card_widget.dart';
import 'package:task_buddy_flutter/view/stats/widgets/task_breakdown_card_widget.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stats')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                StatsCardWidget(),
                SizedBox(height: 24),
                StreakTrackerCardWidget(),
                SizedBox(height: 24),
                TaskBreakdownCardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
