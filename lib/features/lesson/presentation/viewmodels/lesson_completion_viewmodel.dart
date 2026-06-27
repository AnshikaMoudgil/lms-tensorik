import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../auth/data/repositories/auth_repository.dart';

class LessonCompletionViewModel extends Notifier<Map<String, bool>> {
  @override
  Map<String, bool> build() {
    final userState = ref.watch(authControllerProvider);
    final user = userState.value;
    if (user != null) {
      return { for (var lessonId in user.completedLessons) lessonId : true };
    }
    return {};
  }

  Future<void> toggle(String lessonId) async {
    final user = ref.read(authControllerProvider).value;
    if (user == null) return;

    final isCompleted = !(state[lessonId] ?? false);

    // Optimistic update
    state = {...state, lessonId: isCompleted};

    try {
      await ref.read(authRepositoryProvider).toggleLessonCompletion(user.uid, lessonId, isCompleted);
    } catch (e) {
      // Revert on failure
      state = {...state, lessonId: !isCompleted};
    }
  }

  bool isCompleted(String lessonId) => state[lessonId] ?? false;
}
