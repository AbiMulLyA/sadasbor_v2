// lib/features/dashboard/domain/entities/posts/dashboard_posts_entity.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_posts_entity.freezed.dart'; // Akan digenerate oleh build_runner

@freezed
sealed class DashboardPostsEntity with _$DashboardPostsEntity {
  const factory DashboardPostsEntity({
    final String? slug,
    final String? postTitle,
    final String? postDate, // Pertimbangkan menggunakan DateTime jika lebih sesuai di domain
    final String? featureImage,
    final String? authorName,
    final List<String?>? categories,
    final bool? announcement,
  }) = _DashboardPostsEntity;

}