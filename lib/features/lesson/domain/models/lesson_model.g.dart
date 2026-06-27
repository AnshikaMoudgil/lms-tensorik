// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LessonModel _$LessonModelFromJson(Map<String, dynamic> json) => _LessonModel(
  id: json['id'] as String,
  courseId: json['courseId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  videoUrl: json['videoUrl'] as String,
  order: (json['order'] as num).toInt(),
);

Map<String, dynamic> _$LessonModelToJson(_LessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'title': instance.title,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'order': instance.order,
    };
