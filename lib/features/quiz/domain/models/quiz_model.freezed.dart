// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizQuestion {

 String get id; String get question; List<String> get options; int get correctAnswerIndex; String get explanation; String get difficulty;
/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQuestionCopyWith<QuizQuestion> get copyWith => _$QuizQuestionCopyWithImpl<QuizQuestion>(this as QuizQuestion, _$identity);

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.correctAnswerIndex, correctAnswerIndex) || other.correctAnswerIndex == correctAnswerIndex)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,const DeepCollectionEquality().hash(options),correctAnswerIndex,explanation,difficulty);

@override
String toString() {
  return 'QuizQuestion(id: $id, question: $question, options: $options, correctAnswerIndex: $correctAnswerIndex, explanation: $explanation, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class $QuizQuestionCopyWith<$Res>  {
  factory $QuizQuestionCopyWith(QuizQuestion value, $Res Function(QuizQuestion) _then) = _$QuizQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String question, List<String> options, int correctAnswerIndex, String explanation, String difficulty
});




}
/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._self, this._then);

  final QuizQuestion _self;
  final $Res Function(QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? options = null,Object? correctAnswerIndex = null,Object? explanation = null,Object? difficulty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswerIndex: null == correctAnswerIndex ? _self.correctAnswerIndex : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
as int,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQuestion].
extension QuizQuestionPatterns on QuizQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizQuestion value)  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String question,  List<String> options,  int correctAnswerIndex,  String explanation,  String difficulty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.question,_that.options,_that.correctAnswerIndex,_that.explanation,_that.difficulty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String question,  List<String> options,  int correctAnswerIndex,  String explanation,  String difficulty)  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion():
return $default(_that.id,_that.question,_that.options,_that.correctAnswerIndex,_that.explanation,_that.difficulty);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String question,  List<String> options,  int correctAnswerIndex,  String explanation,  String difficulty)?  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.question,_that.options,_that.correctAnswerIndex,_that.explanation,_that.difficulty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizQuestion implements QuizQuestion {
  const _QuizQuestion({required this.id, required this.question, required final  List<String> options, required this.correctAnswerIndex, required this.explanation, required this.difficulty}): _options = options;
  factory _QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);

@override final  String id;
@override final  String question;
 final  List<String> _options;
@override List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  int correctAnswerIndex;
@override final  String explanation;
@override final  String difficulty;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizQuestionCopyWith<_QuizQuestion> get copyWith => __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.correctAnswerIndex, correctAnswerIndex) || other.correctAnswerIndex == correctAnswerIndex)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,const DeepCollectionEquality().hash(_options),correctAnswerIndex,explanation,difficulty);

@override
String toString() {
  return 'QuizQuestion(id: $id, question: $question, options: $options, correctAnswerIndex: $correctAnswerIndex, explanation: $explanation, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class _$QuizQuestionCopyWith<$Res> implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(_QuizQuestion value, $Res Function(_QuizQuestion) _then) = __$QuizQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String question, List<String> options, int correctAnswerIndex, String explanation, String difficulty
});




}
/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(this._self, this._then);

  final _QuizQuestion _self;
  final $Res Function(_QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? options = null,Object? correctAnswerIndex = null,Object? explanation = null,Object? difficulty = null,}) {
  return _then(_QuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswerIndex: null == correctAnswerIndex ? _self.correctAnswerIndex : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
as int,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuizResult {

 String get id; String get userId; String get courseId; String? get lessonId;// null means final assessment
 double get score; bool get passed; int get correctAnswers; int get incorrectAnswers; List<String> get weakTopics;@TimestampConverter() DateTime get completedAt;
/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizResultCopyWith<QuizResult> get copyWith => _$QuizResultCopyWithImpl<QuizResult>(this as QuizResult, _$identity);

  /// Serializes this QuizResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizResult&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.score, score) || other.score == score)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&const DeepCollectionEquality().equals(other.weakTopics, weakTopics)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,courseId,lessonId,score,passed,correctAnswers,incorrectAnswers,const DeepCollectionEquality().hash(weakTopics),completedAt);

@override
String toString() {
  return 'QuizResult(id: $id, userId: $userId, courseId: $courseId, lessonId: $lessonId, score: $score, passed: $passed, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, weakTopics: $weakTopics, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $QuizResultCopyWith<$Res>  {
  factory $QuizResultCopyWith(QuizResult value, $Res Function(QuizResult) _then) = _$QuizResultCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String courseId, String? lessonId, double score, bool passed, int correctAnswers, int incorrectAnswers, List<String> weakTopics,@TimestampConverter() DateTime completedAt
});




}
/// @nodoc
class _$QuizResultCopyWithImpl<$Res>
    implements $QuizResultCopyWith<$Res> {
  _$QuizResultCopyWithImpl(this._self, this._then);

  final QuizResult _self;
  final $Res Function(QuizResult) _then;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? courseId = null,Object? lessonId = freezed,Object? score = null,Object? passed = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? weakTopics = null,Object? completedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,weakTopics: null == weakTopics ? _self.weakTopics : weakTopics // ignore: cast_nullable_to_non_nullable
as List<String>,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizResult].
extension QuizResultPatterns on QuizResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizResult value)  $default,){
final _that = this;
switch (_that) {
case _QuizResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizResult value)?  $default,){
final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String courseId,  String? lessonId,  double score,  bool passed,  int correctAnswers,  int incorrectAnswers,  List<String> weakTopics, @TimestampConverter()  DateTime completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that.id,_that.userId,_that.courseId,_that.lessonId,_that.score,_that.passed,_that.correctAnswers,_that.incorrectAnswers,_that.weakTopics,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String courseId,  String? lessonId,  double score,  bool passed,  int correctAnswers,  int incorrectAnswers,  List<String> weakTopics, @TimestampConverter()  DateTime completedAt)  $default,) {final _that = this;
switch (_that) {
case _QuizResult():
return $default(_that.id,_that.userId,_that.courseId,_that.lessonId,_that.score,_that.passed,_that.correctAnswers,_that.incorrectAnswers,_that.weakTopics,_that.completedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String courseId,  String? lessonId,  double score,  bool passed,  int correctAnswers,  int incorrectAnswers,  List<String> weakTopics, @TimestampConverter()  DateTime completedAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizResult() when $default != null:
return $default(_that.id,_that.userId,_that.courseId,_that.lessonId,_that.score,_that.passed,_that.correctAnswers,_that.incorrectAnswers,_that.weakTopics,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizResult implements QuizResult {
  const _QuizResult({required this.id, required this.userId, required this.courseId, this.lessonId, required this.score, required this.passed, required this.correctAnswers, required this.incorrectAnswers, final  List<String> weakTopics = const [], @TimestampConverter() required this.completedAt}): _weakTopics = weakTopics;
  factory _QuizResult.fromJson(Map<String, dynamic> json) => _$QuizResultFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String courseId;
@override final  String? lessonId;
// null means final assessment
@override final  double score;
@override final  bool passed;
@override final  int correctAnswers;
@override final  int incorrectAnswers;
 final  List<String> _weakTopics;
@override@JsonKey() List<String> get weakTopics {
  if (_weakTopics is EqualUnmodifiableListView) return _weakTopics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weakTopics);
}

@override@TimestampConverter() final  DateTime completedAt;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizResultCopyWith<_QuizResult> get copyWith => __$QuizResultCopyWithImpl<_QuizResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizResult&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.score, score) || other.score == score)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&const DeepCollectionEquality().equals(other._weakTopics, _weakTopics)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,courseId,lessonId,score,passed,correctAnswers,incorrectAnswers,const DeepCollectionEquality().hash(_weakTopics),completedAt);

@override
String toString() {
  return 'QuizResult(id: $id, userId: $userId, courseId: $courseId, lessonId: $lessonId, score: $score, passed: $passed, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, weakTopics: $weakTopics, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$QuizResultCopyWith<$Res> implements $QuizResultCopyWith<$Res> {
  factory _$QuizResultCopyWith(_QuizResult value, $Res Function(_QuizResult) _then) = __$QuizResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String courseId, String? lessonId, double score, bool passed, int correctAnswers, int incorrectAnswers, List<String> weakTopics,@TimestampConverter() DateTime completedAt
});




}
/// @nodoc
class __$QuizResultCopyWithImpl<$Res>
    implements _$QuizResultCopyWith<$Res> {
  __$QuizResultCopyWithImpl(this._self, this._then);

  final _QuizResult _self;
  final $Res Function(_QuizResult) _then;

/// Create a copy of QuizResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? courseId = null,Object? lessonId = freezed,Object? score = null,Object? passed = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? weakTopics = null,Object? completedAt = null,}) {
  return _then(_QuizResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,weakTopics: null == weakTopics ? _self._weakTopics : weakTopics // ignore: cast_nullable_to_non_nullable
as List<String>,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
