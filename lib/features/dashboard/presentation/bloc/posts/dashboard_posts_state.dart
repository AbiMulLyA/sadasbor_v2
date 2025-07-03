part of 'dashboard_posts_cubit.dart';

@freezed
class DashboardPostsState with _$DashboardPostsState {
  const factory DashboardPostsState.initial() = _Initial;
  const factory DashboardPostsState.loading() = _Loading;
  const factory DashboardPostsState.failed({required Failure failure}) = _Failed;
  const factory DashboardPostsState.success(
      {required List<DashboardPostsEntity> data}) = _Success;
}
