import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/views/splash_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/dashboard/presentation/views/main_navigation_view.dart';
import '../../features/dashboard/presentation/views/dashboard_view.dart';
import '../../features/dashboard/presentation/views/search_view.dart';
import '../../features/course/presentation/views/my_courses_view.dart';
import '../../features/course/presentation/views/course_details_view.dart';
import '../../features/lesson/presentation/views/lesson_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/quiz/presentation/views/quiz_view.dart';
import '../../features/quiz/presentation/views/quiz_result_view.dart';
import '../../features/quiz/presentation/views/certificate_view.dart';
import '../../features/quiz/domain/models/quiz_model.dart';

import '../../features/auth/presentation/providers/auth_providers.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _coursesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'courses');
final GlobalKey<NavigatorState> _searchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'search');
final GlobalKey<NavigatorState> _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      final authState = ref.read(authStateProvider);
      final isAuth = authState.value != null;
      final isGoingToLogin = state.matchedLocation == '/login' || state.matchedLocation == '/signup';

      if (!isAuth && !isGoingToLogin) return '/login';
      if (isAuth && (isGoingToLogin || state.matchedLocation == '/splash')) return '/dashboard';

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/signup',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignupView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
        ),
      ),
      // Stateful shell route for bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigationView(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Dashboard (Home)
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/dashboard',
                builder: (context, state) => const DashboardView(),
              ),
            ],
          ),
          // Branch 1: My Courses
          StatefulShellBranch(
            navigatorKey: _coursesNavigatorKey,
            routes: [
              GoRoute(
                path: '/my-courses',
                builder: (context, state) => const MyCoursesView(),
              ),
            ],
          ),
          // Branch 2: Search
          StatefulShellBranch(
            navigatorKey: _searchNavigatorKey,
            routes: [
              GoRoute(
                path: '/search',
                builder: (context, state) => const SearchView(),
              ),
            ],
          ),
          // Branch 3: Profile
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileView(),
              ),
            ],
          ),
        ],
      ),
      // Full screen routes (outside of bottom navigation shell)
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/course/:id',
        pageBuilder: (context, state) {
          final courseId = state.pathParameters['id']!;
          final heroTag = state.extra as String? ?? 'course_thumbnail_$courseId';
          return CustomTransitionPage(
            child: CourseDetailsView(courseId: courseId, heroTag: heroTag),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(Tween(begin: const Offset(1, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut))),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/lesson/:id',
        pageBuilder: (context, state) {
          final lessonId = state.pathParameters['id']!;
          return CustomTransitionPage(
            child: LessonView(lessonId: lessonId),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(Tween(begin: const Offset(1, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut))),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/quiz',
        pageBuilder: (context, state) {
          final courseId = state.uri.queryParameters['courseId']!;
          final lessonId = state.uri.queryParameters['lessonId']; // null for final assessment
          return CustomTransitionPage(
            child: QuizView(courseId: courseId, lessonId: lessonId),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(Tween(begin: const Offset(0, 1), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut))),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/quiz-result',
        pageBuilder: (context, state) {
          final data = state.extra as QuizResultData;
          return CustomTransitionPage(
            child: QuizResultView(data: data),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/certificate',
        pageBuilder: (context, state) {
          final result = state.extra as QuizResult;
          return CustomTransitionPage(
            child: CertificateView(result: result),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
    ],
  );
});
