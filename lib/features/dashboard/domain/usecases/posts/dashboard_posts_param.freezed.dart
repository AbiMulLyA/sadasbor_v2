// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_posts_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardPostsParam {

 int? get page;@JsonKey(includeIfNull: false) String? get category;
/// Create a copy of DashboardPostsParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardPostsParamCopyWith<DashboardPostsParam> get copyWith => _$DashboardPostsParamCopyWithImpl<DashboardPostsParam>(this as DashboardPostsParam, _$identity);

  /// Serializes this DashboardPostsParam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostsParam&&(identical(other.page, page) || other.page == page)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,category);

@override
String toString() {
  return 'DashboardPostsParam(page: $page, category: $category)';
}


}

/// @nodoc
abstract mixin class $DashboardPostsParamCopyWith<$Res>  {
  factory $DashboardPostsParamCopyWith(DashboardPostsParam value, $Res Function(DashboardPostsParam) _then) = _$DashboardPostsParamCopyWithImpl;
@useResult
$Res call({
 int? page,@JsonKey(includeIfNull: false) String? category
});




}
/// @nodoc
class _$DashboardPostsParamCopyWithImpl<$Res>
    implements $DashboardPostsParamCopyWith<$Res> {
  _$DashboardPostsParamCopyWithImpl(this._self, this._then);

  final DashboardPostsParam _self;
  final $Res Function(DashboardPostsParam) _then;

/// Create a copy of DashboardPostsParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DashboardPostsParam implements DashboardPostsParam {
  const _DashboardPostsParam({this.page, @JsonKey(includeIfNull: false) this.category});
  factory _DashboardPostsParam.fromJson(Map<String, dynamic> json) => _$DashboardPostsParamFromJson(json);

@override final  int? page;
@override@JsonKey(includeIfNull: false) final  String? category;

/// Create a copy of DashboardPostsParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardPostsParamCopyWith<_DashboardPostsParam> get copyWith => __$DashboardPostsParamCopyWithImpl<_DashboardPostsParam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardPostsParamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardPostsParam&&(identical(other.page, page) || other.page == page)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,category);

@override
String toString() {
  return 'DashboardPostsParam(page: $page, category: $category)';
}


}

/// @nodoc
abstract mixin class _$DashboardPostsParamCopyWith<$Res> implements $DashboardPostsParamCopyWith<$Res> {
  factory _$DashboardPostsParamCopyWith(_DashboardPostsParam value, $Res Function(_DashboardPostsParam) _then) = __$DashboardPostsParamCopyWithImpl;
@override @useResult
$Res call({
 int? page,@JsonKey(includeIfNull: false) String? category
});




}
/// @nodoc
class __$DashboardPostsParamCopyWithImpl<$Res>
    implements _$DashboardPostsParamCopyWith<$Res> {
  __$DashboardPostsParamCopyWithImpl(this._self, this._then);

  final _DashboardPostsParam _self;
  final $Res Function(_DashboardPostsParam) _then;

/// Create a copy of DashboardPostsParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,Object? category = freezed,}) {
  return _then(_DashboardPostsParam(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
