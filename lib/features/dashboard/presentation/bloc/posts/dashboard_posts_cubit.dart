import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sadasbor_v2/features/dashboard/data/models/posts/dashboard_posts_model.dart';
import 'package:sadasbor_v2/features/dashboard/domain/entities/posts/dashboard_posts_entity.dart';
import 'package:sadasbor_v2/features/dashboard/domain/usecases/posts/dashboard_posts_usecase.dart';

import '../../../../../core/error/failures.dart';

part 'dashboard_posts_cubit.freezed.dart';
part 'dashboard_posts_state.dart';

@injectable
class DashboardPostsCubit extends Cubit<DashboardPostsState> {
  DashboardPostsCubit(this.dashboardPostsUseCase) : super(_Initial());

  final DashboardPostsUseCase dashboardPostsUseCase;
  Future<List<DashboardPostsEntity>> fetchPostsForPagination({
    required int pageKey,
    String? keywords,
  }) async {
    final result = await dashboardPostsUseCase(pageKey);

    return result.fold(
          (failure) => throw Exception('Failed to fetch posts: $failure'),
          (response) {
        final data = response.data.toDomainList();
        final meta = response.pagination;

        // Emit state untuk keperluan UI lain
        emit(_Success(data: data));

        // Selalu return data yang ada dari API
        return data;

        // PagingController akan detect last page melalui getNextPageKey:
        // - Jika currentPage >= lastPage, getNextPageKey return null
        // - Atau jika data.length < pageSize (10), otomatis last page
      },
    );
  }
}
