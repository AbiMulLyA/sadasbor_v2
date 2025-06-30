import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../config/injector/injector.dart';
import 'shared_preferences_util.dart';
import 'dart:io';

@lazySingleton
class GlobalUtil {
  final _sharedPreferencesUtil = getIt<SharedPreferencesUtil>();

  //* Get App Version
  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final String version = "v${packageInfo.version}#${packageInfo.buildNumber}";

    return version;
  }
  //* debugPrintSynchronouslyWithText
  void debugPrintSynchronouslyWithText(String? message, String? version,
      {int? wrapWidth}) {
    final dateToday = DateFormat.yMd().add_Hms().format(DateTime.now());
    message = "[$dateToday]: $message";
    debugPrintSynchronously(message, wrapWidth: wrapWidth);
  }
}