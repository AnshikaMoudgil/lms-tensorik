import 'package:flutter_test/flutter_test.dart';
import 'package:lms_learning_app/core/utils/validators.dart';

void main() {
  group('Validators Test', () {
    test('validateEmail should return error for empty email', () {
      final result = Validators.validateEmail('');
      expect(result, 'Email is required');
    });

    test('validateEmail should return error for invalid email', () {
      final result = Validators.validateEmail('invalid-email');
      expect(result, 'Please enter a valid email');
    });

    test('validateEmail should return null for valid email', () {
      final result = Validators.validateEmail('test@example.com');
      expect(result, null);
    });

    test('validatePassword should return error for short password', () {
      final result = Validators.validatePassword('12345');
      expect(result, 'Password must be at least 6 characters long');
    });

    test('validatePassword should return null for valid password', () {
      final result = Validators.validatePassword('password123');
      expect(result, null);
    });
  });
}
