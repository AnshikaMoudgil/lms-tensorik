import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_colors.dart';

import '../../../course/domain/models/course_model.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../lesson/presentation/providers/lesson_providers.dart';

class ProgressCard extends ConsumerWidget {
  final CourseModel course;
  const ProgressCard({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonsAsync = ref.watch(courseLessonsProvider(course.id));
    final completionMap = ref.watch(lessonCompletionProvider);

    double progress = 0.0;
    int completed = 0;
    
    lessonsAsync.whenData((lessons) {
      if (course.lessonCount > 0) {
        completed = lessons.where((l) => completionMap[l.id] == true).length;
        progress = completed / course.lessonCount;
      }
    });
    return Container(
      padding: const EdgeInsets.all(AppSizes.p16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Continue Learning',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: AppSizes.p4),
                Text(
                  course.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSizes.p12),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: progress),
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) => LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: AppSizes.p8),
                Text(
                  '${(progress * 100).toInt()}% Completed',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.p16),
          ElevatedButton(
            onPressed: () {
              lessonsAsync.whenData((lessons) {
                if (lessons.isNotEmpty) {
                  final firstIncomplete = lessons.firstWhere(
                    (l) => completionMap[l.id] != true, 
                    orElse: () => lessons.first
                  );
                  context.push('/lesson/${firstIncomplete.id}');
                } else {
                  context.push('/course/${course.id}');
                }
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(AppSizes.p16),
            ),
            child: const Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
