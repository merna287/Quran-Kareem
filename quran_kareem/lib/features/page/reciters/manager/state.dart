abstract class AppState {}


class ReciterInitial extends AppState {}


class ReciterLoading extends AppState {}

class ReciterLoaded extends AppState {
  final List<Map<String, dynamic>> moshafDetails;
  ReciterLoaded(this.moshafDetails);
}

class ReciterError extends AppState {
  final String message;
  ReciterError(this.message);
}


class AudioLoading extends AppState {}

class AudioLoaded extends AppState {
  final List<String> audioList;
  AudioLoaded(this.audioList);
}

class AudioError extends AppState {
  final String message;
  AudioError(this.message);
}