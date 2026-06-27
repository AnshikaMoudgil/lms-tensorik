import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../auth/data/repositories/auth_repository.dart';

class EnrollmentViewModel extends Notifier<Map<String, bool>> {
  @override
  Map<String, bool> build() {
    final userState = ref.watch(authControllerProvider);
    final user = userState.value;
    if (user != null) {
      return { for (var courseId in user.enrolledCourses) courseId : true };
    }
    return {};
  }
  
  Future<void> enroll(String courseId) async {
    final user = ref.read(authControllerProvider).value;
    if (user == null) return;

    // Optimistic update
    state = {...state, courseId: true};
    
    try {
      await ref.read(authRepositoryProvider).enrollInCourse(user.uid, courseId);
      // We could optionally invalidate authControllerProvider to refresh user data
      // but optimistic update is enough for UI
    } catch (e) {
      // Revert on failure
      final newState = Map<String, bool>.from(state);
      newState.remove(courseId);
      state = newState;
    }
  }

  bool isEnrolled(String courseId) => state[courseId] ?? false;
}
