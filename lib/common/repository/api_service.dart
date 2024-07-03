import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = "https://getsetrock.com/api";

  Future<dynamic> login(
      {required String email, required String password}) async {
    // final data = {"email": email.trim(), "password": password.trim()};

    dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
    dio.options.headers['accept'] = 'application/json';
    // Response response = await dio.post("$baseUrl/tokens/create", data: data);

    return null;
  }
}
