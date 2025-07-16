import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sadasbor_v2/features/dashboard/data/models/posts/dashboard_posts_model.dart';
import 'package:sadasbor_v2/features/dashboard/domain/usecases/posts/dashboard_posts_param.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/posts/dashboard_posts_entity.dart';
import '../../../domain/usecases/posts/dashboard_posts_usecase.dart';

part 'dashboard_posts_annoucement_state.dart';
part 'dashboard_posts_annoucement_cubit.freezed.dart';

@injectable
class DashboardPostsAnnouncementCubit extends Cubit<DashboardPostsAnnoucementState> {
  DashboardPostsAnnouncementCubit(this.dashboardPostsUseCase) : super(DashboardPostsAnnoucementInitial());
  final DashboardPostsUseCase dashboardPostsUseCase;

  // Variable untuk menyimpan announcements
  List<DashboardPostsEntity> announcements = [];
  Future<List<DashboardPostsEntity>> fetchPostsAnnoucement() async {
    emit(DashboardPostsAnnoucementLoading());
    final result = await dashboardPostsUseCase(DashboardPostsParam(page: 1, category: 'announcement'));

    return result.fold(
          (failure) => throw Exception('Failed to fetch posts: $failure'),
          (response) {
        final data = response.data.toDomainList();
        final meta = response.pagination;

        // Filter announcements dari data
        announcements = data;
        // Emit state untuk keperluan UI lain
        emit(DashboardPostsAnnoucementSuccess(data: data));

        // Selalu return data yang ada dari API
        return data;
      },
    );
  }
  List<DashboardPostsEntity> getAnnouncements() {
    return announcements;
  }
}
