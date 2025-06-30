// ignore_for_file: unused_element
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/bloc_wrapper_util.dart';
import '../api/kinerja/kinerja_api.dart';
import '../router/router.dart';
import 'injector.config.dart';
final getIt = GetIt.instance;

final KinerjaApi kinerjaApi = getIt<KinerjaApi>();

//* Initial Getit
// @InjectableInit(
//   initializerName: 'initCoreGetIt', // default\
//   generateForDir: ['lib/config','lib/core'],
//   preferRelativeImports: true,
// )
// configureConfigScope() => getIt.initCoreScope();
@injectableInit
Future<void> configureInjector(String environment) =>
    getIt.init(environment: environment);
// configureKinerjaApiScope() => getIt.initKinerjaApiScope();
// configureConfigInjector(environment) =>
//     getIt.initCoreGetIt(environment: environment);

//* For ThirdParty Plugins
@module
abstract class RegisterModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();

  @Named("KinerjaBaseUrl")
  String get kinerjaBaseUrl => kinerjaApi.baseUrl();

  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept-Encoding": "gzip",
        "Connection": "keep-alive",
      },
      connectTimeout: const Duration(
        seconds: 120,
      ),
      receiveTimeout: const Duration(
        seconds: 120,
      ),
      sendTimeout: const Duration(
        seconds: 120,
      ),
      followRedirects: false,
      validateStatus: (status) {
        return status! < 501;
      },
    ),
  );

  @singleton
  AppRouter get appRouter => AppRouter();

  @singleton
  BlocWrapperUtil get blocWrapperUtil => BlocWrapperUtil(getIt<AppRouter>());

}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
