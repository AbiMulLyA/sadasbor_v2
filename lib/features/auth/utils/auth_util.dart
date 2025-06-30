
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../config/injector/injector.dart';
import '../../../core/utils/shared_preferences_util.dart';
import '../presentation/bloc/auth_bloc.dart';

@lazySingleton
class AuthUtil {
  // final SecureStorageUtil _storageUtil = getIt<SecureStorageUtil>();
  // final SettingPreferenceUtils _settingPreferenceUtils = getIt<SettingPreferenceUtils>();
  final SharedPreferencesUtil _sharedPreferencesUtil =
  getIt<SharedPreferencesUtil>();

  static const String prefKeyAccurateHost = 'ACCURATE_HOST';
  static const String prefKeySeenBoard = 'AOL_SEEN_ON_BOARD';
  static const String prefKeySelectedDB = 'AOL_SELECTED_DB';
  static const String pefKeyAolAccessToken = "AOL_ACCESS_TOKEN";
  static const String pefKeyAolRefreshToken = "AOL_REFRESH_TOKEN";
  static const String pefKeyAolUserName = "AOL_USER_NAME";
  static const String pefKeyAolUserEmail = "AOL_USER_EMAIL";
  static const String pefKeyAolDatabaseAlias = "AOL_DATABASE_ALIAS";
  static const String pefKeyAolIdBiling = "AOL_ID_BILLING";
  static const String pefKeyAolImageDatabaseProfile =
      "AOL_IMAGE_DATABASE_PROFILE";
  static const String pefKeyAolPhoneNumber = "AOL_PHONE_NUMBER";
  static const String pefKeyAolPin = "pin";
  static const String pefKeyAolLastRefreshToken = "AOL_LAST_REFRESH_TOKEN";
  static const int refreshTokenInterval = 24 * 60 * 60 * 1000;

  // #Region Accurate Host
  Future<void> setAccurateHost(String value) async {
    await _sharedPreferencesUtil.setString(prefKeyAccurateHost, value);
  }

  String? getAccurateHost() {
    final String? host = _sharedPreferencesUtil.getString(prefKeyAccurateHost);
    return host;
  }

  // #Region AccessToken
  Future<void> setAccessToken(String value) async {
    await _sharedPreferencesUtil.setString(pefKeyAolAccessToken, value);
    // await _storageUtil.write(pefKeyAolAccessToken, value);

    await Future.delayed(const Duration(seconds: 1));
  }

  String? getAccessToken() {
    final String? token =
    _sharedPreferencesUtil.getString(pefKeyAolAccessToken);
    // final String? token = await _storageUtil.read(pefKeyAolAccessToken);

    // await Future.delayed(const Duration(seconds: 1));
    return token;
  }

  Future<bool> hasAccessToken() async {
    final String? token =
    _sharedPreferencesUtil.getString(pefKeyAolAccessToken);
    // final String? token = await _storageUtil.read(pefKeyAolAccessToken);

    // await Future.delayed(const Duration(seconds: 1));

    return token != null && token != '';
  }

  Future<void> deleteAccessToken() async {
    await _sharedPreferencesUtil.clearKey(pefKeyAolAccessToken);
    // await _storageUtil.delete(pefKeyAolAccessToken);

    await Future.delayed(const Duration(seconds: 1));
  }

  // #Endregion

  // #Region SeenOnBoard
  Future<void> setSeenOnBoard({bool value = true}) async {
    _sharedPreferencesUtil.setBool(prefKeySeenBoard, value: value);

    await Future.delayed(const Duration(seconds: 1));
  }

  Future<bool> hasSeenOnBoard() async {
    final bool hasSeenOnBoard =
    _sharedPreferencesUtil.getBool(prefKeySeenBoard);
    await Future.delayed(const Duration(seconds: 1));

    return hasSeenOnBoard;
  }

  // #Endregion

  // #Region SelectedDB
  Future<void> setHasSelectedDB({bool value = true}) async {
    _sharedPreferencesUtil.setBool(prefKeySelectedDB, value: value);

    await Future.delayed(const Duration(seconds: 1));
  }

  Future<bool> hasSelectedDB() async {
    final bool hasSelectedDB =
    _sharedPreferencesUtil.getBool(prefKeySelectedDB);
    await Future.delayed(const Duration(seconds: 1));

    return hasSelectedDB;
  }

  // #Endregion

  // #Region Logout
  static void logout(BuildContext context) {
    context.read<AuthBloc>().add(LoggedOutEv());
    debugPrint('AuthUtil.logout');
  }

  Future<void> deleteLogout() async {
    await deleteAccessToken();

    debugPrint('AuthUtil.deleteLogout');
  }
}
