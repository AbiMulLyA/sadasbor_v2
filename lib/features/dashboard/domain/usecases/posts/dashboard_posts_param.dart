import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_posts_param.freezed.dart';
part 'dashboard_posts_param.g.dart';

@freezed
sealed class DashboardPostsParam with _$DashboardPostsParam {
  const factory DashboardPostsParam({
    int? page,
   @JsonKey(includeIfNull: false) String? category,
  }) = _DashboardPostsParam;

  factory DashboardPostsParam.fromJson(Map<String, dynamic> json) =>
      _$DashboardPostsParamFromJson(json);   // ← nama harus sama persis
}
