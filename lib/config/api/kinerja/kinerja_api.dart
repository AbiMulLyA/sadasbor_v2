import 'package:injectable/injectable.dart';

@factoryMethod
abstract class KinerjaApi {
  static const String appName = "Sadasbor V2";
  static const String scopeInjectionCore = "core";

  static const int defApiTimeout = 20000; //in milisecond
  static const int defFetchLimit = 10;

  String baseUrl();

  String environment();
}
