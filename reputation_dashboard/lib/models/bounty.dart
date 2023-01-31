class BountyEntityModel {
  final String username;
  final bool hasBeenAllocated;
  final int xp;
  final String skill;

  BountyEntityModel({
    required this.username,
    required this.hasBeenAllocated,
    required this.xp,
    required this.skill,
  });

  factory BountyEntityModel.fromJson(Map json) {
    return BountyEntityModel(
      username: json['name'],
      hasBeenAllocated: json['allocated'],
      xp: json['xp'],
      skill: json['skill'],
    );
  }
}
