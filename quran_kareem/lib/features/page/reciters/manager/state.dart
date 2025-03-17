abstract class AppState {}

/// ✅ الحالة الابتدائية
class ReciterInitial extends AppState {}

/// ✅ تحميل قائمة القراء
class ReciterLoading extends AppState {}

class ReciterLoaded extends AppState {
  final List<Map<String, dynamic>> moshafDetails;
  ReciterLoaded(this.moshafDetails);
}

class ReciterError extends AppState {
  final String message;
  ReciterError(this.message);
}

/// ✅ تحميل التسجيلات الصوتية
class AudioLoading extends AppState {}

class AudioLoaded extends AppState {
  final List<String> audioList;
  AudioLoaded(this.audioList);
}

class AudioError extends AppState {
  final String message;
  AudioError(this.message);
}