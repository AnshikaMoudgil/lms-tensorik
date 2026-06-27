import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
sealed class CourseModel with _$CourseModel {
  const CourseModel._();

  const factory CourseModel({
    required String id,
    required String title,
    required String description,
    required String thumbnail,
    required String instructor,
    required String category,
    // duration in minutes
    required int duration,
    required int lessonCount,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);
}
