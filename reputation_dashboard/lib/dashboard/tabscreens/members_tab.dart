import 'package:flutter/material.dart';
import 'package:reputation_dashboard/extensions/extensions.dart';

class MembersTab extends StatelessWidget {
  const MembersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('👀 Coming Soon').size(30).center().addUniformMargin(20),
        ],
      ),
    );
  }
}
