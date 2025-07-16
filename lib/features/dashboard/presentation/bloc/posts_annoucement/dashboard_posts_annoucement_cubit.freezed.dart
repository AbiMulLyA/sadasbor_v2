// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_posts_annoucement_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardPostsAnnoucementState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostsAnnoucementState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardPostsAnnoucementState()';
}


}

/// @nodoc
class $DashboardPostsAnnoucementStateCopyWith<$Res>  {
$DashboardPostsAnnoucementStateCopyWith(DashboardPostsAnnoucementState _, $Res Function(DashboardPostsAnnoucementState) __);
}


/// @nodoc


class DashboardPostsAnnoucementInitial implements DashboardPostsAnnoucementState {
  const DashboardPostsAnnoucementInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostsAnnoucementInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardPostsAnnoucementState.initial()';
}


}




/// @nodoc


class DashboardPostsAnnoucementLoading implements DashboardPostsAnnoucementState {
  const DashboardPostsAnnoucementLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostsAnnoucementLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardPostsAnnoucementState.loading()';
}


}




/// @nodoc


class DashboardPostsAnnoucementFailed implements DashboardPostsAnnoucementState {
  const DashboardPostsAnnoucementFailed({required this.failure});
  

 final  Failure failure;

/// Create a copy of DashboardPostsAnnoucementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardPostsAnnoucementFailedCopyWith<DashboardPostsAnnoucementFailed> get copyWith => _$DashboardPostsAnnoucementFailedCopyWithImpl<DashboardPostsAnnoucementFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostsAnnoucementFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DashboardPostsAnnoucementState.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $DashboardPostsAnnoucementFailedCopyWith<$Res> implements $DashboardPostsAnnoucementStateCopyWith<$Res> {
  factory $DashboardPostsAnnoucementFailedCopyWith(DashboardPostsAnnoucementFailed value, $Res Function(DashboardPostsAnnoucementFailed) _then) = _$DashboardPostsAnnoucementFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$DashboardPostsAnnoucementFailedCopyWithImpl<$Res>
    implements $DashboardPostsAnnoucementFailedCopyWith<$Res> {
  _$DashboardPostsAnnoucementFailedCopyWithImpl(this._self, this._then);

  final DashboardPostsAnnoucementFailed _self;
  final $Res Function(DashboardPostsAnnoucementFailed) _then;

/// Create a copy of DashboardPostsAnnoucementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(DashboardPostsAnnoucementFailed(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class DashboardPostsAnnoucementSuccess implements DashboardPostsAnnoucementState {
  const DashboardPostsAnnoucementSuccess({required final  List<DashboardPostsEntity> data}): _data = data;
  

 final  List<DashboardPostsEntity> _data;
 List<DashboardPostsEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of DashboardPostsAnnoucementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardPostsAnnoucementSuccessCopyWith<DashboardPostsAnnoucementSuccess> get copyWith => _$DashboardPostsAnnoucementSuccessCopyWithImpl<DashboardPostsAnnoucementSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostsAnnoucementSuccess&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'DashboardPostsAnnoucementState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $DashboardPostsAnnoucementSuccessCopyWith<$Res> implements $DashboardPostsAnnoucementStateCopyWith<$Res> {
  factory $DashboardPostsAnnoucementSuccessCopyWith(DashboardPostsAnnoucementSuccess value, $Res Function(DashboardPostsAnnoucementSuccess) _then) = _$DashboardPostsAnnoucementSuccessCopyWithImpl;
@useResult
$Res call({
 List<DashboardPostsEntity> data
});




}
/// @nodoc
class _$DashboardPostsAnnoucementSuccessCopyWithImpl<$Res>
    implements $DashboardPostsAnnoucementSuccessCopyWith<$Res> {
  _$DashboardPostsAnnoucementSuccessCopyWithImpl(this._self, this._then);

  final DashboardPostsAnnoucementSuccess _self;
  final $Res Function(DashboardPostsAnnoucementSuccess) _then;

/// Create a copy of DashboardPostsAnnoucementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(DashboardPostsAnnoucementSuccess(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DashboardPostsEntity>,
  ));
}


}

// dart format on
