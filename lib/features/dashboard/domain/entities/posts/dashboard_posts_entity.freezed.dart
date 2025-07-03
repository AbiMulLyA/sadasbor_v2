// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_posts_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardPostsEntity {

 String? get slug; String? get postTitle; String? get postDate;// Pertimbangkan menggunakan DateTime jika lebih sesuai di domain
 String? get featureImage; String? get authorName; List<String?>? get categories; bool? get announcement;
/// Create a copy of DashboardPostsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardPostsEntityCopyWith<DashboardPostsEntity> get copyWith => _$DashboardPostsEntityCopyWithImpl<DashboardPostsEntity>(this as DashboardPostsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostsEntity&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.postTitle, postTitle) || other.postTitle == postTitle)&&(identical(other.postDate, postDate) || other.postDate == postDate)&&(identical(other.featureImage, featureImage) || other.featureImage == featureImage)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.announcement, announcement) || other.announcement == announcement));
}


@override
int get hashCode => Object.hash(runtimeType,slug,postTitle,postDate,featureImage,authorName,const DeepCollectionEquality().hash(categories),announcement);

@override
String toString() {
  return 'DashboardPostsEntity(slug: $slug, postTitle: $postTitle, postDate: $postDate, featureImage: $featureImage, authorName: $authorName, categories: $categories, announcement: $announcement)';
}


}

/// @nodoc
abstract mixin class $DashboardPostsEntityCopyWith<$Res>  {
  factory $DashboardPostsEntityCopyWith(DashboardPostsEntity value, $Res Function(DashboardPostsEntity) _then) = _$DashboardPostsEntityCopyWithImpl;
@useResult
$Res call({
 String? slug, String? postTitle, String? postDate, String? featureImage, String? authorName, List<String?>? categories, bool? announcement
});




}
/// @nodoc
class _$DashboardPostsEntityCopyWithImpl<$Res>
    implements $DashboardPostsEntityCopyWith<$Res> {
  _$DashboardPostsEntityCopyWithImpl(this._self, this._then);

  final DashboardPostsEntity _self;
  final $Res Function(DashboardPostsEntity) _then;

/// Create a copy of DashboardPostsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = freezed,Object? postTitle = freezed,Object? postDate = freezed,Object? featureImage = freezed,Object? authorName = freezed,Object? categories = freezed,Object? announcement = freezed,}) {
  return _then(_self.copyWith(
slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,postTitle: freezed == postTitle ? _self.postTitle : postTitle // ignore: cast_nullable_to_non_nullable
as String?,postDate: freezed == postDate ? _self.postDate : postDate // ignore: cast_nullable_to_non_nullable
as String?,featureImage: freezed == featureImage ? _self.featureImage : featureImage // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String?>?,announcement: freezed == announcement ? _self.announcement : announcement // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc


class _DashboardPostsEntity implements DashboardPostsEntity {
  const _DashboardPostsEntity({this.slug, this.postTitle, this.postDate, this.featureImage, this.authorName, final  List<String?>? categories, this.announcement}): _categories = categories;
  

@override final  String? slug;
@override final  String? postTitle;
@override final  String? postDate;
// Pertimbangkan menggunakan DateTime jika lebih sesuai di domain
@override final  String? featureImage;
@override final  String? authorName;
 final  List<String?>? _categories;
@override List<String?>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? announcement;

/// Create a copy of DashboardPostsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardPostsEntityCopyWith<_DashboardPostsEntity> get copyWith => __$DashboardPostsEntityCopyWithImpl<_DashboardPostsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardPostsEntity&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.postTitle, postTitle) || other.postTitle == postTitle)&&(identical(other.postDate, postDate) || other.postDate == postDate)&&(identical(other.featureImage, featureImage) || other.featureImage == featureImage)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.announcement, announcement) || other.announcement == announcement));
}


@override
int get hashCode => Object.hash(runtimeType,slug,postTitle,postDate,featureImage,authorName,const DeepCollectionEquality().hash(_categories),announcement);

@override
String toString() {
  return 'DashboardPostsEntity(slug: $slug, postTitle: $postTitle, postDate: $postDate, featureImage: $featureImage, authorName: $authorName, categories: $categories, announcement: $announcement)';
}


}

/// @nodoc
abstract mixin class _$DashboardPostsEntityCopyWith<$Res> implements $DashboardPostsEntityCopyWith<$Res> {
  factory _$DashboardPostsEntityCopyWith(_DashboardPostsEntity value, $Res Function(_DashboardPostsEntity) _then) = __$DashboardPostsEntityCopyWithImpl;
@override @useResult
$Res call({
 String? slug, String? postTitle, String? postDate, String? featureImage, String? authorName, List<String?>? categories, bool? announcement
});




}
/// @nodoc
class __$DashboardPostsEntityCopyWithImpl<$Res>
    implements _$DashboardPostsEntityCopyWith<$Res> {
  __$DashboardPostsEntityCopyWithImpl(this._self, this._then);

  final _DashboardPostsEntity _self;
  final $Res Function(_DashboardPostsEntity) _then;

/// Create a copy of DashboardPostsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = freezed,Object? postTitle = freezed,Object? postDate = freezed,Object? featureImage = freezed,Object? authorName = freezed,Object? categories = freezed,Object? announcement = freezed,}) {
  return _then(_DashboardPostsEntity(
slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,postTitle: freezed == postTitle ? _self.postTitle : postTitle // ignore: cast_nullable_to_non_nullable
as String?,postDate: freezed == postDate ? _self.postDate : postDate // ignore: cast_nullable_to_non_nullable
as String?,featureImage: freezed == featureImage ? _self.featureImage : featureImage // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String?>?,announcement: freezed == announcement ? _self.announcement : announcement // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
