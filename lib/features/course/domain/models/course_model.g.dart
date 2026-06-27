// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => _CourseModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  thumbnail: json['thumbnail'] as String,
  instructor: json['instructor'] as String,
  category: json['category'] as String,
  duration: (json['duration'] as num).toInt(),
  lessonCount: (json['lessonCount'] as num).toInt(),
);

Map<String, dynamic> _$CourseModelToJson(_CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'instructor': instance.instructor,
      'category': instance.category,
      'duration': instance.duration,
      'lessonCount': instance.lessonCount,
    };
