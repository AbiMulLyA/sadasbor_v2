import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../config/injector/injector.dart';
import 'shared_preferences_util.dart';

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
  void debugPrintSynchronouslyWithText(
    String? message,
    String? version, {
    int? wrapWidth,
  }) {
    final dateToday = DateFormat.yMd().add_Hms().format(DateTime.now());
    message = "[$dateToday]: $message";
    debugPrintSynchronously(message, wrapWidth: wrapWidth);
  }

  static String greatingText(BuildContext context) {

    final int hourOfDay = DateTime.now().hour;

    String greating = '';
    if (hourOfDay >= 0 && hourOfDay < 11) {
      greating = context.tr('global_good_morning');
    } else if (hourOfDay >= 11 && hourOfDay < 15) {
      greating = context.tr('global_good_afternoon');
    } else if (hourOfDay >= 15 && hourOfDay < 19) {
      greating = context.tr('global_good_afternoon2');
    } else if (hourOfDay >= 19 && hourOfDay <= 24) {
      greating = context.tr('global_good_evening');
    }

    return greating;
  }
}
