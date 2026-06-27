import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/quiz_model.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../lesson/presentation/providers/lesson_providers.dart';

class QuizResultData {
  final QuizResult result;
  final List<QuizQuestion> questions;
  final Map<int, int> selectedAnswers;

  QuizResultData({
    required this.result,
    required this.questions,
    required this.selectedAnswers,
  });
}

class QuizResultView extends ConsumerWidget {
  final QuizResultData data;

  const QuizResultView({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = data.result;
    final isFinalAssessment = result.lessonId == null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              if (!isFinalAssessment && result.passed) {
                // Also mark lesson as complete locally since they passed
                ref.read(lessonCompletionProvider.notifier).toggle(result.lessonId!);
              }
              context.pop();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.p24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            _buildScoreHeader(result),
            const SizedBox(height: AppSizes.p32),

            // Stats row
            _buildStatsRow(result),
            const SizedBox(height: AppSizes.p32),

            // Weak Topics
            if (result.weakTopics.isNotEmpty) ...[
              const Text('Areas for Improvement', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: AppSizes.p16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: result.weakTopics.map((t) => Chip(
                  label: Text(t),
                  backgroundColor: Colors.orange.withOpacity(0.1),
                  labelStyle: const TextStyle(color: Colors.orange),
                )).toList(),
              ),
              const SizedBox(height: AppSizes.p32),
            ],

            // Certificate Button (if final assessment passed)
            if (isFinalAssessment && result.passed) ...[
              ElevatedButton.icon(
                onPressed: () => context.push('/certificate', extra: result),
                icon: const Icon(Icons.emoji_events),
                label: const Text('View Your Certificate'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(AppSizes.p16),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: AppSizes.p32),
            ],

            // Explanations
            const Text('Detailed Review', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSizes.p16),
            ...List.generate(data.questions.length, (index) {
              final q = data.questions[index];
              final selected = data.selectedAnswers[index];
              final isCorrect = selected == q.correctAnswerIndex;

              return Card(
                margin: const EdgeInsets.only(bottom: AppSizes.p16),
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            isCorrect ? Icons.check_circle : Icons.cancel,
                            color: isCorrect ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: AppSizes.p12),
                          Expanded(
                            child: Text(
                              'Q${index + 1}: ${q.question}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSizes.p16),
                      Text('Your Answer: ${selected != null ? q.options[selected] : "Skipped"}',
                          style: TextStyle(color: isCorrect ? Colors.green : Colors.red)),
                      if (!isCorrect)
                        Text('Correct Answer: ${q.options[q.correctAnswerIndex]}',
                            style: const TextStyle(color: Colors.green)),
                      const SizedBox(height: AppSizes.p12),
                      Container(
                        padding: const EdgeInsets.all(AppSizes.p12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          q.explanation,
                          style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black87),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreHeader(QuizResult result) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.p24),
      decoration: BoxDecoration(
        color: result.passed ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: result.passed ? Colors.green : Colors.red,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Icon(
            result.passed ? Icons.emoji_events : Icons.sentiment_dissatisfied,
            size: 64,
            color: result.passed ? Colors.green : Colors.red,
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            result.passed ? 'Congratulations!' : 'Keep Learning!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: result.passed ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: AppSizes.p8),
          Text(
            'You scored ${(result.score * 100).toInt()}%',
            style: const TextStyle(fontSize: 18),
          ),
          if (!result.passed)
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'You need 70% to pass. Review the material and try again.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(QuizResult result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('Correct', result.correctAnswers.toString(), Colors.green),
        _buildStatItem('Incorrect', result.incorrectAnswers.toString(), Colors.red),
        _buildStatItem('Questions', (result.correctAnswers + result.incorrectAnswers).toString(), Colors.blue),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
