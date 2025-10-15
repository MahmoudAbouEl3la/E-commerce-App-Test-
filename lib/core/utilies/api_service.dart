import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com/';
  static const String products = 'products';
  static const String authLogin = "auth/login";
  final Dio dio;
  ApiService({required this.dio});

  Future<List<dynamic>> getProducts({required String endPoint}) async {
    final respone = await dio.get(baseUrl + endPoint);
    return respone.data;
  }

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      baseUrl + authLogin,
      data: {'username': username, 'password': password},
    );
    return response.data;
  }
}
