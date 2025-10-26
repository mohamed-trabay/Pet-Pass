import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/services/cloudinary_service.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';

part 'profiel_image_state.dart';

class ProfielImageCubit extends Cubit<ProfielImageState> {
  final CloudinaryAvatarService cloudinaryService;
  final AuthCubit authCubit;
  ProfielImageCubit({required this.cloudinaryService, required this.authCubit})
    : super(ProfielImageInitial());
  // Pick and Upload Image
  Future<void> pickAndUploadImage({bool fromCamera = false}) async {
    try {
      emit(ProfileImageLoading());

      // Check if logged in
      final currentState = authCubit.state;
      if (currentState is! ProfileLoaded) {
        emit(const ProfileImageFailure('Please login first'));
        return;
      }

      final userId = currentState.profile.id.toString();

      // Pick image
      final imageFile = await cloudinaryService.pickImage(
        fromCamera: fromCamera,
      );

      if (imageFile == null) {
        emit(ProfielImageInitial());
        return;
      }

      // Upload to Cloudinary
      final result = await cloudinaryService.uploadAvatar(
        userId: userId,
        imageFile: imageFile,
      );

      if (result['success'] == true) {
        final imageUrl = result['image_url'] as String;
        emit(ProfileImageSuccess(imageUrl));

        // Refresh profile to show new image
        Future.delayed(const Duration(milliseconds: 500), () {
          authCubit.getUserProfile();
        });
      } else {
        final errorMessage = result['message'] ?? 'Failed to upload';
        emit(ProfileImageFailure(errorMessage));
      }
    } catch (e) {
      emit(const ProfileImageFailure('Failed to upload image'));
    }
  }

  /// Delete Avatar
  Future<void> deleteAvatar() async {
    try {
      emit(ProfileImageLoading());

      final currentState = authCubit.state;
      if (currentState is! ProfileLoaded) {
        emit(const ProfileImageFailure('Please login first'));
        return;
      }

      final userId = currentState.profile.id.toString();
      await cloudinaryService.deleteAvatar(userId);

      emit(ProfielImageInitial());
      authCubit.getUserProfile();
    } catch (e) {
      emit(const ProfileImageFailure('Failed to delete image'));
    }
  }

  /// Reset
  void reset() {
    emit(ProfielImageInitial());
  }
}
