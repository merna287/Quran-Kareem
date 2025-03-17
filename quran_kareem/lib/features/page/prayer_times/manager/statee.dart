abstract class Statee {}

class PrayerInitial extends Statee {}

class PrayerLoading extends Statee {}

class PrayerLoaded extends Statee {
  final Map<String, String> timings;
  PrayerLoaded(this.timings);
}

class PrayerError extends Statee {
  final String message;
  PrayerError(this.message);
}
