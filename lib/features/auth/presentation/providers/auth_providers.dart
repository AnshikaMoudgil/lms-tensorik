import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../domain/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

// Stream provider for firebase auth state
final authStateProvider = StreamProvider<firebase_auth.User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

// Notifier to hold the custom UserModel data
final authControllerProvider = AsyncNotifierProvider<AuthController, UserModel?>(() {
  return AuthController();
});

class AuthController extends AsyncNotifier<UserModel?> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<UserModel?> build() async {
    _authRepository = ref.watch(authRepositoryProvider);
    return _authRepository.getCurrentUserData();
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.logout();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    await _authRepository.sendPasswordResetEmail(email);
  }
}
