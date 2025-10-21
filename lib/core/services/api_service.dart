import 'package:dio/dio.dart';
import 'package:pet_pass/core/utiles/api_keys.dart';

class ApiService {
  final _baseUrl = ApiKeys.baseUrl;
  final _consumerKey = ApiKeys.consumerKey;
  final _consumerSecret = ApiKeys.consumerSecret;

  final Dio _dio;
  ApiService(this._dio);

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final fullQuery = {
      'consumer_key': _consumerKey,
      'consumer_secret': _consumerSecret,
      ...?queryParams,
    };

    var response = await _dio.get(
      '$_baseUrl/$endpoint',
      queryParameters: fullQuery,
    );

    return response.data;
  }
}
