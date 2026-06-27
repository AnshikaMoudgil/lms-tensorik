import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/course_model.dart';

class CourseRepository {
  final FirebaseFirestore _firestore;

  CourseRepository({FirebaseFirestore? firestore}) 
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<CourseModel>> getCourses({String? category}) async {
    try {
      Query query = _firestore.collection('courses');
      if (category != null && category != 'All') {
        query = query.where('category', isEqualTo: category);
      }
      
      final snapshot = await query.get();
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return CourseModel.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to load courses: $e');
    }
  }

  Future<CourseModel> getCourseById(String courseId) async {
    try {
      final doc = await _firestore.collection('courses').doc(courseId).get();
      if (!doc.exists || doc.data() == null) {
        throw Exception('Course not found');
      }
      final data = doc.data()!;
      data['id'] = doc.id;
      return CourseModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load course details: $e');
    }
  }
}
