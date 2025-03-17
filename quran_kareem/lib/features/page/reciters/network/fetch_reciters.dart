import 'package:quran_kareem/features/page/reciters/network/api_service.dart';

Future<List<Map<String, dynamic>>> fetchMoshafDetails(Map<int, List<String>> audioLinks) async {
  try {
    print("🔍 جاري جلب البيانات...");
    ApiService apiService = ApiService();
    var data = await apiService.get(endpoint: "reciters?language=eng");

    if (data == null || data["reciters"] == null) {
      print("❌ لا توجد بيانات مستلمة من API");
      return [];
    }

    print("✅ تم جلب البيانات بنجاح: ${data["reciters"].length} مقرئ");

    List<Map<String, dynamic>> moshafDetails = [];
    Map<int, List<String>> tempAudioLinksMap = {};

    for (var reciter in data["reciters"]) {
      print("📢 المقرئ: ${reciter["name"]}");

      if (reciter["moshaf"] == null) continue;

      for (var moshaf in reciter["moshaf"]) {
        int moshafId = moshaf["id"];
        String server = moshaf["server"];
        int totalSurahs = moshaf["surah_total"];

        List<String> surahAudioLinks = List.generate(
          totalSurahs,
          (index) => "$server/${(index + 1).toString().padLeft(3, '0')}.mp3",
        );

        tempAudioLinksMap[moshafId] = surahAudioLinks;

        moshafDetails.add({
          "reciter_name": reciter["name"] ?? "غير معروف",
          "moshaf_id": moshafId,
          "moshaf_name": moshaf["name"] ?? "غير معروف",
          "server": server,
          "surah_total": totalSurahs,
        });

        print("📜 تمت إضافة المصحف: ${moshaf["name"]}");
      }
    }

    audioLinks.addAll(tempAudioLinksMap);
    print("🎧 إجمالي التسجيلات الصوتية: ${audioLinks.length}");

    return moshafDetails;
  } catch (e) {
    print("⚠️ خطأ أثناء جلب البيانات: $e");
    return [];
  }
}
