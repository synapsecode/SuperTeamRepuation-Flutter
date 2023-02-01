import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reputation_dashboard/dashboard/tabscreens/contributors_tab.dart';
import 'package:reputation_dashboard/dashboard/tabscreens/design_tab.dart';
import 'package:reputation_dashboard/dashboard/tabscreens/everyone_tab.dart';
import 'package:reputation_dashboard/dashboard/tabscreens/members_tab.dart';
import 'package:reputation_dashboard/extensions/extensions.dart';
import 'package:reputation_dashboard/global_components.dart';

class ReputationDashboard extends StatefulWidget {
  const ReputationDashboard({Key? key}) : super(key: key);

  @override
  State<ReputationDashboard> createState() => _ReputationDashboardState();
}

class _ReputationDashboardState extends State<ReputationDashboard>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 24, 31),
      body: Material(
          color: Color.fromARGB(255, 22, 24, 31),
          textStyle: TextStyle(color: Colors.white),
          child: ScrollableTabbedView(
            tabNames: ['Everyone', 'Members', 'Contributors', 'Design'],
            tabPages: [
              EveryoneTab(),
              MembersTab(),
              ContributorsTab(),
              DesignTab(),
            ],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                TopBar(),
                MidSection(),
                Text('BROWSE BY')
                    .color(Colors.white24)
                    .weight(FontWeight.bold)
                    .size(20)
                    .addUniformMargin(20)
              ],
            ),
          )),
    );
  }
}

class MidSection extends StatelessWidget {
  const MidSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withAlpha(5),
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("✨ The XP System").size(30).addBottomMargin(20),
          Text("XP system helps us understand who did what when and why this is just random text that you just wasted 20seconds reading, get a life")
              .color(Colors.white24)
              .size(22),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white10,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(width: 15),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/superteam.png',
                ),
              ),
            ),
          ).addHorizontalMargin(10),
          Text('superteam')
              .weight(FontWeight.bold)
              .color(Colors.white)
              .size(24),
          Expanded(child: Container()),
          Container(
            height: 30,
            width: 30,
            color: Colors.white10,
          ).addHorizontalMargin(10),
          Container(
            height: 30,
            width: 30,
            color: Colors.white10,
          ).addHorizontalMargin(10),
          Container(
            height: 30,
            width: 30,
            color: Colors.white10,
          ).addHorizontalMargin(10),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
