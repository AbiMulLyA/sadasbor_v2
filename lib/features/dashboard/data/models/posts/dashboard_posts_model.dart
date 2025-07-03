// lib/features/dashboard/data/models/posts/dashboard_posts_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/posts/dashboard_posts_entity.dart';

part 'dashboard_posts_model.freezed.dart'; // Akan digenerate oleh build_runner
part 'dashboard_posts_model.g.dart';    // Akan digenerate oleh build_runner

@freezed
sealed class DashboardPostsModel with _$DashboardPostsModel {
  const factory DashboardPostsModel({
    @JsonKey(name: 'slug') final String? slug,
    @JsonKey(name: 'post_title') final String? postTitle,
    @JsonKey(name: 'post_date') final String? postDate, // Anda mungkin ingin mengubah ini menjadi DateTime nanti
    @JsonKey(name: 'feature_image') final String? featureImage,
    @JsonKey(name: 'author_name') final String? authorName,
    @JsonKey(name: 'categories') final List<String?>? categories,
    @JsonKey(name: 'announcement') final bool? announcement,
  }) = _DashboardPostsModel;

  factory DashboardPostsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardPostsModelFromJson(json);
}
extension DashboardPostsModelX on DashboardPostsModel {
  DashboardPostsEntity toDomain() {
    return DashboardPostsEntity(
      slug: slug,
      postTitle: postTitle,
      postDate: postDate, // Jika tipe di Entity berbeda (misal DateTime), lakukan konversi di sini
      featureImage: featureImage,
      authorName: authorName,
      categories: categories, // Jika tipe list berbeda, lakukan konversi per item jika perlu
      announcement: announcement,
    );
  }
}

// Jika Anda memiliki list model dan ingin mengkonversinya ke list entity:
extension DashboardPostsModelListX on List<DashboardPostsModel?> {
  List<DashboardPostsEntity> toDomainList() {
    return where((model) => model != null) // Filter out null models if the list can contain them
        .map((model) => model!.toDomain()) // Use the extension above
        .toList();
  }
}

// Atau jika list model tidak mungkin mengandung null item, tapi list itu sendiri bisa null:
extension NullableDashboardPostsModelListX on List<DashboardPostsModel>? {
  List<DashboardPostsEntity>? toDomainListOrNull() {
    return this?.map((model) => model.toDomain()).toList();
  }
}