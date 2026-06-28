import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/quiz_model.dart';
import '../../data/services/ai_quiz_service.dart';
import '../../data/repositories/quiz_repository.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../../core/services/notification_providers.dart';
import '../providers/quiz_providers.dart';

part 'quiz_viewmodel.freezed.dart';

@freezed
sealed class QuizState with _$QuizState {
  const factory QuizState({
    @Default(true) bool isLoading,
    @Default([]) List<QuizQuestion> questions,
    @Default(0) int currentIndex,
    @Default({}) Map<int, int> selectedAnswers, // index -> selected option index
    QuizResult? result,
    @Default(false) bool isSubmitting,
    @Default(1200) int remainingSeconds, // 20 minutes
    String? error,
  }) = _QuizState;
}

class QuizViewModel extends Notifier<QuizState> {
  Timer? _timer;
  
  String get courseId => _courseId;
  String? get lessonId => _lessonId;
  
  String _courseId = '';
  String? _lessonId;

  @override
  QuizState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const QuizState();
  }

  AIQuizService get _aiService => ref.read(aiQuizServiceProvider);
  QuizRepository get _repository => ref.read(quizRepositoryProvider);
  String? get _userId => ref.read(authControllerProvider).value?.uid;

  // We actually need to initialize it with parameters. 
  // Let's create a factory method to load the quiz.
  
  Future<void> loadLessonQuiz(String cId, String lId) async {
    _courseId = cId;
    _lessonId = lId;
    state = const QuizState(isLoading: true);
    try {
      final questions = await _aiService.generateLessonQuiz(lId);
      state = state.copyWith(
        isLoading: false,
        questions: questions,
      );
      
      // Trigger Quiz Available notification if enabled
      if (ref.read(notificationsEnabledProvider)) {
        ref.read(notificationServiceProvider).showQuizAvailableNotification('Lesson Quiz');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadFinalAssessment(String cId) async {
    _courseId = cId;
    _lessonId = null;
    state = const QuizState(isLoading: true, remainingSeconds: 1200);
    try {
      final questions = await _aiService.generateFinalAssessment(cId);
      state = state.copyWith(
        isLoading: false,
        questions: questions,
      );
      _startTimer();

      if (ref.read(notificationsEnabledProvider)) {
        ref.read(notificationServiceProvider).showQuizAvailableNotification('Final Assessment');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0) {
        state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
      } else {
        _timer?.cancel();
        submitQuiz(courseId, null); // Auto submit when time is up
      }
    });
  }

  void selectAnswer(int questionIndex, int optionIndex) {
    final newAnswers = Map<int, int>.from(state.selectedAnswers);
    newAnswers[questionIndex] = optionIndex;
    state = state.copyWith(selectedAnswers: newAnswers);
  }

  void nextQuestion() {
    if (state.currentIndex < state.questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  void previousQuestion() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  Future<void> submitQuiz(String cId, String? lId) async {
    final userId = _userId;
    if (userId == null) return;
    
    _timer?.cancel();
    state = state.copyWith(isSubmitting: true);

    int correct = 0;
    int incorrect = 0;
    List<String> weakTopics = [];

    for (int i = 0; i < state.questions.length; i++) {
      final q = state.questions[i];
      final selected = state.selectedAnswers[i];
      
      if (selected == q.correctAnswerIndex) {
        correct++;
      } else {
        incorrect++;
        // Use part of the question as a mock weak topic
        weakTopics.add(q.difficulty);
      }
    }

    final score = correct / state.questions.length;
    final passed = score >= 0.7;

    final result = QuizResult(
      id: const Uuid().v4(),
      userId: userId,
      courseId: cId,
      lessonId: lId,
      score: score,
      passed: passed,
      correctAnswers: correct,
      incorrectAnswers: incorrect,
      weakTopics: weakTopics.toSet().toList(), // unique
      completedAt: DateTime.now(),
    );

    try {
      await _repository.saveQuizResult(result);
      state = state.copyWith(
        isSubmitting: false,
        result: result,
      );
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());
    }
  }
}
