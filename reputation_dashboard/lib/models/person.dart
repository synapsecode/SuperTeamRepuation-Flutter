class SuperteamPersonModel {
  final String username;
  final String role;
  final String totalXP;
  final List<XpDetail> overallXpBreakdown;

  SuperteamPersonModel({
    required this.username,
    required this.role,
    required this.totalXP,
    required this.overallXpBreakdown,
  });

  static SuperteamPersonModel fromJson(Map json) {
    // print("Fetching Name => ${json['name']}");
    final z = SuperteamPersonModel(
      username: json['name'] ?? 'N/A',
      role: json['personType'] ?? 'N/A',
      totalXP: json['overallXP']?['total']?['total_xp']?.toString() ?? 'N/A',
      overallXpBreakdown: (json['overallXP']?['details']?['skills'] ?? [])
          .map<XpDetail>(
            (s) => XpDetail(
              skill: s['skill'],
              xp: s['amount'].toString(),
            ),
          )
          .toList(),
    );
    // print(z);
    return z;
  }
}

class XpDetail {
  final String skill;
  final String xp;

  XpDetail({required this.skill, required this.xp});
}
