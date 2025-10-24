import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/features/auth/data/repo/auth_repo.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo _authRepo;

  ForgotPasswordCubit(this._authRepo) : super(ForgotPasswordInitial());

  int currentStep = 0;
  String? _email;
  String? _code;

  void goNextStep() {
    if (currentStep < 2) {
      currentStep++;
      emit(ForgotPasswordStepChanged(currentStep));
    }
  }

  void goPreviousStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(ForgotPasswordStepChanged(currentStep));
    }
  }

  Future<void> sendResetCode(String email) async {
    emit(ForgotPasswordLoading());

    _email = email;
    final result = await _authRepo.resetPasswordSendEmail(email: email);

    result.fold((error) => emit(ForgotPasswordError(error)), (_) {
      emit(ResetCodeSent());
      goNextStep();
    });
  }

  Future<void> verifyCode(String code) async {
    if (_email == null) {
      emit(ForgotPasswordError('Email not found'));
      return;
    }

    emit(ForgotPasswordLoading());

    _code = code;

    final result = await _authRepo.validateResetCode(
      email: _email!,
      code: code,
    );

    result.fold((error) => emit(ForgotPasswordError(error)), (_) {
      emit(CodeVerified());
      goNextStep();
    });
  }

  Future<void> setNewPassword(String newPassword) async {
    if (_email == null || _code == null) {
      emit(ForgotPasswordError('Missing email or code'));
      return;
    }

    emit(ForgotPasswordLoading());

    final result = await _authRepo.setNewPassword(
      email: _email!,
      code: _code!,
      newPassword: newPassword,
    );

    result.fold(
      (error) => emit(ForgotPasswordError(error)),
      (_) => emit(PasswordResetSuccess()),
    );
  }
}
