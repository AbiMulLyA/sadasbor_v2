// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_paging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePagingModel _$BasePagingModelFromJson(Map<String, dynamic> json) =>
    BasePagingModel(
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BasePagingModelToJson(BasePagingModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
