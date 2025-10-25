import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pet_pass/core/utiles/api_keys.dart';

class AuthService {
  static const String baseUrl = ApiKeys.authbaseUrl;
  final Dio _dio;
  final FlutterSecureStorage _storage;

  AuthService(this._dio, {FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  // ===== LOGIN =====
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/jwt-auth/v1/token',
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = response.data;

        await _storage.write(key: 'auth_token', value: data['token']);
        await _storage.write(key: 'user_email', value: data['user_email']);
        await _storage.write(
          key: 'user_nicename',
          value: data['user_nicename'],
        );
        await _storage.write(
          key: 'user_display_name',
          value: data['user_display_name'],
        );

        return {'success': true, 'data': data, 'message': 'Login successful'};
      }

      return {
        'success': false,
        'message': response.data['message'] ?? 'Login failed',
      };
    } on DioException catch (e) {
      return {'success': false, 'message': _handleError(e)};
    } catch (e) {
      return {
        'success': false,
        'message': 'حدث خطأ غير متوقع: ${e.toString()}',
      };
    }
  }

  // ===== REGISTER =====
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/wp/v2/users',
        data: {'username': username, 'email': email, 'password': password},
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiKeys.adminToken}'},
        ),
      );

      if (response.statusCode == 201) {
        return await login(username: username, password: password);
      }

      return {
        'success': false,
        'message': response.data['message'] ?? 'Registration failed',
      };
    } on DioException catch (e) {
      return {'success': false, 'message': _handleError(e)};
    } catch (e) {
      return {
        'success': false,
        'message': 'حدث خطأ غير متوقع: ${e.toString()}',
      };
    }
  }

  // ===== RESET PASSWORD - STEP 1 =====
  Future<Map<String, dynamic>> resetPasswordSendEmail({
    required String email,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/bdpwr/v1/reset-password',
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Code sent to your email'};
      }

      return {
        'success': false,
        'message': response.data['message'] ?? 'Email not found',
      };
    } on DioException catch (e) {
      return {'success': false, 'message': _handleError(e)};
    } catch (e) {
      return {
        'success': false,
        'message': 'حدث خطأ غير متوقع: ${e.toString()}',
      };
    }
  }

  // ===== RESET PASSWORD - STEP 2 =====
  Future<Map<String, dynamic>> validateResetCode({
    required String email,
    required String code,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/bdpwr/v1/validate-code',
        data: {'email': email, 'code': code},
      );

      if (response.statusCode == 200 && response.data != null) {
        final status = response.data['data']?['status'] ?? 400;
        return {
          'success': status == 200,
          'message': response.data['message'] ?? 'Invalid code',
        };
      }

      return {'success': false, 'message': 'Invalid code'};
    } on DioException catch (e) {
      return {'success': false, 'message': _handleError(e)};
    } catch (e) {
      return {
        'success': false,
        'message': 'حدث خطأ غير متوقع: ${e.toString()}',
      };
    }
  }

  // ===== RESET PASSWORD - STEP 3 =====
  Future<Map<String, dynamic>> setNewPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/bdpwr/v1/set-password',
        data: {'email': email, 'code': code, 'password': newPassword},
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Password reset successful'};
      }

      return {
        'success': false,
        'message': response.data['message'] ?? 'Failed to reset password',
      };
    } on DioException catch (e) {
      return {'success': false, 'message': _handleError(e)};
    } catch (e) {
      return {
        'success': false,
        'message': 'حدث خطأ غير متوقع: ${e.toString()}',
      };
    }
  }

  // ===== GET USER PROFILE =====
  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final token = await _storage.read(key: 'auth_token');

      if (token == null || token.isEmpty) {
        return {'success': false, 'message': 'Not authenticated'};
      }

      final response = await _dio.get(
        '$baseUrl/wp/v2/users/me?context=edit',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        return {'success': true, 'data': response.data};
      }

      return {'success': false, 'message': 'Failed to get profile'};
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        await logout();
      }
      return {'success': false, 'message': _handleError(e)};
    } catch (e) {
      return {
        'success': false,
        'message': 'حدث خطأ غير متوقع: ${e.toString()}',
      };
    }
  }

  // ===== CHECK SUBSCRIPTION =====
  Future<Map<String, dynamic>> getSubscriptionStatus() async {
    try {
      final profileResult = await getUserProfile();

      if (!profileResult['success']) {
        return profileResult;
      }

      final userData = profileResult['data'];

      if (userData == null) {
        return {'success': false, 'message': 'Invalid user data'};
      }

      final subscription = userData['meta']?['subscription_plan'] ?? 'free';

      return {
        'success': true,
        'data': {'plan': subscription, 'isActive': subscription != 'free'},
      };
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  // ===== LOGOUT =====
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  // ===== CHECK IF LOGGED IN =====
  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'auth_token');
    return token != null && token.isNotEmpty;
  }

  // ===== VALIDATE TOKEN =====
  Future<bool> isTokenValid() async {
    final token = await _storage.read(key: 'auth_token');
    if (token == null || token.isEmpty) return false;

    try {
      final response = await _dio.get(
        '$baseUrl/wp/v2/users/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // ===== GET TOKEN =====
  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  // ===== GET USER DATA FROM STORAGE =====
  Future<Map<String, String?>> getUserDataFromStorage() async {
    return {
      'email': await _storage.read(key: 'user_email'),
      'nicename': await _storage.read(key: 'user_nicename'),
      'display_name': await _storage.read(key: 'user_display_name'),
    };
  }

  // ===== UPDATE USER ROLE =====
  Future<Map<String, dynamic>> updateUserRole({
    required String userId,
    required String role,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/wp/v2/users/$userId',
        data: {
          'roles': [role],
        },
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiKeys.adminToken}'},
        ),
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Role updated successfully'};
      }

      return {'success': false, 'message': 'Failed to update role'};
    } on DioException catch (e) {
      return {'success': false, 'message': _handleError(e)};
    } catch (e) {
      return {
        'success': false,
        'message': 'حدث خطأ غير متوقع: ${e.toString()}',
      };
    }
  }

  // ===== HANDLE ERRORS =====
  String _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'انتهت مهلة الاتصال. تحقق من الإنترنت';
    }

    if (e.type == DioExceptionType.connectionError) {
      return 'لا يوجد اتصال بالإنترنت';
    }

    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final message = e.response!.data?['message'];

      switch (statusCode) {
        case 400:
          return message ?? 'بيانات غير صحيحة';
        case 401:
          return message ?? 'اسم المستخدم أو كلمة المرور غير صحيحة';
        case 403:
          return message ?? 'ليس لديك صلاحية للوصول';
        case 404:
          return message ?? 'الخدمة غير موجودة';
        case 500:
          return message ?? 'خطأ في الخادم';
        default:
          return message ?? 'حدث خطأ غير متوقع';
      }
    }

    return 'حدث خطأ في الاتصال';
  }
}
