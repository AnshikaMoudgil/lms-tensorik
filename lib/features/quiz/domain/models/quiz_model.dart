import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

// Custom JSON converter for Timestamp <-> DateTime
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}

@freezed
sealed class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String id,
    required String question,
    required List<String> options,
    required int correctAnswerIndex,
    required String explanation,
    required String difficulty,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);
}

@freezed
sealed class QuizResult with _$QuizResult {
  const factory QuizResult({
    required String id,
    required String userId,
    required String courseId,
    String? lessonId, // null means final assessment
    required double score,
    required bool passed,
    required int correctAnswers,
    required int incorrectAnswers,
    @Default([]) List<String> weakTopics,
    @TimestampConverter() required DateTime completedAt,
  }) = _QuizResult;

  factory QuizResult.fromJson(Map<String, dynamic> json) => _$QuizResultFromJson(json);
}
