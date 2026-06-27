import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/lesson_model.dart';
import '../../data/repositories/lesson_repository.dart';

import '../viewmodels/lesson_completion_viewmodel.dart';

final lessonRepositoryProvider = Provider<LessonRepository>((ref) {
  return LessonRepository();
});

final courseLessonsProvider = FutureProvider.family<List<LessonModel>, String>((ref, id) {
  return ref.watch(lessonRepositoryProvider).getLessonsByCourseId(id);
});

final lessonDetailsProvider = FutureProvider.family<LessonModel, String>((ref, id) {
  return ref.watch(lessonRepositoryProvider).getLessonById(id);
});

final lessonCompletionProvider = NotifierProvider<LessonCompletionViewModel, Map<String, bool>>(() {
  return LessonCompletionViewModel();
});
