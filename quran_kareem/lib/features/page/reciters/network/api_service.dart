import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://www.mp3quran.net/api/v3/";
  final Dio dio = Dio();

  Future<dynamic> get({required String endpoint}) async {
    try {
      var response = await dio.get("$_baseUrl$endpoint");
      return response.data;
    } catch (error) {
      throw Exception("Error fetching data: $error");
    }
  }
}