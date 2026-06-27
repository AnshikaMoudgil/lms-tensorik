// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizState {

 bool get isLoading; List<QuizQuestion> get questions; int get currentIndex; Map<int, int> get selectedAnswers;// index -> selected option index
 QuizResult? get result; bool get isSubmitting; int get remainingSeconds;// 20 minutes
 String? get error;
/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizStateCopyWith<QuizState> get copyWith => _$QuizStateCopyWithImpl<QuizState>(this as QuizState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other.selectedAnswers, selectedAnswers)&&(identical(other.result, result) || other.result == result)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(questions),currentIndex,const DeepCollectionEquality().hash(selectedAnswers),result,isSubmitting,remainingSeconds,error);

@override
String toString() {
  return 'QuizState(isLoading: $isLoading, questions: $questions, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers, result: $result, isSubmitting: $isSubmitting, remainingSeconds: $remainingSeconds, error: $error)';
}


}

/// @nodoc
abstract mixin class $QuizStateCopyWith<$Res>  {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) _then) = _$QuizStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<QuizQuestion> questions, int currentIndex, Map<int, int> selectedAnswers, QuizResult? result, bool isSubmitting, int remainingSeconds, String? error
});


$QuizResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$QuizStateCopyWithImpl<$Res>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._self, this._then);

  final QuizState _self;
  final $Res Function(QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? questions = null,Object? currentIndex = null,Object? selectedAnswers = null,Object? result = freezed,Object? isSubmitting = null,Object? remainingSeconds = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestion>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedAnswers: null == selectedAnswers ? _self.selectedAnswers : selectedAnswers // ignore: cast_nullable_to_non_nullable
as Map<int, int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as QuizResult?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $QuizResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuizState].
extension QuizStatePatterns on QuizState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizState value)  $default,){
final _that = this;
switch (_that) {
case _QuizState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<QuizQuestion> questions,  int currentIndex,  Map<int, int> selectedAnswers,  QuizResult? result,  bool isSubmitting,  int remainingSeconds,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.isLoading,_that.questions,_that.currentIndex,_that.selectedAnswers,_that.result,_that.isSubmitting,_that.remainingSeconds,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<QuizQuestion> questions,  int currentIndex,  Map<int, int> selectedAnswers,  QuizResult? result,  bool isSubmitting,  int remainingSeconds,  String? error)  $default,) {final _that = this;
switch (_that) {
case _QuizState():
return $default(_that.isLoading,_that.questions,_that.currentIndex,_that.selectedAnswers,_that.result,_that.isSubmitting,_that.remainingSeconds,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<QuizQuestion> questions,  int currentIndex,  Map<int, int> selectedAnswers,  QuizResult? result,  bool isSubmitting,  int remainingSeconds,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.isLoading,_that.questions,_that.currentIndex,_that.selectedAnswers,_that.result,_that.isSubmitting,_that.remainingSeconds,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _QuizState implements QuizState {
  const _QuizState({this.isLoading = true, final  List<QuizQuestion> questions = const [], this.currentIndex = 0, final  Map<int, int> selectedAnswers = const {}, this.result, this.isSubmitting = false, this.remainingSeconds = 1200, this.error}): _questions = questions,_selectedAnswers = selectedAnswers;
  

@override@JsonKey() final  bool isLoading;
 final  List<QuizQuestion> _questions;
@override@JsonKey() List<QuizQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override@JsonKey() final  int currentIndex;
 final  Map<int, int> _selectedAnswers;
@override@JsonKey() Map<int, int> get selectedAnswers {
  if (_selectedAnswers is EqualUnmodifiableMapView) return _selectedAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedAnswers);
}

// index -> selected option index
@override final  QuizResult? result;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  int remainingSeconds;
// 20 minutes
@override final  String? error;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizStateCopyWith<_QuizState> get copyWith => __$QuizStateCopyWithImpl<_QuizState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other._selectedAnswers, _selectedAnswers)&&(identical(other.result, result) || other.result == result)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_questions),currentIndex,const DeepCollectionEquality().hash(_selectedAnswers),result,isSubmitting,remainingSeconds,error);

@override
String toString() {
  return 'QuizState(isLoading: $isLoading, questions: $questions, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers, result: $result, isSubmitting: $isSubmitting, remainingSeconds: $remainingSeconds, error: $error)';
}


}

/// @nodoc
abstract mixin class _$QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$QuizStateCopyWith(_QuizState value, $Res Function(_QuizState) _then) = __$QuizStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<QuizQuestion> questions, int currentIndex, Map<int, int> selectedAnswers, QuizResult? result, bool isSubmitting, int remainingSeconds, String? error
});


@override $QuizResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$QuizStateCopyWithImpl<$Res>
    implements _$QuizStateCopyWith<$Res> {
  __$QuizStateCopyWithImpl(this._self, this._then);

  final _QuizState _self;
  final $Res Function(_QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? questions = null,Object? currentIndex = null,Object? selectedAnswers = null,Object? result = freezed,Object? isSubmitting = null,Object? remainingSeconds = null,Object? error = freezed,}) {
  return _then(_QuizState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestion>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedAnswers: null == selectedAnswers ? _self._selectedAnswers : selectedAnswers // ignore: cast_nullable_to_non_nullable
as Map<int, int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as QuizResult?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $QuizResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
