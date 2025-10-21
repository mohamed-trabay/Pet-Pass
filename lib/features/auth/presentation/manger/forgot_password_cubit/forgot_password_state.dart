abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordStepChanged extends ForgotPasswordState {
  final int step;
  ForgotPasswordStepChanged(this.step);
}

class ResetCodeSent extends ForgotPasswordState {}

class CodeVerified extends ForgotPasswordState {}

class PasswordResetSuccess extends ForgotPasswordState {}

class ForgotPasswordError extends ForgotPasswordState {
  final String message;
  ForgotPasswordError(this.message);
}
