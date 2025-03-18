import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/features/page/reciters/manager/state.dart';
import 'package:quran_kareem/features/page/reciters/network/api_service.dart';

class AppCubit extends Cubit<AppState> {
  final ApiService apiService;

  AppCubit(this.apiService) : super(ReciterInitial());

  List<Map<String, dynamic>> moshafDetails = [];
  List<String> audioList = [];

  
  Future<void> fetchMoshafDetails() async {
    emit(ReciterLoading());

    try {
      var data = await apiService.get(endpoint: "reciters?language=eng");

      if (data != null && data["reciters"] != null) {
        moshafDetails = [];
        for (var reciter in data["reciters"]) {
          for (var moshaf in reciter["moshaf"]) {
            moshafDetails.add({
              "reciter_name": reciter["name"],
              "moshaf_id": moshaf["id"],
              "moshaf_name": moshaf["name"],
              "server": moshaf["server"],
              "surah_total": moshaf["surah_total"],
            });
          }
        }
      }

      emit(ReciterLoaded(moshafDetails));
    } catch (e) {
      emit(ReciterError("❌ Failed to fetch data: $e"));
    }
  }

  
  Future<void> fetchAudioFiles(String serverUrl, int surahTotal) async {
    emit(AudioLoading());

    try {
      audioList = [];
      if (!serverUrl.endsWith("/")) {
        serverUrl += "/";
      }

      for (int i = 1; i <= surahTotal; i++) {
        String formattedIndex = i.toString().padLeft(3, '0'); 
        String audioUrl = "$serverUrl$formattedIndex.mp3";
        audioList.add(audioUrl);
      }

      emit(AudioLoaded(audioList));
    } catch (e) {
      emit(AudioError("❌ Failed to fetch audio files: $e"));
    }
  }
}