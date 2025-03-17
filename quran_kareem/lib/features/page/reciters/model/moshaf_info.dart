class MoshafInfo {
  final int id;
  final String name;
  final String server;
  final int surahTotal;

  MoshafInfo({
    required this.id,
    required this.name,
    required this.server,
    required this.surahTotal,
  });

  factory MoshafInfo.fromJson(Map<String, dynamic> json) {
    return MoshafInfo(
      id: json["id"],
      name: json["name"],
      server: json["server"],
      surahTotal: json["surah_total"],
    );
  }
}
