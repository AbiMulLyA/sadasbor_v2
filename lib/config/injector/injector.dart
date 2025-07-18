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
@injectableInit
Future<void> configureInjector(String environment) =>
    getIt.init(environment: environment);
@module
abstract class RegisterModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();

  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept-Encoding": "gzip",
        "Connection": "keep-alive",
      },
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),
      followRedirects: false,
      validateStatus: (status) {
        return status! < 501;
      },
    ),
  );

  // Metode untuk menyediakan SadasborApi default
  // Ini akan dipanggil oleh injectable jika tidak ada cara lain untuk membuat SadasborApi default
  // DAN jika SadasborApi default dibutuhkan (seperti oleh getIt<SadasborApi>() Anda).
  @preResolve // Jika perlu async, jika tidak, bisa @lazySingleton atau @Injectable
  @singleton // Atau @lazySingleton atau @Injectable sesuai kebutuhan lifecycle
  Future<SadasborApi> registerDefaultApi(
      // Inject salah satu API bernama yang sudah terdaftar oleh injectable
      // Pilih mana yang mau jadi default. Misalnya, KinerjaApi.
      @Named('KinerjaApi') SadasborApi kinerjaApi,
      // Anda bisa juga inject environment jika perlu logika berbeda
      // EnvironmentFilter environmentFilter, // Ini injectable punya, atau String environment
      ) async {
    // Logika untuk menentukan default API bisa di sini jika lebih kompleks.
    // Untuk kasus sederhana, kita hanya mengembalikan salah satu yang sudah ada.
    // Misalnya, kita putuskan KinerjaApi adalah default.
    return kinerjaApi;
    // Jika Anda perlu instance BARU yang khusus default:
    // final currentEnv = getIt<String>(instanceName: 'activeEnvironment'); // Anda perlu mendaftarkan ini
    // if (currentEnv == Env.dev) {
    //   return DevKinerjaApi(); // Ini akan membuat instance baru, bukan yang di-cache oleh @Named
    // } else {
    //   return ProdKinerjaApi();
    // }
  }
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
