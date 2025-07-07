import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:sadasbor_v2/core/usecases/usecase.dart';
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

  Future<void> getPosts({
    required int pageKey,
    required PagingState<int, DashboardPostsEntity>
    currentState, // Ganti PagingController dengan PagingState
    required Function(PagingState<int, DashboardPostsEntity>)
    updateState, // Callback untuk update state
    bool retryData = true,
    String? keywords,
  }) async {
    emit(_Loading());

    final result = await dashboardPostsUseCase(NoParam());

    return result.fold(
      (l) {
        emit(_Failed(failure: l));
        // Update state dengan error
        updateState(currentState.copyWith(error: l, isLoading: false));
      },
      (r) {
        final List<DashboardPostsEntity> data = r.data.toDomainList();
        // final isLastPage = r.length < r.pagination!.pageSize;
            final isLastPage = r.pagination?.currentPage == r.pagination?.lastPage;
        // Update menggunakan copyWith method
        if (isLastPage) {
          updateState(
            currentState.copyWith(
              pages: [...?currentState.pages, data],
              // Tambahkan page baru
              keys: [...?currentState.keys, pageKey],
              // Tambahkan key baru
              hasNextPage: false,
              // Tandai sebagai halaman terakhir
              isLoading: false,
              error: null,
            ),
          );
        } else {
          updateState(
            currentState.copyWith(
              pages: [...?currentState.pages, data],
              // Tambahkan page baru
              keys: [...?currentState.keys, pageKey],
              // Tambahkan key baru
              hasNextPage: true,
              // Masih ada halaman selanjutnya
              isLoading: false,
              error: null,
            ),
          );
        }

        // if (retryData) {
        //   listData = r.data;
        // } else {
        //   listData.addAll(r.data);
        // }

        emit(_Success(data: data));
      },
    );
  }
}
