import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/http_client/custom_http_client.dart';
import 'package:rick_and_morty/core/http_client/dio_http_client.dart';

class CoreInjector {
  final GetIt getIt = GetIt.instance;

  void setupDependecyInjections() {
    getIt.registerFactory<CustomHttpClient>(
      () => DioHttpClient(Dio(BaseOptions())),
    );
  }
}
