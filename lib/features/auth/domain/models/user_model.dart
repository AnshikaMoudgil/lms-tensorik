import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

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
sealed class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String uid,
    required String name,
    required String email,
    String? photo,
    @TimestampConverter() required DateTime createdAt,
    @Default([]) List<String> enrolledCourses,
    @Default([]) List<String> completedLessons,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
