import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../core/models/paging/paging_model.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../data/models/posts/dashboard_posts_model.dart';
import '../../entities/posts/dashboard_posts_entity.dart';
import '../../repositories/dashboard_repository.dart';


@lazySingleton
class DashboardPostsUseCase
    implements UseCase<PagingModel<DashboardPostsModel>, int> {
  DashboardPostsUseCase(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, PagingModel<DashboardPostsModel>>> call(
      int page) async {
    return repository.getPosts(page);
  }
}
