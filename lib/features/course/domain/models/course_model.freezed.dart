// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseModel {

 String get id; String get title; String get description; String get thumbnail; String get instructor; String get category;// duration in minutes
 int get duration; int get lessonCount;
/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseModelCopyWith<CourseModel> get copyWith => _$CourseModelCopyWithImpl<CourseModel>(this as CourseModel, _$identity);

  /// Serializes this CourseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.instructor, instructor) || other.instructor == instructor)&&(identical(other.category, category) || other.category == category)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.lessonCount, lessonCount) || other.lessonCount == lessonCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,thumbnail,instructor,category,duration,lessonCount);

@override
String toString() {
  return 'CourseModel(id: $id, title: $title, description: $description, thumbnail: $thumbnail, instructor: $instructor, category: $category, duration: $duration, lessonCount: $lessonCount)';
}


}

/// @nodoc
abstract mixin class $CourseModelCopyWith<$Res>  {
  factory $CourseModelCopyWith(CourseModel value, $Res Function(CourseModel) _then) = _$CourseModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String thumbnail, String instructor, String category, int duration, int lessonCount
});




}
/// @nodoc
class _$CourseModelCopyWithImpl<$Res>
    implements $CourseModelCopyWith<$Res> {
  _$CourseModelCopyWithImpl(this._self, this._then);

  final CourseModel _self;
  final $Res Function(CourseModel) _then;

/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? thumbnail = null,Object? instructor = null,Object? category = null,Object? duration = null,Object? lessonCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,instructor: null == instructor ? _self.instructor : instructor // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,lessonCount: null == lessonCount ? _self.lessonCount : lessonCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseModel].
extension CourseModelPatterns on CourseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseModel value)  $default,){
final _that = this;
switch (_that) {
case _CourseModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String thumbnail,  String instructor,  String category,  int duration,  int lessonCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.thumbnail,_that.instructor,_that.category,_that.duration,_that.lessonCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String thumbnail,  String instructor,  String category,  int duration,  int lessonCount)  $default,) {final _that = this;
switch (_that) {
case _CourseModel():
return $default(_that.id,_that.title,_that.description,_that.thumbnail,_that.instructor,_that.category,_that.duration,_that.lessonCount);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String thumbnail,  String instructor,  String category,  int duration,  int lessonCount)?  $default,) {final _that = this;
switch (_that) {
case _CourseModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.thumbnail,_that.instructor,_that.category,_that.duration,_that.lessonCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseModel extends CourseModel {
  const _CourseModel({required this.id, required this.title, required this.description, required this.thumbnail, required this.instructor, required this.category, required this.duration, required this.lessonCount}): super._();
  factory _CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String thumbnail;
@override final  String instructor;
@override final  String category;
// duration in minutes
@override final  int duration;
@override final  int lessonCount;

/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseModelCopyWith<_CourseModel> get copyWith => __$CourseModelCopyWithImpl<_CourseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.instructor, instructor) || other.instructor == instructor)&&(identical(other.category, category) || other.category == category)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.lessonCount, lessonCount) || other.lessonCount == lessonCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,thumbnail,instructor,category,duration,lessonCount);

@override
String toString() {
  return 'CourseModel(id: $id, title: $title, description: $description, thumbnail: $thumbnail, instructor: $instructor, category: $category, duration: $duration, lessonCount: $lessonCount)';
}


}

/// @nodoc
abstract mixin class _$CourseModelCopyWith<$Res> implements $CourseModelCopyWith<$Res> {
  factory _$CourseModelCopyWith(_CourseModel value, $Res Function(_CourseModel) _then) = __$CourseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String thumbnail, String instructor, String category, int duration, int lessonCount
});




}
/// @nodoc
class __$CourseModelCopyWithImpl<$Res>
    implements _$CourseModelCopyWith<$Res> {
  __$CourseModelCopyWithImpl(this._self, this._then);

  final _CourseModel _self;
  final $Res Function(_CourseModel) _then;

/// Create a copy of CourseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? thumbnail = null,Object? instructor = null,Object? category = null,Object? duration = null,Object? lessonCount = null,}) {
  return _then(_CourseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,instructor: null == instructor ? _self.instructor : instructor // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,lessonCount: null == lessonCount ? _self.lessonCount : lessonCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
