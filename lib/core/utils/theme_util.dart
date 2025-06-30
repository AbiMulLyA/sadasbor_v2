// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';import '../../config/theme/theme.dart';


class ThemeUtil {
  static ThemeData getThemeDefaults(BuildContext context) {
    // final int hourOfDay = DateTime.now().hour;

    ThemeData themeData;
    /*if (hourOfDay >= 5 && hourOfDay < 18) {
      themeData = themeLight.copyWith(errorColor: const Color(0xffd32f2f));
      debugPrint('THEME DEFAULTS IS LIGHT');
    } else {
      themeData = themeDark.copyWith(errorColor: const Color(0xffd32f2f));
      debugPrint('THEME DEFAULTS IS DARK');
    }*/
    /*if (MediaQuery.platformBrightnessOf(context) == Brightness.dark) {
      themeData = themeDark.copyWith(errorColor: const Color(0xffd32f2f));
    } else {
      themeData = themeLight.copyWith(errorColor: const Color(0xffd32f2f));
    }*/

    themeData = themeLight.copyWith(
        colorScheme: const ColorScheme.light(error: Color(0xffd32f2f)));
    // themeData = themeDark.copyWith(errorColor: const Color(0xffd32f2f));

    accurateTheme[ThemeType.defaults] = themeData;

    return themeData;
  }
}
