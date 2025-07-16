// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_posts_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardPostsParam _$DashboardPostsParamFromJson(Map<String, dynamic> json) =>
    _DashboardPostsParam(
      page: (json['page'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$DashboardPostsParamToJson(
  _DashboardPostsParam instance,
) => <String, dynamic>{
  'page': instance.page,
  if (instance.category case final value?) 'category': value,
};
