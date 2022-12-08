import 'package:dio/dio.dart';

class AppendApiKeyInterceptor extends Interceptor {
  AppendApiKeyInterceptor({required this.apiKey});

  final Future<String> Function() apiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-RapidAPI-Key'] = apiKey;

    return super.onRequest(options, handler);
  }
}
