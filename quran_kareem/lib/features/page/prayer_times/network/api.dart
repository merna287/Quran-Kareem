import 'package:dio/dio.dart';

class Api {
  final _baseUrl = "https://api.aladhan.com/v1";
  final Dio dio = Dio();

  Future<dynamic> get({required String endpoint}) async {
    try {
      var response = await dio.get("$_baseUrl$endpoint");
      return response.data;
    } catch (error) {
      return null; 
    }
  }
}
