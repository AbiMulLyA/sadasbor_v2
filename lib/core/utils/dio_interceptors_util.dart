import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioInterceptorsUtil extends QueuedInterceptorsWrapper {
  DioInterceptorsUtil(Dio dio);

  // final Dio _dio;
  // final AuthUtil _authUtil = getIt<AuthUtil>();

  // final SessionUtil _sessionUtil = getItSessionUtil>();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /*debugPrint(
        "--> onRequest Start ${options.method.toUpperCase()} - ${options.baseUrl}${options.path}");

    debugPrint("Headers: ${options.headers.toString()}");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));

    debugPrint("Location: ${options.headers['location'].toString()}");
    debugPrint("queryParameters: ${options.queryParameters.length}");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));

    if (options.data != null) {
      debugPrint("Body: ${options.data}");
      if (options.data is FormData) {
        final form = options.data as FormData;
        debugPrint(
            'Body: ${form.fields.toList()} -- file: ${form.files.toList()}');
      }
    }

    debugPrint("--> onRequest End ${options.method.toUpperCase()}");*/

    // if (options.path.contains('api/')) {
    //   final String? accessToken = _authUtil.getAccessToken();
    //   debugPrint('requiresToken - accessToken 2: $accessToken');
    //
    //   options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    // }

    // if (options.path.contains('accurate/')) {
    //   final session = await _sessionUtil.getDbSession();
    //  options.data =
    // }

    //return super.onRequest(options, handler);
    /*  Future.delayed(const Duration(seconds: 2), () {
      handler.next(options);
    }); */
    handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    /*debugPrint(
        "--> onResponse Start ${response.requestOptions.method.toUpperCase()} - ${response.requestOptions.baseUrl}${response.requestOptions.path}");

    debugPrint("Headers:");
    response.headers.forEach((k, v) => debugPrint('$k: $v'));

    debugPrint("Response: ${response.data}");

    debugPrint(
        "<-- onResponse End ${response.requestOptions.method.toUpperCase()}");

    _dio.interceptors.requestLock.clear();

    return super.onResponse(response, handler);*/

    if (response.data.toString().contains('invalid_token')) {
      return handler.reject(
        DioException(
          requestOptions: RequestOptions(path: ''),
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Sesi login anda telah berakhir',
        ),
      );
      // throw SessionInvalidException();
    }
    return handler.next(response);
  }
}

@override
Future onError(DioException dioError, ErrorInterceptorHandler handler) async {
  debugPrint(
    "<-- onError Start ${dioError.message} ${dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL'}",
  );

  debugPrint(
    "${dioError.response != null ? dioError.response!.data : 'Unknown Error'}",
  );
  debugPrint("<-- onError End");

  final int? responseCode = dioError.response != null
      ? dioError.response!.statusCode
      : 0;

  debugPrint('ERRROR HANDLER $responseCode --  $dioError');
}
