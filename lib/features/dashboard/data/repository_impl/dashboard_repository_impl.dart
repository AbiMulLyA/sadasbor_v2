import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sadasbor_v2/core/usecases/usecase.dart';
import 'package:sadasbor_v2/features/dashboard/data/datasources/remote/dashboard_bkpsdm_remote_data_source.dart';
import 'package:sadasbor_v2/features/dashboard/data/models/posts/dashboard_posts_model.dart';
import 'package:sadasbor_v2/features/dashboard/domain/usecases/posts/dashboard_posts_param.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/paging/paging_model.dart';
import '../../../../core/utils/connection_util.dart';
import '../../../../core/utils/error_util.dart';
import '../../domain/repositories/dashboard_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final ConnectionUtil connectionUtil;
  Dio dio;
  DashboardBkpsdmRemoteDataSource bkpsdmRemoteDataSource;

  DashboardRepositoryImpl({
    required this.connectionUtil,
    required this.dio,
    required this.bkpsdmRemoteDataSource,
  });

  @override
  Future<Either<Failure, PagingModel<DashboardPostsModel>>> getPosts(
    DashboardPostsParam param,
  ) async {
    if (await connectionUtil.checkConnection()) {
      debugPrint('$runtimeType.profile: 1');
      try {

        final httpResponse = await bkpsdmRemoteDataSource.getPosts(param);
        debugPrint("$runtimeType :${httpResponse.response}");

        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return Right(httpResponse.data);
        }

        debugPrint('$runtimeType.profile: 2');
        return Left(
          RemoteFailure(
            code: httpResponse.response.data['code'] as int,
            message: httpResponse.response.data['message'] as String,
            type: ErrorType.responseInvalid,
          ),
        );
      } on DioException catch (error, stackTrace) {
        debugPrint('$runtimeType: $error');
        debugPrint('$runtimeType: $stackTrace');

        return left(ErrorUtil.dioCatchError(error));
      } catch (error, stackTrace) {
        debugPrint('$runtimeType: $error');
        debugPrint('$runtimeType: $stackTrace');
        return left(LocalFailure());
      }
    } else {
      debugPrint('$runtimeType.profile: 4 - NoInternetFailure');
      return const Left(NoInternetFailure());
    }
  }
}
