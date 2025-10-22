import 'package:dartz/dartz.dart';
import 'package:pet_pass/features/profiel/data/models/user_info_model.dart';

abstract class AuthRepo {
  Future<Either<String, Map<String, dynamic>>> login({
    required String username,
    required String password,
  });

  Future<Either<String, Map<String, dynamic>>> register({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<String, bool>> resetPasswordSendEmail({required String email});

  Future<Either<String, bool>> validateResetCode({
    required String email,
    required String code,
  });
  Future<Either<String, bool>> updateUserRole({
    required String userId,
    required String role,
  });

  Future<Either<String, bool>> setNewPassword({
    required String email,
    required String code,
    required String newPassword,
  });

  Future<Either<String, UserModel>> getUserProfile();

  Future<Either<String, Map<String, dynamic>>> getSubscriptionStatus();

  Future<void> logout();

  Future<bool> isLoggedIn();

  Future<bool> isTokenValid();

  Future<Map<String, String?>> getUserDataFromStorage();
}
