import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    firebaseAuth: firebase_auth.FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepository({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  Stream<firebase_auth.User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserModel?> getCurrentUserData() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return await getUserData(user.uid);
    }
    return null;
  }

  Future<UserModel?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get user data: $e');
    }
  }

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) throw Exception('Sign up failed');

      final userModel = UserModel(
        uid: user.uid,
        name: name,
        email: email,
        createdAt: DateTime.now(),
      );

      // Save user to firestore
      await _firestore.collection('users').doc(user.uid).set(userModel.toJson());

      return userModel;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Sign up failed');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      final user = userCredential.user;
      if (user == null) throw Exception('Login failed');

      final userData = await getUserData(user.uid);
      if (userData == null) throw Exception('User data not found');

      return userData;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Login failed');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Failed to send password reset email');
    }
  }

  Future<void> enrollInCourse(String uid, String courseId) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'enrolledCourses': FieldValue.arrayUnion([courseId]),
      });
    } catch (e) {
      throw Exception('Failed to enroll in course: $e');
    }
  }

  Future<void> toggleLessonCompletion(String uid, String lessonId, bool isCompleted) async {
    try {
      if (isCompleted) {
        await _firestore.collection('users').doc(uid).update({
          'completedLessons': FieldValue.arrayUnion([lessonId]),
        });
      } else {
        await _firestore.collection('users').doc(uid).update({
          'completedLessons': FieldValue.arrayRemove([lessonId]),
        });
      }
    } catch (e) {
      throw Exception('Failed to toggle lesson completion: $e');
    }
  }
}
