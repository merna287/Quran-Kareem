import 'package:quran_kareem/features/page/reciters/model/moshaf_info.dart';

class Reciter {
  final int id;
  final String name;
  final List<MoshafInfo> moshafs;

  Reciter({required this.id, required this.name, required this.moshafs});

  factory Reciter.fromJson(Map<String, dynamic> json) {
    List<MoshafInfo> moshafList = [];
    if (json["moshaf"] != null) {
      for (var moshaf in json["moshaf"]) {
        moshafList.add(MoshafInfo.fromJson(moshaf));
      }
    }
    return Reciter(
      id: json["id"],
      name: json["name"],
      moshafs: moshafList,
    );
  }
}
