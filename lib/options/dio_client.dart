import 'package:dio/dio.dart';

abstract class DioClient {
  static Future<Dio> createDIO({
    required String baseUrl,
  }) async {
    var _dio = Dio();

    _dio
      ..options.headers = {
        'X-RapidAPI-Key': 'aa5cbf915emshf46dbe98ec2f279p1e920ajsn8ce46f9cd650'
      }
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration.millisecondsPerMinute - 45000
      ..options.receiveTimeout = Duration.millisecondsPerMinute - 45000
      ..httpClientAdapter;

    return _dio;
  }
}
