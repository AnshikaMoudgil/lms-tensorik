import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/quiz_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  return QuizRepository(
    firestore: FirebaseFirestore.instance,
    userId: ref.watch(authControllerProvider).value?.uid,
  );
});

class QuizRepository {
  final FirebaseFirestore _firestore;
  final String? _userId;

  QuizRepository({
    required FirebaseFirestore firestore,
    required String? userId,
  })  : _firestore = firestore,
        _userId = userId;

  CollectionReference<Map<String, dynamic>>? get _resultsRef {
    if (_userId == null) return null;
    return _firestore.collection('users').doc(_userId).collection('quiz_results');
  }

  /// Save a quiz result to Firestore
  Future<void> saveQuizResult(QuizResult result) async {
    final ref = _resultsRef;
    if (ref == null) throw Exception('User not logged in');

    await ref.doc(result.id).set(result.toJson());
  }

  /// Check if the user passed a specific lesson's quiz
  Future<bool> hasPassedLesson(String courseId, String lessonId) async {
    final ref = _resultsRef;
    if (ref == null) return false;

    final snapshot = await ref
        .where('courseId', isEqualTo: courseId)
        .where('lessonId', isEqualTo: lessonId)
        .where('passed', isEqualTo: true)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  /// Check if the user passed the final assessment for a course
  Future<bool> hasPassedFinalAssessment(String courseId) async {
    final ref = _resultsRef;
    if (ref == null) return false;

    final snapshot = await ref
        .where('courseId', isEqualTo: courseId)
        .where('lessonId', isNull: true) // Final assessments have null lessonId
        .where('passed', isEqualTo: true)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty;
  }
}
