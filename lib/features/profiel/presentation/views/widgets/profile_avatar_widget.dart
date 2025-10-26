import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/api_keys.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/assets.dart';
import 'package:pet_pass/features/profiel/presentation/manger/profiel_image_cubit/profiel_image_cubit.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final double size;
  final bool showEditButton;

  const ProfileAvatarWidget({
    super.key,
    this.size = 60,
    this.showEditButton = true,
  });

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder:
          (context) => Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Change Profile Picture',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt,
                    color: AppColors.primary,
                  ),
                  title: const Text('Take Photo'),
                  onTap: () {
                    Navigator.pop(context);
                    context.read<ProfielImageCubit>().pickAndUploadImage(
                      fromCamera: true,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.photo_library,
                    color: AppColors.primary,
                  ),
                  title: const Text('Choose from Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    context.read<ProfielImageCubit>().pickAndUploadImage(
                      fromCamera: false,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.close, color: Colors.red),
                  title: const Text('Cancel'),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
    );
  }

  String _getCloudinaryAvatarUrl(String userId) {
    final cloudName = ApiKeys.cloudinaryCloudName;
    return 'https://res.cloudinary.com/$cloudName/image/upload/avatars/user_$userId.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    String? userId;

    if (authState is ProfileLoaded) {
      userId = authState.profile.id.toString();
    }

    if (userId == null) {
      return const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(AssetsData.profielUser),
      );
    }

    return GestureDetector(
      onTap: showEditButton ? () => _showImagePickerOptions(context) : null,
      child: Stack(
        children: [
          BlocBuilder<ProfielImageCubit, ProfielImageState>(
            builder: (context, imageState) {
              String displayUrl = _getCloudinaryAvatarUrl(userId!);

              // ✅ فقط أضف ?t= لما تترفع صورة جديدة
              if (imageState is ProfileImageSuccess) {
                displayUrl =
                    '${imageState.imageUrl}?t=${DateTime.now().millisecondsSinceEpoch}';
              }

              return SizedBox(
                width: size.w,
                height: size.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size.r / 2),
                  child: CachedNetworkImage(
                    key: ValueKey(
                      displayUrl,
                    ), // يجبر على التحديث عند تغيّر الرابط
                    imageUrl: displayUrl,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(AssetsData.profielUser),
                        ),
                  ),
                ),
              );
            },
          ),

          if (showEditButton)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(Icons.camera_alt, size: 14.r, color: Colors.white),
              ),
            ),

          BlocBuilder<ProfielImageCubit, ProfielImageState>(
            builder: (context, imageState) {
              if (imageState is ProfileImageLoading) {
                return Container(
                  width: size.w,
                  height: size.h,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(size.r / 2),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
