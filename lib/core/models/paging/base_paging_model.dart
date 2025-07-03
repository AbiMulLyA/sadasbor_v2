// lib/core/models/paging/base_paging_model.dart
// (Sesuaikan path jika berbeda)

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_paging_model.g.dart'; // Nama file generated juga akan mengikuti nama kelas utama

@JsonSerializable()
class BasePagingModel extends Equatable { // NAMA KELAS DIUBAH DI SINI
  const BasePagingModel({ // DAN DI SINI
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });

  @JsonKey(name: 'current_page')
  final int? currentPage;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  @JsonKey(name: 'per_page')
  final int? perPage;

  final int? total;

  factory BasePagingModel.fromJson(Map<String, dynamic> json) =>
      _$BasePagingModelFromJson(json); // NAMA FUNGSI GENERATED DIUBAH DI SINI

  Map<String, dynamic> toJson() => _$BasePagingModelToJson(this); // NAMA FUNGSI GENERATED DIUBAH DI SINI

  @override
  List<Object?> get props => [
    currentPage,
    lastPage,
    perPage,
    total,
  ];

  @override
  bool get stringify => true;

  BasePagingModel copyWith({ // NAMA KELAS DIUBAH DI SINI (Return type)
    int? currentPage,
    int? lastPage,
    int? perPage,
    int? total,
  }) {
    return BasePagingModel( // DAN DI SINI (Saat membuat instance baru)
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
    );
  }
}