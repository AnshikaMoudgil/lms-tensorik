import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_model.freezed.dart';
part 'lesson_model.g.dart';

@freezed
sealed class LessonModel with _$LessonModel {
  const LessonModel._();

  const factory LessonModel({
    required String id,
    required String courseId,
    required String title,
    required String description,
    required String videoUrl,
    required int order,
  }) = _LessonModel;

  factory LessonModel.fromJson(Map<String, dynamic> json) => _$LessonModelFromJson(json);
}
