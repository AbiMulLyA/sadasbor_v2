// lib/core/models/paging/paging_model.dart

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Pastikan path import ini benar menuju definisi BasePagingModel Anda
import 'base_paging_model.dart';

part 'paging_model.g.dart'; // Akan digenerate oleh build_runner

@JsonSerializable(genericArgumentFactories: true) // Penting untuk deserialisasi List<T>
class PagingModel<T> extends Equatable {
  const PagingModel({
    this.data = const [], // Default value untuk data
    this.pagination,
  });

  @JsonKey(name: 'data') // Atau sesuaikan jika nama field di JSON berbeda
  final List<T> data;

  @JsonKey(name: 'meta') // pagination akan diambil dari field "meta" di JSON
  final BasePagingModel? pagination;

  // Factory constructor untuk deserialisasi dari JSON
  factory PagingModel.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT, // Fungsi untuk deserialisasi T
      ) =>
      _$PagingModelFromJson<T>(json, fromJsonT);

  // Method untuk serialisasi ke JSON (opsional, tapi baik untuk dimiliki)
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PagingModelToJson<T>(this, toJsonT);

  @override
  List<Object?> get props => [data, pagination];

  @override
  bool get stringify => true; // Untuk kemudahan debugging dengan print()

  // copyWith method manual (Equatable tidak menyediakannya secara otomatis)
  PagingModel<T> copyWith({
    List<T>? data,
    BasePagingModel? pagination,
    bool? paginationShouldBeNull, // Tambahan untuk handle kasus ingin set pagination jadi null
  }) {
    return PagingModel<T>(
      data: data ?? this.data,
      pagination: paginationShouldBeNull == true ? null : pagination ?? this.pagination,
    );
  }
}