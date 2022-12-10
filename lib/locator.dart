import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies2/api/client.dart';
import 'package:movies2/config.dart';
import 'package:movies2/options/dio_client.dart';

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
    );

    sl.registerLazySingleton(() => ApiClient(clientMain));
  }
}
