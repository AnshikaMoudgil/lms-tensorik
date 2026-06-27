import 'dart:math';
import '../../domain/models/quiz_model.dart';

class AIQuizService {
  final _random = Random();

  /// Simulates AI generation of 5 MCQs for a lesson
  Future<List<QuizQuestion>> generateLessonQuiz(String lessonId) async {
    // Simulate network delay for AI generation
    await Future.delayed(const Duration(seconds: 3));

    final questions = <QuizQuestion>[];
    for (int i = 0; i < 5; i++) {
      final isEasy = _random.nextBool();
      questions.add(
        QuizQuestion(
          id: 'l_${lessonId}_q_$i',
          question: 'What is a key concept discussed in this lesson (Question ${i + 1})?',
          options: [
            'Correct Concept Application',
            'Common Misconception A',
            'Common Misconception B',
            'Irrelevant Fact',
          ]..shuffle(_random), // Randomize option order
          correctAnswerIndex: 0, // Will be updated after shuffle
          explanation: 'This is the correct answer because it directly applies the core principles taught in the lesson.',
          difficulty: isEasy ? 'Easy' : 'Medium',
        ),
      );
    }

    // Fix the correct answer index after shuffling
    return questions.map((q) {
      final correctIdx = q.options.indexOf('Correct Concept Application');
      return q.copyWith(correctAnswerIndex: correctIdx);
    }).toList();
  }

  /// Simulates AI generation of 20 MCQs for the final course assessment
  Future<List<QuizQuestion>> generateFinalAssessment(String courseId) async {
    // Simulate longer delay for 20 questions
    await Future.delayed(const Duration(seconds: 4));

    final questions = <QuizQuestion>[];
    for (int i = 0; i < 20; i++) {
      final difficultyRoll = _random.nextInt(3);
      final difficulty = difficultyRoll == 0 ? 'Easy' : (difficultyRoll == 1 ? 'Medium' : 'Hard');

      questions.add(
        QuizQuestion(
          id: 'c_${courseId}_q_$i',
          question: 'Final Assessment Question ${i + 1}: How does $difficulty difficulty affect the implementation?',
          options: [
            'Optimal Solution',
            'Suboptimal Solution',
            'Incorrect Approach',
            'Syntax Error',
          ]..shuffle(_random),
          correctAnswerIndex: 0,
          explanation: 'The optimal solution handles edge cases and scales well, whereas other options fall short.',
          difficulty: difficulty,
        ),
      );
    }

    return questions.map((q) {
      final correctIdx = q.options.indexOf('Optimal Solution');
      return q.copyWith(correctAnswerIndex: correctIdx);
    }).toList()..shuffle(_random); // Randomize question order
  }
}
