part of 'dashboard_posts_annoucement_cubit.dart';

@freezed
class DashboardPostsAnnoucementState with _$DashboardPostsAnnoucementState {
  const factory DashboardPostsAnnoucementState.initial() = DashboardPostsAnnoucementInitial;
  const factory DashboardPostsAnnoucementState.loading() = DashboardPostsAnnoucementLoading;
  const factory DashboardPostsAnnoucementState.failed({required Failure failure}) = DashboardPostsAnnoucementFailed;
  const factory DashboardPostsAnnoucementState.success({
    required List<DashboardPostsEntity> data,
  }) = DashboardPostsAnnoucementSuccess;
}
