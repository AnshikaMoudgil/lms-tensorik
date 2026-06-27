import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/lesson_model.dart';

class LessonRepository {
  final FirebaseFirestore _firestore;

  LessonRepository({FirebaseFirestore? firestore}) 
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<LessonModel>> getLessonsByCourseId(String courseId) async {
    try {
      final snapshot = await _firestore
          .collection('lessons')
          .where('courseId', isEqualTo: courseId)
          .orderBy('order')
          .get();
          
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return LessonModel.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to load lessons: $e');
    }
  }

  Future<LessonModel> getLessonById(String lessonId) async {
    try {
      final doc = await _firestore.collection('lessons').doc(lessonId).get();
      if (!doc.exists || doc.data() == null) {
        throw Exception('Lesson not found');
      }
      final data = doc.data()!;
      data['id'] = doc.id;
      return LessonModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load lesson details: $e');
    }
  }
}
