// ignore_for_file: unused_element
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/bloc_wrapper_util.dart';
import '../api/sadasbor_api.dart';
import '../router/router.dart';
import 'injector.config.dart';

final getIt = GetIt.instance;

final SadasborApi sadasborApi = getIt<SadasborApi>();

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
// configuresadasborApiScope() => getIt.initsadasborApiScope();
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

  // @Named("KinerjaBaseUrl")
  // String get kinerjaBaseUrl => sadasborApi.baseUrl();

  // @lazySingleton
  // Dio dio() => Dio(
  //   BaseOptions(
  //     headers: {
  //       "Content-Type": "application/x-www-form-urlencoded",
  //       "Accept-Encoding": "gzip",
  //       "Connection": "keep-alive",
  //     },
  //     connectTimeout: const Duration(seconds: 120),
  //     receiveTimeout: const Duration(seconds: 120),
  //     sendTimeout: const Duration(seconds: 120),
  //     followRedirects: false,
  //     validateStatus: (status) {
  //       return status! < 501;
  //     },
  //   ),
  // );

  @Named('BkpsdmDio')
  @injectable
  Dio provideMainDio(@Named('BkpsdmApi') SadasborApi api) {
    final dio = Dio();
    dio.options.baseUrl = api.baseUrl();
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

    // Add interceptors
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    return dio;
  }

  @Named('KinerjaDio')
  @injectable
  Dio provideSecondaryDio(@Named('KinerjaApi') SadasborApi api) {
    final dio = Dio();
    dio.options.baseUrl = api.baseUrl();
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

    // Add interceptors
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    return dio;
  }

  @singleton
  AppRouter get appRouter => AppRouter();

  @singleton
  BlocWrapperUtil get blocWrapperUtil => BlocWrapperUtil(getIt<AppRouter>());
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
