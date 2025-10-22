import 'package:dartz/dartz.dart';
import 'package:pet_pass/core/services/auth_service.dart';
import 'package:pet_pass/features/auth/data/repo/auth_repo.dart';
import 'package:pet_pass/features/profiel/data/models/user_info_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService _authService;

  AuthRepoImpl(this._authService);

  @override
  Future<Either<String, Map<String, dynamic>>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _authService.login(
        username: username,
        password: password,
      );

      if (result['success'] == true) {
        return Right(result['data'] ?? {});
      } else {
        return Left(result['message'] ?? 'حدث خطأ غير معروف');
      }
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authService.register(
        username: username,
        email: email,
        password: password,
      );

      if (result['success'] == true) {
        return Right(result['data'] ?? {});
      } else {
        return Left(result['message'] ?? 'حدث خطأ غير معروف');
      }
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, bool>> resetPasswordSendEmail({
    required String email,
  }) async {
    try {
      final result = await _authService.resetPasswordSendEmail(email: email);

      if (result['success'] == true) {
        return const Right(true);
      } else {
        return Left(result['message'] ?? 'حدث خطأ غير معروف');
      }
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, bool>> validateResetCode({
    required String email,
    required String code,
  }) async {
    try {
      final result = await _authService.validateResetCode(
        email: email,
        code: code,
      );

      if (result['success'] == true) {
        return const Right(true);
      } else {
        return Left(result['message'] ?? 'حدث خطأ غير معروف');
      }
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, bool>> setNewPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      final result = await _authService.setNewPassword(
        email: email,
        code: code,
        newPassword: newPassword,
      );

      if (result['success'] == true) {
        return const Right(true);
      } else {
        return Left(result['message'] ?? 'حدث خطأ غير معروف');
      }
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final result = await _authService.getUserProfile();

      if (result['success'] == true) {
        final userData = result['data'];
        final user = UserModel.fromJson(userData);
        return Right(user);
      } else {
        return Left(result['message'] ?? 'حدث خطأ غير معروف');
      }
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getSubscriptionStatus() async {
    try {
      final result = await _authService.getSubscriptionStatus();

      if (result['success'] == true) {
        return Right(result['data'] ?? {});
      } else {
        return Left(result['message'] ?? 'حدث خطأ غير معروف');
      }
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      // حتى لو حصل خطأ، امسح البيانات
      await _authService.logout();
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      return await _authService.isLoggedIn();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isTokenValid() async {
    try {
      return await _authService.isTokenValid();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map<String, String?>> getUserDataFromStorage() async {
    try {
      return await _authService.getUserDataFromStorage();
    } catch (e) {
      return {'email': null, 'nicename': null, 'display_name': null};
    }
  }

  @override
  Future<Either<String, bool>> updateUserRole({
    required String userId,
    required String role,
  }) async {
    try {
      final result = await _authService.updateUserRole(
        userId: userId,
        role: role,
      );

      if (result['success'] == true) {
        return const Right(true);
      } else {
        return Left(result['message'] ?? 'حدث خطأ غير معروف');
      }
    } catch (e) {
      return Left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }
}
