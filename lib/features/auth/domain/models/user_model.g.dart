// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  uid: json['uid'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  photo: json['photo'] as String?,
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  enrolledCourses:
      (json['enrolledCourses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  completedLessons:
      (json['completedLessons'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'enrolledCourses': instance.enrolledCourses,
      'completedLessons': instance.completedLessons,
    };
