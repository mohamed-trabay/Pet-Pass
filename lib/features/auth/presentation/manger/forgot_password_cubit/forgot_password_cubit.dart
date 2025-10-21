import 'package:flutter_bloc/flutter_bloc.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  int currentStep = 0;

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

  void sendResetCode(String email) async {
    emit(ForgotPasswordLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(ResetCodeSent());
    goNextStep();
  }

  void verifyCode(String code) async {
    emit(ForgotPasswordLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(CodeVerified());
    goNextStep();
  }

  void setNewPassword(String newPassword) async {
    emit(ForgotPasswordLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(PasswordResetSuccess());
  }
}
