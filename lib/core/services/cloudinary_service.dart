import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_pass/core/utiles/api_keys.dart';

class CloudinaryAvatarService {
  final Dio _dio;
  final ImagePicker _picker = ImagePicker();

  static String get cloudName => ApiKeys.cloudinaryCloudName;
  static String get uploadPreset => ApiKeys.cloudinaryUploadPreset;
  static String get apiKey => ApiKeys.cloudinaryApiKey;
  static String get apiSecret => ApiKeys.cloudinaryApiSecret;

  CloudinaryAvatarService(this._dio);

  // ===== Pick Image =====
  Future<File?> pickImage({bool fromCamera = false}) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image == null) return null;
      return File(image.path);
    } catch (e) {
      return null;
    }
  }

  // ===== Upload Avatar to Cloudinary =====
  Future<Map<String, dynamic>> uploadAvatar({
    required String userId,
    required File imageFile,
  }) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      // مفيش Overwrite ولا Invalidate مع unsigned upload
      final response = await _dio.post(
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
        data: FormData.fromMap({
          'file': 'data:image/jpeg;base64,$base64Image',
          'upload_preset': uploadPreset,
          'folder': 'avatars',
          'public_id': 'user_$userId', // ممكن تسيب Cloudinary يولد ID تلقائي
        }),
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 200 && response.data['secure_url'] != null) {
        final imageUrl = response.data['secure_url'] as String;

        return {'success': true, 'image_url': imageUrl};
      }

      return {
        'success': false,
        'message':
            response.data?['error']?['message'] ?? 'Failed to upload image',
      };
    } on DioException catch (e) {
      return {
        'success': false,
        'message':
            e.type == DioExceptionType.connectionError
                ? 'No internet connection'
                : 'Failed to upload image',
      };
    } catch (e) {
      return {'success': false, 'message': 'Unexpected error'};
    }
  }

  // ===== Get Avatar URL from Cloudinary =====
  String getAvatarUrl(String userId) {
    return 'https://res.cloudinary.com/$cloudName/image/upload/avatars/user_$userId.jpg';
  }

  // ===== Check if Avatar Exists =====
  Future<bool> avatarExists(String userId) async {
    try {
      final url = getAvatarUrl(userId);
      final response = await _dio.head(url);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // ===== Delete Avatar from Cloudinary (requires signed request) =====
  Future<bool> deleteAvatar(String userId) async {
    try {
      final publicId = 'avatars/user_$userId';

      final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final signature = _generateSignature(
        publicId: publicId,
        timestamp: timestamp,
      );

      final response = await _dio.post(
        'https://api.cloudinary.com/v1_1/$cloudName/image/destroy',
        data: FormData.fromMap({
          'public_id': publicId,
          'signature': signature,
          'api_key': apiKey,
          'timestamp': timestamp,
        }),
        options: Options(validateStatus: (status) => true),
      );

      if (response.statusCode == 200 && response.data['result'] == 'ok') {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  // ===== Generate Signature =====
  String _generateSignature({
    required String publicId,
    required int timestamp,
  }) {
    final stringToSign = 'public_id=$publicId&timestamp=$timestamp$apiSecret';
    final bytes = utf8.encode(stringToSign);
    final digest = sha1.convert(bytes);
    return digest.toString();
  }
}
