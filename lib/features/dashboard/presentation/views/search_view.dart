import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/dashboard_providers.dart';
import '../widgets/course_card.dart';
import '../../../../core/constants/app_sizes.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(dashboardCoursesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.p16),
            child: TextField(
              onChanged: (value) => ref.read(dashboardSearchQueryProvider.notifier).updateQuery(value),
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(dashboardCoursesProvider);
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: coursesAsync.when(
                  data: (courses) {
                    if (courses.isEmpty) {
                      return ListView(
                        key: const ValueKey('empty'),
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          SizedBox(height: 100),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(AppSizes.p32),
                              child: Text('No courses found', style: TextStyle(color: Colors.grey, fontSize: 16)),
                            ),
                          ),
                        ],
                      );
                    }
                    return GridView.builder(
                      key: const ValueKey('data'),
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(AppSizes.p16),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: AppSizes.p16,
                        crossAxisSpacing: AppSizes.p16,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0, 50 * (1 - value)),
                              child: Opacity(
                                opacity: value,
                                child: child,
                              ),
                            );
                          },
                          child: CourseCard(
                            course: courses[index],
                            heroTagPrefix: 'search',
                            onTap: () => context.push('/course/${courses[index].id}', extra: 'search_course_thumbnail_${courses[index].id}'),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => GridView.builder(
                    key: const ValueKey('loading'),
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(AppSizes.p16),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: AppSizes.p16,
                      crossAxisSpacing: AppSizes.p16,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      );
                    },
                  ),
                  error: (error, stack) => ListView(
                    key: const ValueKey('error'),
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 200,
                        child: Center(child: Text('Error: $error')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
