class Timings {
  late final String fajr, 
  sunrise, 
  dhuhr, 
  asr, 
  maghrib, 
  isha, 
  imsak, midnight, firstThird, lastThird;

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json["Fajr"] ?? " ";
    sunrise = json["Sunrise"] ?? " ";
    dhuhr = json["Dhuhr"] ?? " ";
    asr = json["Asr"] ?? " ";
    maghrib = json["Maghrib"] ?? " ";
    isha = json["Isha"] ?? " ";
    imsak = json["Imsak"] ?? " ";
    midnight = json["Midnight"] ?? " ";
    firstThird = json["FirstThird"] ?? json["Firstthird"] ?? " ";
    lastThird = json["LastThird"] ?? json["Lastthird"] ?? " ";
  }
}
