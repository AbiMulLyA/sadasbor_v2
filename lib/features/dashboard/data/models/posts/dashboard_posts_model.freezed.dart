// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardPostsModel {

@JsonKey(name: 'slug') String? get slug;@JsonKey(name: 'post_title') String? get postTitle;@JsonKey(name: 'post_date') String? get postDate;// Anda mungkin ingin mengubah ini menjadi DateTime nanti
@JsonKey(name: 'feature_image') String? get featureImage;@JsonKey(name: 'author_name') String? get authorName;@JsonKey(name: 'categories') List<String?>? get categories;@JsonKey(name: 'announcement') bool? get announcement;
/// Create a copy of DashboardPostsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardPostsModelCopyWith<DashboardPostsModel> get copyWith => _$DashboardPostsModelCopyWithImpl<DashboardPostsModel>(this as DashboardPostsModel, _$identity);

  /// Serializes this DashboardPostsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardPostsModel&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.postTitle, postTitle) || other.postTitle == postTitle)&&(identical(other.postDate, postDate) || other.postDate == postDate)&&(identical(other.featureImage, featureImage) || other.featureImage == featureImage)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.announcement, announcement) || other.announcement == announcement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,postTitle,postDate,featureImage,authorName,const DeepCollectionEquality().hash(categories),announcement);

@override
String toString() {
  return 'DashboardPostsModel(slug: $slug, postTitle: $postTitle, postDate: $postDate, featureImage: $featureImage, authorName: $authorName, categories: $categories, announcement: $announcement)';
}


}

/// @nodoc
abstract mixin class $DashboardPostsModelCopyWith<$Res>  {
  factory $DashboardPostsModelCopyWith(DashboardPostsModel value, $Res Function(DashboardPostsModel) _then) = _$DashboardPostsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'post_title') String? postTitle,@JsonKey(name: 'post_date') String? postDate,@JsonKey(name: 'feature_image') String? featureImage,@JsonKey(name: 'author_name') String? authorName,@JsonKey(name: 'categories') List<String?>? categories,@JsonKey(name: 'announcement') bool? announcement
});




}
/// @nodoc
class _$DashboardPostsModelCopyWithImpl<$Res>
    implements $DashboardPostsModelCopyWith<$Res> {
  _$DashboardPostsModelCopyWithImpl(this._self, this._then);

  final DashboardPostsModel _self;
  final $Res Function(DashboardPostsModel) _then;

/// Create a copy of DashboardPostsModel
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
@JsonSerializable()

class _DashboardPostsModel implements DashboardPostsModel {
  const _DashboardPostsModel({@JsonKey(name: 'slug') this.slug, @JsonKey(name: 'post_title') this.postTitle, @JsonKey(name: 'post_date') this.postDate, @JsonKey(name: 'feature_image') this.featureImage, @JsonKey(name: 'author_name') this.authorName, @JsonKey(name: 'categories') final  List<String?>? categories, @JsonKey(name: 'announcement') this.announcement}): _categories = categories;
  factory _DashboardPostsModel.fromJson(Map<String, dynamic> json) => _$DashboardPostsModelFromJson(json);

@override@JsonKey(name: 'slug') final  String? slug;
@override@JsonKey(name: 'post_title') final  String? postTitle;
@override@JsonKey(name: 'post_date') final  String? postDate;
// Anda mungkin ingin mengubah ini menjadi DateTime nanti
@override@JsonKey(name: 'feature_image') final  String? featureImage;
@override@JsonKey(name: 'author_name') final  String? authorName;
 final  List<String?>? _categories;
@override@JsonKey(name: 'categories') List<String?>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'announcement') final  bool? announcement;

/// Create a copy of DashboardPostsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardPostsModelCopyWith<_DashboardPostsModel> get copyWith => __$DashboardPostsModelCopyWithImpl<_DashboardPostsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardPostsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardPostsModel&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.postTitle, postTitle) || other.postTitle == postTitle)&&(identical(other.postDate, postDate) || other.postDate == postDate)&&(identical(other.featureImage, featureImage) || other.featureImage == featureImage)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.announcement, announcement) || other.announcement == announcement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,postTitle,postDate,featureImage,authorName,const DeepCollectionEquality().hash(_categories),announcement);

@override
String toString() {
  return 'DashboardPostsModel(slug: $slug, postTitle: $postTitle, postDate: $postDate, featureImage: $featureImage, authorName: $authorName, categories: $categories, announcement: $announcement)';
}


}

/// @nodoc
abstract mixin class _$DashboardPostsModelCopyWith<$Res> implements $DashboardPostsModelCopyWith<$Res> {
  factory _$DashboardPostsModelCopyWith(_DashboardPostsModel value, $Res Function(_DashboardPostsModel) _then) = __$DashboardPostsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'slug') String? slug,@JsonKey(name: 'post_title') String? postTitle,@JsonKey(name: 'post_date') String? postDate,@JsonKey(name: 'feature_image') String? featureImage,@JsonKey(name: 'author_name') String? authorName,@JsonKey(name: 'categories') List<String?>? categories,@JsonKey(name: 'announcement') bool? announcement
});




}
/// @nodoc
class __$DashboardPostsModelCopyWithImpl<$Res>
    implements _$DashboardPostsModelCopyWith<$Res> {
  __$DashboardPostsModelCopyWithImpl(this._self, this._then);

  final _DashboardPostsModel _self;
  final $Res Function(_DashboardPostsModel) _then;

/// Create a copy of DashboardPostsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = freezed,Object? postTitle = freezed,Object? postDate = freezed,Object? featureImage = freezed,Object? authorName = freezed,Object? categories = freezed,Object? announcement = freezed,}) {
  return _then(_DashboardPostsModel(
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
