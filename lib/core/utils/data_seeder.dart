import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../features/course/domain/models/course_model.dart';
import '../../features/lesson/domain/models/lesson_model.dart';

class DataSeeder {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const Uuid _uuid = Uuid();

  static Future<void> seedDatabase() async {
    try {
      final coursesSnapshot = await _firestore.collection('courses').limit(1).get();
      if (coursesSnapshot.docs.isNotEmpty) {
        debugPrint('Database already seeded!');
        return;
      }

      debugPrint('Seeding Database...');

      final courses = [
        CourseModel(
          id: _uuid.v4(),
          title: 'Flutter Mastery: From Zero to Hero',
          description: 'Learn Flutter from scratch and build stunning, high-performance apps for iOS and Android.',
          thumbnail: 'https://images.unsplash.com/photo-1617042375876-a13e36732a04?q=80&w=1470&auto=format&fit=crop',
          instructor: 'Agam',
          category: 'Development',
          duration: 360, // 6 hours
          lessonCount: 3,
        ),
        CourseModel(
          id: _uuid.v4(),
          title: 'UI/UX Design Fundamentals',
          description: 'Master the principles of user interface and user experience design using Figma and modern design systems.',
          thumbnail: 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=1000&auto=format&fit=crop',
          instructor: 'Sarah Lee',
          category: 'Design',
          duration: 180,
          lessonCount: 3,
        ),
        CourseModel(
          id: _uuid.v4(),
          title: 'Startup Business Strategies',
          description: 'Learn how to validate ideas, raise capital, and scale your startup successfully.',
          thumbnail: 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?q=80&w=1000&auto=format&fit=crop',
          instructor: 'Michael Chen',
          category: 'Business',
          duration: 240,
          lessonCount: 2,
        ),
      ];

      for (var course in courses) {
        await _firestore.collection('courses').doc(course.id).set(course.toJson());

        // Create Lessons for this course
        for (int i = 0; i < course.lessonCount; i++) {
          final lessonId = _uuid.v4();
          final lesson = LessonModel(
            id: lessonId,
            courseId: course.id,
            title: 'Lesson ${i + 1}: ${course.title} Part ${i + 1}',
            description: 'This is a detailed description for Lesson ${i + 1} of ${course.title}. You will learn amazing things.',
            videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            order: i,
          );
          await _firestore.collection('lessons').doc(lessonId).set(lesson.toJson());
        }
      }

      debugPrint('Database seeded successfully!');
    } catch (e) {
      debugPrint('Error seeding database: $e');
    }
  }
}
