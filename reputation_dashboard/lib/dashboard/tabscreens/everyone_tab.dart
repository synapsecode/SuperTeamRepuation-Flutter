import 'package:flutter/material.dart';
import 'package:reputation_dashboard/api.dart';
import 'package:reputation_dashboard/extensions/extensions.dart';
import 'package:reputation_dashboard/global_components.dart';
import 'package:reputation_dashboard/models/person.dart';
import 'dart:math' as math;

class EveryoneTab extends StatefulWidget {
  const EveryoneTab({Key? key}) : super(key: key);

  @override
  State<EveryoneTab> createState() => _EveryoneTabState();
}

class _EveryoneTabState extends State<EveryoneTab> {
  bool isLoading = false;
  String filterQuery = "";
  List<SuperteamPersonModel> people = [];

  loadPersonData() async {
    setState(() => isLoading = true);
    people = await ReputationAPI.getPersonDetails() ?? [];
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadPersonData();
    super.initState();
  }

  List<SuperteamPersonModel> applySearchFilter(List<SuperteamPersonModel> x) {
    return x
        .where((e) =>
            e.username.toLowerCase().startsWith(filterQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SimpleBorderlessTextfield(
            hintText: '  Search User',
            centeredText: false,
            onChanged: (x) {
              setState(() {
                filterQuery = x;
              });
            },
            obscureText: false,
          ),
          const SizedBox(
            height: 20,
          ),
          if (isLoading) ...[
            const CircularProgressIndicator().center()
          ] else ...[
            people.isEmpty
                ? const Text('No Detals Available').center()
                : Column(
                    children: applySearchFilter(people)
                        .asMap()
                        .map(
                          (k, v) => MapEntry(
                            k,
                            PersonTileItem(
                              person: v,
                              rank: k + 1,
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ),
          ],

          // FutureBuilder(
          //   future: ReputationAPI.getPersonDetails(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       final o = snapshot.data;

          //       if (o == null)
          //         return const Text('No Detals Available').center();

          //       return Column(
          //         children: applySearchFilter(o)
          //             .asMap()
          //             .map(
          //               (k, v) => MapEntry(
          //                 k,
          //                 PersonTileItem(
          //                   person: v,
          //                   rank: k + 1,
          //                 ),
          //               ),
          //             )
          //             .values
          //             .toList(),
          //       );
          //     } else {
          //       return const CircularProgressIndicator().center();
          //     }
          //   },
          // ),
          // Column(
          //   children: [
          //     SuperteamPersonModel(
          //       username: '#Kash2139',
          //       role: 'member',
          //       totalXP: '48394',
          //       overallXpBreakdown: [
          //         XpDetail(
          //           skill: 'dev',
          //           xp: '10',
          //         ),
          //         XpDetail(
          //           skill: 'design',
          //           xp: '20',
          //         ),
          //         XpDetail(
          //           skill: 'strategy',
          //           xp: '30',
          //         ),
          //       ],
          //     ),
          //   ]
          //       .asMap()
          //       .map(
          //         (k, v) => MapEntry(
          //           k,
          //           PersonTileItem(
          //             person: v,
          //             rank: k + 1,
          //           ),
          //         ),
          //       )
          //       .values
          //       .toList(),

          // ),
        ],
      ),
    );
  }
}

class PersonTileItem extends StatelessWidget {
  final SuperteamPersonModel person;
  final int rank;
  const PersonTileItem({
    Key? key,
    required this.person,
    required this.rank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ExpansionTile(
        initiallyExpanded: true,
        textColor: Colors.white,
        collapsedBackgroundColor: Colors.white.withAlpha(30),
        backgroundColor: Colors.white.withAlpha(10),
        leading: (rank > 3)
            ? Text(rank.toString()).size(20).color(Colors.white30)
            : CircleAvatar(
                    backgroundColor: (rank == 1)
                        ? Colors.amber
                        : (rank == 2)
                            ? Colors.grey
                            : Colors.brown.shade400,
                    radius: 12)
                .addTopMargin(8)
                .addLeftMargin(10),
        title: Text(person.username).size(20).color(Colors.white),
        subtitle: Text(person.username).color(Colors.white24),
        // trailing: Text("${person.totalXP} XP ").color(Colors.white54).size(18),

        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 10,
            spacing: 10,
            children: person.overallXpBreakdown
                .map(
                  (x) => Chip(
                    backgroundColor:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.6),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    label: Text("${x.skill} (${x.xp} XP)"),
                  ),
                )
                .toList(),
          ).addRightMargin(10).addLeftMargin(50),
          Row(
            children: [
              Text("Total XP: ${person.totalXP}").color(Colors.white54).size(20)
            ],
          ).addUniformPadding(20).addTopMargin(10)
        ],
      ),
    ).addBottomMargin(10);
    // return ListTile(
    //   tileColor: Colors.white.withAlpha(8),
    //   textColor: Colors.white,
    //   contentPadding: EdgeInsets.all(5),
    //   title: Text('First Name').size(20),
    //   subtitle: Text('#Kash2899').color(Colors.white24),
    //   leading: CircleAvatar(
    //     backgroundColor: (rank == 1)
    //         ? Colors.amber
    //         : (rank == 2)
    //             ? Colors.grey
    //             : Colors.brown.shade400,
    //     radius: 16,
    //   ).addTopMargin(4).addLeftMargin(15),
    // );
  }
}

class PersonTile extends StatelessWidget {
  final SuperteamPersonModel person;
  final int rank;
  const PersonTile({
    super.key,
    required this.rank,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Colors.white.withAlpha(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (rank > 3) ...[
                Text(rank.toString()).size(20).color(Colors.white30)
              ] else ...[
                CircleAvatar(
                    backgroundColor: (rank == 1)
                        ? Colors.amber
                        : (rank == 2)
                            ? Colors.grey
                            : Colors.brown.shade400,
                    radius: 12),
              ],
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Full Name').size(20),
                  Text(person.username).color(Colors.white24)
                ],
              )
            ],
          )
        ],
      ),
    ).clip(6).addBottomMargin(10);
  }
}
