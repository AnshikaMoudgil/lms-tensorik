// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      id: json['id'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
      explanation: json['explanation'] as String,
      difficulty: json['difficulty'] as String,
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
      'correctAnswerIndex': instance.correctAnswerIndex,
      'explanation': instance.explanation,
      'difficulty': instance.difficulty,
    };

_QuizResult _$QuizResultFromJson(Map<String, dynamic> json) => _QuizResult(
  id: json['id'] as String,
  userId: json['userId'] as String,
  courseId: json['courseId'] as String,
  lessonId: json['lessonId'] as String?,
  score: (json['score'] as num).toDouble(),
  passed: json['passed'] as bool,
  correctAnswers: (json['correctAnswers'] as num).toInt(),
  incorrectAnswers: (json['incorrectAnswers'] as num).toInt(),
  weakTopics:
      (json['weakTopics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  completedAt: const TimestampConverter().fromJson(
    json['completedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$QuizResultToJson(_QuizResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'courseId': instance.courseId,
      'lessonId': instance.lessonId,
      'score': instance.score,
      'passed': instance.passed,
      'correctAnswers': instance.correctAnswers,
      'incorrectAnswers': instance.incorrectAnswers,
      'weakTopics': instance.weakTopics,
      'completedAt': const TimestampConverter().toJson(instance.completedAt),
    };
