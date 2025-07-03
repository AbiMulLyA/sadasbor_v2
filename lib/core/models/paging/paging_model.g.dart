// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingModel<T> _$PagingModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PagingModel<T>(
  data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
  pagination: json['meta'] == null
      ? null
      : BasePagingModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PagingModelToJson<T>(
  PagingModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'meta': instance.pagination,
};
