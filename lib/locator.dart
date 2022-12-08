import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies2/api/client.dart';
import 'package:movies2/config.dart';
import 'package:movies2/options/dio_client.dart';
import 'package:movies2/options/tokken.dart';

import 'package:shared_preferences/shared_preferences.dart';

var sl = GetIt.instance;

class Locator {
  const Locator._();

  static Future<void> init() async {
    await _registerUtiles();
  }

  static Future<void> _registerUtiles() async {
    var clientMain = await DioClient.createDIO(
        baseUrl: AppConstants.main,
        getInterceptors: (Dio dio) async => getDefaultInterceptors(dio));

    sl.registerLazySingleton(() => ApiClient(clientMain));
  }
}

Future<List<Interceptor>> getDefaultInterceptors(Dio dio) async {
  return [
    AppendApiKeyInterceptor(
      apiKey: () async {
        var token = (await SharedPreferences.getInstance())
            .getString(AppConstants.token);
        return token ?? '';
      },
    )
  ];
}
