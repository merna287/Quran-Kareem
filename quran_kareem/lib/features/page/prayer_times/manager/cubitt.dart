import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/features/page/prayer_times/manager/statee.dart'; 
import 'package:quran_kareem/features/page/prayer_times/model/timings.dart';
import 'package:quran_kareem/features/page/prayer_times/network/api.dart';

class Cubitt extends Cubit<Statee> {
  final Api api;

  Cubitt(this.api) : super(PrayerInitial());

  Future<void> fetchMoshafDetails() async {
    emit(PrayerLoading());

    try {
      var data = await api.get(endpoint: "/timingsByCity/15-02-2024?country=egypt&city=cairo");

      if (data != null && data["data"] != null && data["data"]["timings"] != null) {
        var timings = Timings.fromJson(data["data"]["timings"]);

        Map<String, String> timingsMap = {
          "الفجر": timings.fajr,
          "الشروق": timings.sunrise,
          "الظهر": timings.dhuhr,
          "العصر": timings.asr,
          "المغرب": timings.maghrib,
          "العشاء": timings.isha,
          "الإمساك": timings.imsak,
          "منتصف الليل": timings.midnight,
          "الثلث الأول": timings.firstThird,
          "الثلث الأخير": timings.lastThird,
        };

        emit(PrayerLoaded(timingsMap));
      } else {
        emit(PrayerError("البيانات غير متوفرة"));
      }
    } catch (error) {
      emit(PrayerError("Error : $error"));
    }
  }
}
