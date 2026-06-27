import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../providers/lesson_providers.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/animated_press.dart';
import '../../../course/presentation/providers/course_providers.dart';
import '../../../quiz/presentation/providers/quiz_providers.dart';

class LessonView extends ConsumerWidget {
  final String lessonId;

  const LessonView({super.key, required this.lessonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonAsync = ref.watch(lessonDetailsProvider(lessonId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      bottomNavigationBar: lessonAsync.hasValue ? Container(
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
        child: AnimatedPress(
          onPressed: () {
            final isCompleted = ref.watch(lessonCompletionProvider)[lessonId] ?? false;
            if (isCompleted) {
              context.pop();
            } else {
              final courseId = lessonAsync.value!.courseId;
              context.push('/quiz?courseId=$courseId&lessonId=$lessonId');
            }
          },
          child: IgnorePointer(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: (ref.watch(lessonCompletionProvider)[lessonId] ?? false) ? Colors.grey.shade300 : AppColors.primary,
                foregroundColor: (ref.watch(lessonCompletionProvider)[lessonId] ?? false) ? Colors.black87 : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon((ref.watch(lessonCompletionProvider)[lessonId] ?? false) ? Icons.replay : Icons.quiz),
                  const SizedBox(width: AppSizes.p8),
                  Text((ref.watch(lessonCompletionProvider)[lessonId] ?? false) ? 'Go Back' : 'Take Lesson Quiz'),
                ],
              ),
            ),
          ),
        ),
      ) : null,
      body: lessonAsync.when(
        data: (lesson) {
          final courseLessonsAsync = ref.watch(courseLessonsProvider(lesson.courseId));
          final lessonCompletion = ref.watch(lessonCompletionProvider);
          final isCompleted = lessonCompletion[lesson.id] ?? false;

          return Column(
            children: [
              // Premium Video Placeholder
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black54, Colors.black87],
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      iconSize: 64,
                      icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                      onPressed: () {
                        // Play video logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Video player would start here.')),
                        );
                      },
                    ),
                  ),
                ),
              ),
              
              // Progress Bar (Mock for video playback)
              const LinearProgressIndicator(
                value: 0.0, 
                backgroundColor: Colors.grey, 
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSizes.p24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: AppSizes.p16),
                      
                      const SizedBox(height: AppSizes.p24),
                      const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: AppSizes.p8),
                      Text(
                        lesson.description,
                        style: const TextStyle(color: Colors.grey, height: 1.5, fontSize: 16),
                      ),
                      
                      const SizedBox(height: AppSizes.p32),
                      const Text('Next Lessons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: AppSizes.p16),
                      
                      // Dynamic Next Lessons
                      courseLessonsAsync.when(
                        data: (lessons) {
                          final nextLessons = lessons.where((l) => l.order > lesson.order).toList();
                          if (nextLessons.isEmpty) {
                            return const Text('You are on the last lesson!', style: TextStyle(color: Colors.grey));
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: nextLessons.length,
                            itemBuilder: (context, index) {
                              final nextLesson = nextLessons[index];
                              final isNextCompleted = lessonCompletion[nextLesson.id] ?? false;
                              return ListTile(
                                leading: Icon(
                                  isNextCompleted ? Icons.check_circle : Icons.play_circle_outline,
                                  color: isNextCompleted ? AppColors.primary : Colors.grey,
                                ),
                                title: Text(nextLesson.title),
                                onTap: () => context.pushReplacement('/lesson/${nextLesson.id}'),
                              );
                            },
                          );
                        },
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (_, __) => const Text('Could not load upcoming lessons.'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
