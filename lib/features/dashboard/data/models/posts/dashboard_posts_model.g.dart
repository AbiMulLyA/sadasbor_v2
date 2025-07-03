// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardPostsModel _$DashboardPostsModelFromJson(Map<String, dynamic> json) =>
    _DashboardPostsModel(
      slug: json['slug'] as String?,
      postTitle: json['post_title'] as String?,
      postDate: json['post_date'] as String?,
      featureImage: json['feature_image'] as String?,
      authorName: json['author_name'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      announcement: json['announcement'] as bool?,
    );

Map<String, dynamic> _$DashboardPostsModelToJson(
  _DashboardPostsModel instance,
) => <String, dynamic>{
  'slug': instance.slug,
  'post_title': instance.postTitle,
  'post_date': instance.postDate,
  'feature_image': instance.featureImage,
  'author_name': instance.authorName,
  'categories': instance.categories,
  'announcement': instance.announcement,
};
