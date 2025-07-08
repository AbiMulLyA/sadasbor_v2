import 'package:dartz/dartz.dart';
import 'package:sadasbor_v2/features/dashboard/domain/entities/posts/dashboard_posts_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/paging/paging_model.dart';
import '../../data/models/posts/dashboard_posts_model.dart';


abstract class DashboardRepository {
  Future<Either<Failure, PagingModel<DashboardPostsModel>>> getPosts(int page);

}
