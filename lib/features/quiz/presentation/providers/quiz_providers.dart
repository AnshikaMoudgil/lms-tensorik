import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/ai_quiz_service.dart';
import '../../data/repositories/quiz_repository.dart';
import '../viewmodels/quiz_viewmodel.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

// Service provider
final aiQuizServiceProvider = Provider<AIQuizService>((ref) {
  return AIQuizService();
});

// Provides whether a specific lesson has been passed
final lessonPassedProvider = FutureProvider.family<bool, ({String courseId, String lessonId})>((ref, arg) async {
  final repo = ref.watch(quizRepositoryProvider);
  return repo.hasPassedLesson(arg.courseId, arg.lessonId);
});

// Provides whether the final assessment has been passed
final finalAssessmentPassedProvider = FutureProvider.family<bool, String>((ref, courseId) async {
  final repo = ref.watch(quizRepositoryProvider);
  return repo.hasPassedFinalAssessment(courseId);
});

// AutoDisposeNotifierProvider for the active quiz session
final quizViewModelProvider = NotifierProvider.autoDispose<QuizViewModel, QuizState>(() {
  return QuizViewModel();
});
