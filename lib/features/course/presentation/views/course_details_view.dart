import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../providers/course_providers.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/animated_press.dart';
import '../../../lesson/presentation/providers/lesson_providers.dart';
import '../../../quiz/presentation/providers/quiz_providers.dart';

class CourseDetailsView extends ConsumerWidget {
  final String courseId;
  final String heroTag;

  const CourseDetailsView({super.key, required this.courseId, required this.heroTag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseAsync = ref.watch(courseDetailsProvider(courseId));
    final isEnrolledMap = ref.watch(isEnrolledProvider);
    final isEnrolled = isEnrolledMap[courseId] ?? false;
    final lessonsAsync = ref.watch(courseLessonsProvider(courseId));
    final completionMap = ref.watch(lessonCompletionProvider);
    final finalAssessmentAsync = ref.watch(finalAssessmentPassedProvider(courseId));

    return Scaffold(
      body: courseAsync.when(
        data: (course) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: heroTag,
                    child: CachedNetworkImage(
                      imageUrl: course.thumbnail.isNotEmpty ? course.thumbnail : 'https://via.placeholder.com/400x250',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: const CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  onPressed: () => context.pop(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.p24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              course.category,
                              style: const TextStyle(color: AppColors.secondary, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              if (isEnrolled && course.lessonCount > 0) ...[
                                Builder(
                                  builder: (context) {
                                    // Calculate progress
                                    int completed = 0;
                                    lessonsAsync.whenData((lessons) {
                                      completed = lessons.where((l) => completionMap[l.id] == true).length;
                                    });
                                    final progress = course.lessonCount == 0 ? 0.0 : completed / course.lessonCount;
                                    return Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: TweenAnimationBuilder<double>(
                                            tween: Tween<double>(begin: 0, end: progress),
                                            duration: const Duration(milliseconds: 1000),
                                            curve: Curves.easeOutCubic,
                                            builder: (context, value, _) => CircularProgressIndicator(
                                              value: value,
                                              strokeWidth: 3,
                                              backgroundColor: Colors.grey.shade300,
                                              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: AppSizes.p8),
                                        TweenAnimationBuilder<double>(
                                          tween: Tween<double>(begin: 0, end: progress),
                                          duration: const Duration(milliseconds: 1000),
                                          curve: Curves.easeOutCubic,
                                          builder: (context, value, _) => Text(
                                            '${(value * 100).toInt()}%',
                                            style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
                                          ),
                                        ),
                                        const SizedBox(width: AppSizes.p16),
                                      ],
                                    );
                                  },
                                ),
                              ],
                              const Icon(Icons.star, color: Colors.amber, size: 20),
                              const SizedBox(width: AppSizes.p4),
                              const Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                              const Text(' (1.2k)', style: TextStyle(color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: AppSizes.p16),
                      Text(
                        course.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: AppSizes.p8),
                      Row(
                        children: [
                          const Icon(Icons.person_outline, size: 20, color: Colors.grey),
                          const SizedBox(width: AppSizes.p8),
                          Text(course.instructor, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: AppSizes.p16),
                      Row(
                        children: [
                          _buildInfoChip(Icons.access_time, '${course.duration} mins'),
                          const SizedBox(width: AppSizes.p16),
                          _buildInfoChip(Icons.play_circle_outline, '${course.lessonCount} lessons'),
                        ],
                      ),
                      const SizedBox(height: AppSizes.p24),
                      const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: AppSizes.p8),
                      Text(
                        course.description,
                        style: const TextStyle(color: Colors.grey, height: 1.5),
                      ),
                      const SizedBox(height: AppSizes.p32),
                      // Lessons List
                      const Text('Lessons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: AppSizes.p16),
                      lessonsAsync.when(
                        data: (lessons) {
                          if (lessons.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.all(AppSizes.p16),
                              child: Text('No lessons available yet.'),
                            );
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: lessons.length,
                            itemBuilder: (context, index) {
                              final lesson = lessons[index];
                              final isCompleted = completionMap[lesson.id] == true;
                              
                              return Theme(
                                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    backgroundColor: isCompleted ? AppColors.primary : AppColors.primary.withValues(alpha: 0.1),
                                    child: isCompleted 
                                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                                      : Text('${index + 1}', style: const TextStyle(color: AppColors.primary)),
                                  ),
                                  title: Text(lesson.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                                  subtitle: const Row(
                                    children: [
                                      Icon(Icons.access_time, size: 14, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text('10 mins', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                    ],
                                  ),
                                  trailing: isEnrolled 
                                    ? IconButton(
                                        icon: Icon(
                                          isCompleted ? Icons.replay_circle_filled : Icons.play_circle_fill,
                                          color: AppColors.primary,
                                        ),
                                        onPressed: () {
                                          ref.read(lessonCompletionProvider.notifier).toggle(lesson.id);
                                          context.push('/lesson/${lesson.id}');
                                        },
                                      )
                                    : const Icon(Icons.lock_outline, color: Colors.grey),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 56.0, right: 16.0, bottom: 16.0),
                                      child: Text(
                                        lesson.description,
                                        style: const TextStyle(color: Colors.grey, height: 1.5),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (err, _) => Text('Error loading lessons: $err'),
                      ),
                      const SizedBox(height: 100), // padding for bottom bar
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
      bottomNavigationBar: courseAsync.hasValue ? Container(
        padding: const EdgeInsets.all(AppSizes.p24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: AnimatedPress(
          onPressed: () {
            if (isEnrolled) {
              lessonsAsync.whenData((lessons) {
                if (lessons.isNotEmpty) {
                  final allCompleted = lessons.every((l) => completionMap[l.id] == true);
                  if (allCompleted) {
                    final hasPassedFinal = finalAssessmentAsync.value ?? false;
                    if (hasPassedFinal) {
                      // Navigate to a blank result which opens certificate, or just mock it here
                      // Normally we'd fetch the exact QuizResult, but for now we just push quiz
                      // Actually, if we just want to view certificate, we need the QuizResult.
                      // For now, if passed, we can just show a toast or we can re-take it.
                      context.push('/quiz?courseId=$courseId');
                    } else {
                      context.push('/quiz?courseId=$courseId');
                    }
                  } else {
                    final firstIncomplete = lessons.firstWhere(
                      (l) => completionMap[l.id] != true, 
                      orElse: () => lessons.first
                    );
                    context.push('/lesson/${firstIncomplete.id}');
                  }
                }
              });
            } else {
              ref.read(isEnrolledProvider.notifier).enroll(courseId);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfully Enrolled!')));
            }
          },
          child: IgnorePointer(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: _getButtonColor(isEnrolled, lessonsAsync.value, completionMap, finalAssessmentAsync.value),
              ),
              child: Text(_getButtonText(isEnrolled, lessonsAsync.value, completionMap, finalAssessmentAsync.value)),
            ),
          ),
        ),
      ) : null,
    );
  }

  Color _getButtonColor(bool isEnrolled, List? lessons, Map completionMap, bool? hasPassedFinal) {
    if (!isEnrolled) return AppColors.primary;
    if (lessons == null || lessons.isEmpty) return AppColors.primary;
    final allCompleted = lessons.every((l) => completionMap[l.id] == true);
    if (allCompleted) {
      return (hasPassedFinal ?? false) ? Colors.green : Colors.orange;
    }
    return AppColors.primary;
  }

  String _getButtonText(bool isEnrolled, List? lessons, Map completionMap, bool? hasPassedFinal) {
    if (!isEnrolled) return 'Enroll Now';
    if (lessons == null || lessons.isEmpty) return 'Start Learning';
    final allCompleted = lessons.every((l) => completionMap[l.id] == true);
    if (allCompleted) {
      return (hasPassedFinal ?? false) ? 'Retake Final Assessment' : 'Take Final Assessment';
    }
    return 'Continue Learning';
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: AppSizes.p4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
