import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/course_model.dart';
import '../../data/repositories/course_repository.dart';

import '../viewmodels/enrollment_viewmodel.dart';

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  return CourseRepository();
});

final courseDetailsProvider = FutureProvider.family<CourseModel, String>((ref, id) {
  return ref.watch(courseRepositoryProvider).getCourseById(id);
});

final isEnrolledProvider = NotifierProvider<EnrollmentViewModel, Map<String, bool>>(() {
  return EnrollmentViewModel();
});
