import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/quiz_providers.dart';
import '../viewmodels/quiz_viewmodel.dart';
import 'quiz_result_view.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/animated_press.dart';

class QuizView extends StatefulHookConsumerWidget {
  final String courseId;
  final String? lessonId;

  const QuizView({
    super.key,
    required this.courseId,
    this.lessonId,
  });

  @override
  ConsumerState<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends ConsumerState<QuizView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = ref.read(quizViewModelProvider.notifier);
      if (widget.lessonId != null) {
        vm.loadLessonQuiz(widget.courseId, widget.lessonId!);
      } else {
        vm.loadFinalAssessment(widget.courseId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizViewModelProvider);
    final isFinalAssessment = widget.lessonId == null;

    ref.listen<QuizState>(quizViewModelProvider, (previous, next) {
      if (previous?.isSubmitting == true && next.isSubmitting == false && next.result != null) {
        context.pushReplacement('/quiz-result', extra: QuizResultData(
          result: next.result!,
          questions: next.questions,
          selectedAnswers: next.selectedAnswers,
        ));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(isFinalAssessment ? 'Final Assessment' : 'Lesson Quiz'),
        actions: [
          if (isFinalAssessment && !state.isLoading && state.remainingSeconds > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
              child: Center(
                child: Text(
                  _formatTime(state.remainingSeconds),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: state.isLoading
          ? _buildLoadingState()
          : _buildQuizContent(state),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // If you have a lottie animation, you could use it here.
          // Lottie.asset('assets/animations/ai_loading.json', height: 200),
          const CircularProgressIndicator(),
          const SizedBox(height: AppSizes.p24),
          Text(
            widget.lessonId == null ? 'Generating Final Assessment...' : 'Generating AI Quiz...',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p8),
          const Text('Analyzing course material to create questions', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildQuizContent(state) {
    if (state.questions.isEmpty) {
      return const Center(child: Text('No questions generated.'));
    }

    final question = state.questions[state.currentIndex];
    final selectedOption = state.selectedAnswers[state.currentIndex];

    return SafeArea(
      child: Column(
        children: [
          // Progress Bar
          LinearProgressIndicator(
            value: (state.currentIndex + 1) / state.questions.length,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.p24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${state.currentIndex + 1} of ${state.questions.length}',
                  style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    question.difficulty,
                    style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.p24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question.question,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 1.4),
                  ),
                  const SizedBox(height: AppSizes.p32),
                  ...List.generate(question.options.length, (index) {
                    final isSelected = selectedOption == index;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.p16),
                      child: AnimatedPress(
                        onPressed: () {
                          ref.read(quizViewModelProvider.notifier).selectAnswer(state.currentIndex, index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(AppSizes.p20),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary.withOpacity(0.1) : Theme.of(context).cardColor,
                            border: Border.all(
                              color: isSelected ? AppColors.primary : Colors.grey.shade300,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected ? AppColors.primary : Colors.grey.shade200,
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + index), // A, B, C, D
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isSelected ? Colors.white : Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSizes.p16),
                              Expanded(
                                child: Text(
                                  question.options[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.p24),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                if (state.currentIndex > 0) ...[
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () => ref.read(quizViewModelProvider.notifier).previousQuestion(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusLg)),
                      ),
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(width: AppSizes.p16),
                ],
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: selectedOption == null
                        ? null
                        : () {
                            if (state.currentIndex == state.questions.length - 1) {
                              ref.read(quizViewModelProvider.notifier).submitQuiz(widget.courseId, widget.lessonId);
                            } else {
                              ref.read(quizViewModelProvider.notifier).nextQuestion();
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusLg)),
                    ),
                    child: state.isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : Text(state.currentIndex == state.questions.length - 1 ? 'Submit Quiz' : 'Next Question'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final m = (seconds / 60).floor();
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}
