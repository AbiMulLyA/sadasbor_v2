import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sadasbor_v2/core/models/paging/paging_model.dart';
import 'package:sadasbor_v2/features/dashboard/domain/entities/posts/dashboard_posts_entity.dart';

import '../../models/posts/dashboard_posts_model.dart';

part 'dashboard_bkpsdm_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class DashboardBkpsdmRemoteDataSource {
  @factoryMethod
  factory DashboardBkpsdmRemoteDataSource(
     @Named('BkpsdmDio') Dio dio,
      ) = _DashboardBkpsdmRemoteDataSource;

  @GET('/posts')
  Future<HttpResponse<PagingModel<DashboardPostsModel>>> getPosts();
}
