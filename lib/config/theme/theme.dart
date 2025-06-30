// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum PopList { block, detail, delete, edit, report }

enum ThemeType {
  dark,
  light,
  defaults,
}

/// padding left and right = 16
double kDefLeftRight = 16;

/// padding top bottom = 10
double kDefTopBottom = 10;

ThemeData? themeDefaults;

Map<ThemeType, ThemeData?> accurateTheme = {
  ThemeType.dark: themeDark,
  ThemeType.light: themeLight,
  ThemeType.defaults: themeDefaults,
};
// ignore: todo
// TODO : Adjust these themes for all UI

// #Region themeDark
final ThemeData themeDark = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,
  primaryColor: AccurateColor.whiteAccurate,
  primaryColorLight: AccurateColor.black50,
  primaryColorDark: const Color(0xff212121),
  canvasColor: const Color(0xff303030),
  scaffoldBackgroundColor: const Color(0xff000000),
  cardColor: const Color(0xff424242),
  dividerColor: const Color(0x1fffffff),
  highlightColor: const Color(0x40cccccc),
  splashColor: const Color(0x40cccccc),
  // selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: const Color(0xb3ffffff),
  disabledColor: const Color(0xff424242),
  secondaryHeaderColor: const Color(0xff212121),
  dialogBackgroundColor: const Color(0xff424242),
  indicatorColor: const Color(0xff2283F5),
  hintColor: const Color(0x80ffffff),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color(0xff424242),
  ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
    color: AccurateColor.blueAccurate,
  ),
  colorScheme: const ColorScheme(
    primary: Color(0xff2283F5),
    primaryContainer: Color(0xff000000),
    secondary: Color(0xff2283F5),
    secondaryContainer: Color(0xff616161),
    surface: Color(0xff424242),
    background: Color(0xff212121),
    error: Color(0xffd32f2f),
    onPrimary: AccurateColor.whiteAccurate,
    onSecondary: Color(0xff000000),
    onSurface: AccurateColor.whiteAccurate,
    onBackground: AccurateColor.whiteAccurate,
    onError: Color(0xff000000),
    brightness: Brightness.dark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AccurateColor.blueAccurate,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    minWidth: 88.0,
    height: 36.0,
    padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 16.0, right: 16.0),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xff2283F5),
    disabledColor: Color(0x4dffffff),
    highlightColor: Color(0x29ffffff),
    splashColor: Color(0x1fffffff),
    colorScheme: ColorScheme(
      primary: Color(0xff000000),
      primaryContainer: Color(0xff000000),
      secondary: Color(0xff64ffda),
      secondaryContainer: Color(0xff00bfa5),
      surface: Color(0xff424242),
      background: Color(0xff616161),
      error: Color(0xffd32f2f),
      onPrimary: AccurateColor.whiteAccurate,
      onSecondary: Color(0xff000000),
      onSurface: AccurateColor.whiteAccurate,
      onBackground: AccurateColor.whiteAccurate,
      onError: Color(0xff000000),
      brightness: Brightness.dark,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  ),
  primaryTextTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: AccurateColor.black30),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AccurateColor.black30),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AccurateColor.black30),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AccurateColor.black30),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 15),
    errorStyle: TextStyle(
      color: Color(0xffd32f2f),
      fontSize: 10,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AccurateColor.whiteAccurate,
    opacity: 1.0,
    size: 20.0,
  ),
  primaryIconTheme: const IconThemeData(
    color: AccurateColor.whiteAccurate,
    opacity: 1.0,
    size: 20.0,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: AccurateColor.whiteAccurate,
    inactiveTrackColor: Color(0x3d212121),
    disabledActiveTrackColor: Color(0x52000000),
    disabledInactiveTrackColor: Color(0x1f000000),
    activeTickMarkColor: AccurateColor.black50,
    inactiveTickMarkColor: Color(0x8a212121),
    disabledActiveTickMarkColor: AccurateColor.black50,
    disabledInactiveTickMarkColor: Color(0x1f000000),
    thumbColor: AccurateColor.whiteAccurate,
    disabledThumbColor: Color(0x52000000),
    thumbShape: RoundSliderThumbShape(),
    overlayColor: Color(0x29212121),
    valueIndicatorColor: AccurateColor.whiteAccurate,
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.onlyForDiscrete,
    valueIndicatorTextStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  tabBarTheme: const TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AccurateColor.whiteAccurate,
    labelStyle: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    unselectedLabelColor: Color(0xb2ffffff),
    unselectedLabelStyle: TextStyle(
      color: Color(0xb2ffffff),
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    titleSpacing: 20,
    backgroundColor: Color(0xff303030),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xff2283F5),
    unselectedItemColor: AccurateColor.whiteAccurate,
    backgroundColor: Color(0xff303030),
    showUnselectedLabels: true,
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0x1fffffff),
    brightness: Brightness.dark,
    deleteIconColor: Color(0xdeffffff),
    disabledColor: Color(0xff000000),
    labelPadding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 8.0, right: 8.0),
    labelStyle: TextStyle(
      color: Color(0xdeffffff),
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
    secondaryLabelStyle: TextStyle(
      color: Color(0xff999999),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: AccurateColor.whiteAccurate,
    selectedColor: Color(0xffE7F3FB),
    shape: StadiumBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0.0,
          //style: BorderStyle.none,
        )),
  ),
  dialogTheme: const DialogThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0.0,
          //style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      )),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
  cardTheme: const CardThemeData(
    color: Color(0xff37404a),
    shadowColor: Color(0xff000000),
    elevation: 1,
    margin: EdgeInsets.zero,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff4285f4),
    selectionColor: AccurateColor.blueAccurate,
    selectionHandleColor: Color(0xff03a9f4),
  ),
  fontFamily: GoogleFonts.firaSans().fontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
// #Endregion

// #Region themeLight
final ThemeData themeLight = ThemeData(
  useMaterial3: false,
  primarySwatch: const MaterialColor(4280452085, {
    50: Color(0xffe7f1fe),
    100: Color(0xffcee4fd),
    200: Color(0xff9dc8fb),
    300: Color(0xff6dadf8),
    400: Color(0xff3c91f6),
    500: Color(0xff0b76f4),
    600: Color(0xff095ec3),
    700: Color(0xff074792),
    800: Color(0xff042f62),
    900: Color(0xff021831)
  }),
  brightness: Brightness.light,
  primaryColor: AccurateColor.blackAccurate,
  primaryColorLight: const Color(0xffe6e6e6),
  primaryColorDark: AccurateColor.blackAccurate,
  canvasColor: AccurateColor.whiteAccurate,
  scaffoldBackgroundColor: AccurateColor.whiteAccurate,
  cardColor: AccurateColor.whiteAccurate,
  dividerColor: const Color(0x524d4d4d),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  // selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: const Color(0xff717684),
  disabledColor: const Color(0xffC1C8DC),
  secondaryHeaderColor: const Color(0xffeaeaea),
  dialogBackgroundColor: AccurateColor.whiteAccurate,
  indicatorColor: const Color(0xff2283F5),
  hintColor: const Color.fromRGBO(224, 224, 224, 1),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AccurateColor.whiteAccurate,
  ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
    color: Color(0xff2283F5),
  ),
  colorScheme: const ColorScheme(
    primary: Color(0xff2283f5),
    primaryContainer: Color(0xff074792),
    secondary: Color(0xff2283F5),
    secondaryContainer: Color(0xffE8F4FC),
    surface: AccurateColor.whiteAccurate,
    background: Color(0xfffafafb),
    error: Color(0xffd32f2f),
    onPrimary: AccurateColor.blackAccurate,
    onSecondary: AccurateColor.whiteAccurate,
    onSurface: Color(0xff717684),
    onBackground: AccurateColor.whiteAccurate,
    onError: AccurateColor.whiteAccurate,
    brightness: Brightness.light,
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88.0,
    height: 36.0,
    padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 16.0, right: 16.0),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff717684),
        width: 0.0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: AccurateColor.gray,
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    colorScheme: ColorScheme(
      primary: Color(0xff2283f5),
      primaryContainer: Color(0xff074792),
      secondary: Color(0xff0b76f4),
      secondaryContainer: Color(0xff074792),
      surface: AccurateColor.whiteAccurate,
      background: Color(0xff9dc8fb),
      error: Color(0xffd32f2f),
      onPrimary: AccurateColor.blackAccurate,
      onSecondary: AccurateColor.whiteAccurate,
      onSurface: Color(0xff717684),
      onBackground: AccurateColor.whiteAccurate,
      onError: AccurateColor.whiteAccurate,
      brightness: Brightness.light,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  ),
  primaryTextTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: AccurateColor.black30),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AccurateColor.black30),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AccurateColor.black30),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AccurateColor.black30),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 15),
    errorStyle: TextStyle(
      color: Color(0xffd32f2f),
      fontSize: 10,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AccurateColor.blackAccurate,
    opacity: 1.0,
    size: 20.0,
  ),
  primaryIconTheme: const IconThemeData(
    color: AccurateColor.blackAccurate,
    opacity: 1.0,
    size: 20.0,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: Color(0xff717684),
    inactiveTrackColor: Color(0x3dfdfdfd),
    disabledActiveTrackColor: Color(0x524d4d4d),
    disabledInactiveTrackColor: Color(0x1f4d4d4d),
    activeTickMarkColor: Color(0x8ae6e6e6),
    inactiveTickMarkColor: Color(0x8afdfdfd),
    disabledActiveTickMarkColor: Color(0x1fe6e6e6),
    disabledInactiveTickMarkColor: Color(0x1f4d4d4d),
    thumbColor: Color(0xff717684),
    disabledThumbColor: Color(0x524d4d4d),
    thumbShape: RoundSliderThumbShape(),
    overlayColor: Color(0x29fdfdfd),
    valueIndicatorColor: Color(0xff717684),
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.onlyForDiscrete,
    valueIndicatorTextStyle: TextStyle(
      color: AccurateColor.whiteAccurate,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  tabBarTheme: const TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color(0xff2283F5),
    labelStyle: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    unselectedLabelColor: AccurateColor.blackAccurate,
    unselectedLabelStyle: TextStyle(
      color: AccurateColor.blackAccurate,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    titleSpacing: 20,
    backgroundColor: AccurateColor.whiteAccurate,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xff2283F5),
    unselectedItemColor: AccurateColor.blackAccurate,
    backgroundColor: AccurateColor.whiteAccurate,
    showUnselectedLabels: true,
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelPadding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 8.0, right: 8.0),
    labelStyle: TextStyle(
      color: Color(0xde000000),
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: AccurateColor.gray,
    selectedColor: Color(0xffE7F3FB),
    shape: StadiumBorder(
        side: BorderSide(
          color: Color(0xff717684),
          width: 0.0,
          style: BorderStyle.none,
        )),
  ),
  dialogTheme: const DialogThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff717684),
          width: 0.0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      )),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    shadowColor: Colors.black.withOpacity(0.4),
    elevation: 1,
    margin: EdgeInsets.zero,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff4285f4),
    selectionColor: Color(0xffcccccc),
    selectionHandleColor: Color(0xffb3b3b3),
  ),
  fontFamily: GoogleFonts.firaSans().fontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
// #Endregion

//* AccurateColor
class AccurateColor {
  // WHITE
  static const Color whiteAccurate = Color(0xFFFFFFFF);

  // GREEN
  static const Color green01 = Color(0xFF1B881F);
  static const Color green02 = Color(0xFF03A919);
  static const Color green03 = Color(0xFFDDFFE0);
  static const Color greenA1 = Color(0xFF41C105);
  static const Color greenA2 = Color(0xFFB1E1B5);
  static const Color greenReportPlusBar = Color(0xFF4CAF50);
  static const Color greenRevenueBar = Color(0xFF75D279);

  // ORANGE
  static const Color orange01 = Color(0xFFE36D00);
  static const Color orange02 = Color(0xFFFF8900);
  static const Color orange03 = Color(0xFFFFE9CE);
  static const Color orangeA1 = Color(0xFFEC3B03);
  static const Color orangeA2 = Color(0xFFFC7044);
  static const Color orangeA3 = Color(0xFFFF9432);

  // YELLOW
  static const Color yellow01 = Color(0xFFE09400);
  static const Color yellow02 = Color(0xFFFF9900);
  static const Color yellow03 = Color(0xFFFFF0C2);
  static const Color yellowCostBar = Color(0xFFFFC107);

  // RED
  static const Color red01 = Color(0xFFE33600);
  static const Color red02 = Color(0xFFFF5722);
  static const Color red03 = Color(0xFFFFEAE3);
  static const Color redA1 = Color(0xFFFFD8D6);
  static const Color redAccurate = Color(0xFFF44336);

  // BLUE
  static const Color blue01 = Color(0xFF006FC7);
  static const Color blue02 = Color(0xFF008AF9);
  static const Color blue03 = Color(0xFFDEEFFD);
  static const Color blueA1 = Color(0xFF0185B0);
  static const Color blueA2 = Color(0xFF90CAF9);
  static const Color blueAccurate = Color(0xFF2196F3);
  static const Color blueCalendar = Color(0xFF0077D5);
  static const Color blueSecondary = Color(0xFF0B81DE);
  static const Color blueBgPercent = Color(0xFFD6F5FF);

  // BLACK
  // static const Color blackAccurate = Color(0XFF484848);
  static const Color black50 = Color(0xFF9E9E9E);
  static const Color black40 = Color(0xFFDDDDDD);
  static const Color black30 = Color(0xFFEDEDED);
  static const Color black20 = Color(0xFFF3F3F3);
  static const Color blackOverlay = Color(0xFF000000);
  static const Color blackAccurate = Color(0xFF484848);

  // GRAY
  static const Color gray = Color(0xFFE0E0E0);
  static const Color grayA1 = Color(0xFFF0F0F0);
  static const Color grayA2 = Color(0xFFADABAB);
  static const Color grayBlue = Color(0xFFF0F1F6);

  // ICON COLORS
  static const Color panah = Color(0xFF6D6D6D);

  // #Region Gradient colors
  static const List<Color> bgOpacityDark = [
    Color.fromRGBO(2, 23, 82, 0.6),
    Color.fromRGBO(2, 23, 82, 0.5),
  ];

  static const List<Color> bgOpacityLight = [
    Color.fromRGBO(199, 199, 199, 0.7),
    Color.fromRGBO(199, 199, 199, 0.6),
  ];

  static const List<Color> blueGrad = [
    Color(0xFF187adf),
    Color(0xFF00eaf8),
  ];

  static const List<Color> redGrad = [
    Color(0xFF8d0914),
    Color(0xFFf75389),
  ];

  static const List<Color> greenGrad = [
    Color(0xFF0799a7),
    Color(0xFF2ce2f3),
  ];

  static const List<Color> yellowGrad = [
    Color(0xFFffc500),
    Color(0xFFc21500),
  ];

  static const List<Color> purpleGrad = [
    Color(0xFF450669),
    Color(0xFFbb958f),
  ];

  static const List<Color> greyGrad = [
    Color(0xFF444647),
    Color(0xFFdcdfe0),
  ];

  static const List<Color> blackGrad = [
    AccurateColor.grayA1,
    Color(0xFFdcdfe0),
  ];

  static const List<Color> armyGrad = [
    Color(0xFF021f09),
    Color(0xFF1ad145),
  ];

  static const List<Color> purple2Grad = [
    Color(0xFF060761),
    Color(0xFF4245ee),
  ];

  static const List<Color> oceanGrad = [
    Color(0xFF05263b),
    Color(0xFF2499e2),
  ];

  static const List<Color> whiteGrad = [
    Color(0xFFf9f9f9),
    AccurateColor.whiteAccurate,
  ];

  static const blue2 = Color(0xFF1976D2);
  static const List<Color> blueGrad2 = [
    Color(0xFF2E58A2),
    AccurateColor.blue2,
  ];

  static const red2 = Color(0xFFBB477E);
  static const List<Color> redGrad2 = [Color(0xFFBB377D), AccurateColor.red2];

  static const green2 = Color(0xFFADD100);
  static const List<Color> greenGrad2 = [
    Color(0xFF7B920A),
    AccurateColor.green2,
  ];

  static const yellow2 = Color(0xFFe0b00f);
  static const List<Color> yellowGrad2 = [
    Color(0xFFffc500),
    AccurateColor.yellow2,
  ];

  static const orange2 = Color(0xFFff4472);
  static const List<Color> orangeGrad2 = [
    Color(0xFFff9472),
    AccurateColor.orange2,
  ];

  static const purple2 = Color(0xFFbb958f);
  static const List<Color> purpleGrad2 = [
    Color(0xFF450669),
    AccurateColor.purple2,
  ];

  static const List<Color> blueSoft = [
    Color(0xFF96DEDA),
    Color(0xFF50C9C3),
  ];

  static const List<Color> oceanGrad2 = [
    Color(0xFF7ac8f3),
    Color(0xFF5ea9d1),
  ];

  static const bluePrimary = Color(0xFF3B6DAB);
  static List<Color> bluePrimaryGrad = [
    AccurateColor.bluePrimary.withOpacity(0.5),
    AccurateColor.bluePrimary.withOpacity(0.5),
  ];
// #Endregion
}
