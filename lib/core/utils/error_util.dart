// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:sadasbor_v2/core/extensions/context_extension.dart';

import '../../config/theme/theme.dart';
import '../components/space/space_component.dart';
import '../error/failures.dart';

enum ErrorType {
  noInternet,
  noResponse,
  responseInvalid,
  requestFailed,
  systemOffline,
  unKnownError,
  timeoutError,
  authError,
  sessionError,
  serverError,
  backendError,
  dtoParsingError,
}

const String kDatabaseName = 'app_database.db';
const String kNoInternet = 'Tidak ada koneksi internet..';
const String kHasInternet = 'Ok, Terhubung ke internet..';
const String kLocalError = 'Local Error';
const String kUnknownError = 'Unknown Error';
const String kTimeoutError = 'Request Timeout';
@lazySingleton
class ErrorUtil {
  //* Error Handling Widget
  Widget widgetError(BuildContext context, FlutterErrorDetails? error) {
    if (kDebugMode) {
      return Scaffold(
        backgroundColor: AccurateColor.whiteAccurate,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/ic_crash.svg'),
                SpaceComponentHeight(height: 24),
                Text(
                  context.tr("global_internal_mistake"),
                  style: context.textTheme.headlineLarge,
                ),
                SpaceComponentHeight(height: 16),
                Text(
                  context.tr('global_suffer_internal_error'),
                  style: context.textTheme.bodyLarge,
                ),
                SpaceComponentHeight(height: 24),
                // ButtonComponent(
                //   text: context.tr('global_closed'),
                //   onPressed: () => exit(0),
                // ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AccurateColor.whiteAccurate,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/ic_crash.svg'),
              SpaceComponentHeight(height: 24),
              Text(
                context.tr("global_internal_mistake"),
                style: context.textTheme.headlineLarge,
              ),
              SpaceComponentHeight(height: 16),
              Text(
                context.tr('global_suffer_internal_error'),
                style: context.textTheme.bodyLarge,
              ),
              SpaceComponentHeight(height: 24),
              // ButtonComponent(
              //   text: context.tr('global_closed'),
              //   onPressed: () => exit(0),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  //* DioException Handling Exeptions
  static Failure dioCatchError(DioError e) {
    if (e.response != null && e.response!.data is! String) {
      return RemoteFailure(
        code: e.response!.data['code'] as int,
        message: e.response!.data['message'] as String,
        type: ErrorType.requestFailed,
      );
    } else {
      if (e.type == DioErrorType.connectionTimeout) {
        return TimeoutFailure(message: e.error.toString());
      } else if (e.type == DioErrorType.badResponse) {
        return RemoteFailure(
          code: 303,
          message: e.error.toString(),
          type: ErrorType.responseInvalid,
        );
      } else {
        return const UnknownFailure();
      }
    }
  }
}
