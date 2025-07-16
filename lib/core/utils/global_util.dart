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

  // Function baru untuk tema card dinamis
  static CardTheme getCardTheme() {
    final int hourOfDay = DateTime.now().hour;

    if (hourOfDay >= 0 && hourOfDay < 11) {
      // Pagi - Theme sunrise dengan warm colors
      return CardTheme(
        gradientColors: [
          const Color(0xFFE1F5FE), // Light blue
          const Color(0xFFF0F8FF), // Very light blue
        ],
        textColor: const Color(0xFF01579B), // Dark blue
        subTextColor: const Color(0xFF0277BD), // Medium blue
        icon: Icons.wb_sunny_outlined,
        timeOfDay: 'morning',
      );
    } else if (hourOfDay >= 11 && hourOfDay < 15) {
      // Siang - Theme bright sky blue
      return CardTheme(
        gradientColors: [
          const Color(0xFFFFE0B2), // Light orange
          const Color(0xFFFFF3E0), // Very light orange
        ],
        textColor: const Color(0xFF5D4037), // Dark brown
        subTextColor: const Color(0xFF8D6E63), // Medium brown
        icon: Icons.wb_sunny,
        timeOfDay: 'afternoon',
      );
    } else if (hourOfDay >= 15 && hourOfDay < 19) {
      // Sore - Theme sunset dengan warm orange
      return CardTheme(
        gradientColors: [
          const Color(0xFFFFF3E0), // Light orange
          const Color(0xFFFFECB3), // Light amber
        ],
        textColor: const Color(0xFFE65100), // Dark orange
        subTextColor: const Color(0xFFFF8F00), // Medium orange
        icon: Icons.wb_twilight,
        timeOfDay: 'evening',
      );
    } else {
      // Malam - Theme night dengan cool purple/blue
      return CardTheme(
        gradientColors: [
          const Color(0xFFE8EAF6), // Light indigo
          const Color(0xFFF3E5F5), // Light purple
        ],
        textColor: const Color(0xFF3F51B5), // Dark indigo
        subTextColor: const Color(0xFF673AB7), // Medium purple
        icon: Icons.nightlight_round,
        timeOfDay: 'night',
      );
    }
  }
}

class CardTheme {
  final List<Color> gradientColors;
  final Color textColor;
  final Color subTextColor;
  final IconData icon;
  final String timeOfDay;

  CardTheme({
    required this.gradientColors,
    required this.textColor,
    required this.subTextColor,
    required this.icon,
    required this.timeOfDay,
  });
}
