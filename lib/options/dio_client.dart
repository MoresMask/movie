import 'package:dio/dio.dart';

abstract class DioClient {
  static Future<Dio> createDIO({
    required Future<List<Interceptor>> Function(Dio) getInterceptors,
    required String baseUrl,
  }) async {
    var _dio = Dio();

    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration.millisecondsPerMinute - 45000
      ..options.receiveTimeout = Duration.millisecondsPerMinute - 45000
      ..httpClientAdapter
      ..interceptors.addAll(await getInterceptors(_dio));

    return _dio;
  }
}
