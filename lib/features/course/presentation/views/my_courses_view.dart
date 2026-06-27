import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/course_providers.dart';
import '../../../dashboard/presentation/widgets/progress_card.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/animated_press.dart';

class MyCoursesView extends ConsumerWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enrolledMap = ref.watch(isEnrolledProvider);
    final enrolledIds = enrolledMap.entries.where((e) => e.value).map((e) => e.key).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(isEnrolledProvider);
        },
        child: enrolledIds.isEmpty
            ? Center(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.menu_book, size: 64, color: Colors.grey),
                      const SizedBox(height: AppSizes.p16),
                      const Text('No courses enrolled yet', style: TextStyle(fontSize: 18, color: Colors.grey)),
                      const SizedBox(height: AppSizes.p24),
                      AnimatedPress(
                        onPressed: () => context.go('/dashboard'),
                        child: IgnorePointer(
                          child: ElevatedButton(
                            onPressed: () {}, // Handled by AnimatedPress
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Explore Courses'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppSizes.p16),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: enrolledIds.length,
                itemBuilder: (context, index) {
                  final courseId = enrolledIds[index];
                  final courseAsync = ref.watch(courseDetailsProvider(courseId));

                  return courseAsync.when(
                    data: (course) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.p16),
                      child: ProgressCard(course: course),
                    ),
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.p16),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    error: (_, __) => const SizedBox.shrink(),
                  );
                },
              ),
      ),
    );
  }
}
