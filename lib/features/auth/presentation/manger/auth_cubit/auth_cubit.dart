import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/features/auth/data/repo/auth_repo.dart';
import 'package:pet_pass/features/profiel/data/models/user_info_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  // ===== LOGIN =====
  // ===== LOGIN =====
  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await _authRepo.login(
      username: username,
      password: password,
    );

    result.fold((error) => emit(AuthFailure(error)), (data) async {
      // اعمل emit للـ AuthSuccess عشان الـ UI يعمل navigation
      emit(AuthSuccess(data));

      // بعدين جيب الـ profile في الخلفية
      final profileResult = await _authRepo.getUserProfile();

      profileResult.fold(
        (error) {}, // ignore error here
        (profile) => emit(ProfileLoaded(profile)),
      );
    });
  }

  // ===== REGISTER =====
  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await _authRepo.register(
      username: username,
      email: email,
      password: password,
    );

    result.fold(
      (error) => emit(AuthFailure(error)),
      (data) => emit(AuthSuccess(data)),
    );
  }

  // ===== RESET PASSWORD - STEP 1 =====
  Future<void> resetPasswordSendEmail(String email) async {
    emit(AuthLoading());

    final result = await _authRepo.resetPasswordSendEmail(email: email);

    result.fold(
      (error) => emit(AuthFailure(error)),
      (_) => emit(ResetPasswordCodeSent()),
    );
  }

  // ===== RESET PASSWORD - STEP 2 =====
  Future<void> validateResetCode({
    required String email,
    required String code,
  }) async {
    emit(AuthLoading());

    final result = await _authRepo.validateResetCode(email: email, code: code);

    result.fold(
      (error) => emit(AuthFailure(error)),
      (_) => emit(ResetPasswordCodeValidated()),
    );
  }

  // ===== RESET PASSWORD - STEP 3 =====
  Future<void> setNewPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    emit(AuthLoading());

    final result = await _authRepo.setNewPassword(
      email: email,
      code: code,
      newPassword: newPassword,
    );

    result.fold(
      (error) => emit(AuthFailure(error)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }

  // ===== GET PROFILE =====
  Future<void> getUserProfile() async {
    emit(AuthLoading());

    final result = await _authRepo.getUserProfile();

    result.fold(
      (error) => emit(AuthFailure(error)),
      (data) => emit(ProfileLoaded(data)),
    );
  }

  // ===== CHECK SUBSCRIPTION =====
  Future<void> checkSubscription() async {
    emit(AuthLoading());

    final result = await _authRepo.getSubscriptionStatus();

    result.fold(
      (error) => emit(AuthFailure(error)),
      (data) => emit(SubscriptionLoaded(data)),
    );
  }

  // ===== LOGOUT =====
  Future<void> logout() async {
    await _authRepo.logout();
    emit(AuthInitial());
  }

  // ===== CHECK IF LOGGED IN AND GET PROFILE =====
  Future<void> checkLoginStatus() async {
    emit(AuthLoading());

    final isLoggedIn = await _authRepo.isLoggedIn();

    if (isLoggedIn) {
      // لو المستخدم مسجل دخول، جيب الـ profile على طول
      final result = await _authRepo.getUserProfile();

      result.fold(
        (error) => emit(AuthFailure(error)),
        (data) => emit(ProfileLoaded(data)),
      );
    } else {
      emit(AuthInitial());
    }
  }
}
