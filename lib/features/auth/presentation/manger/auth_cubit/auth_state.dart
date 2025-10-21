// ===== 4. AUTH STATES (auth_state.dart) =====
part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Map<String, dynamic> userData;
  AuthSuccess(this.userData);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

class AuthLoggedIn extends AuthState {}

class ResetPasswordCodeSent extends AuthState {}

class ResetPasswordCodeValidated extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ProfileLoaded extends AuthState {
  final UserModel profile;

  ProfileLoaded(this.profile);
}

class SubscriptionLoaded extends AuthState {
  final Map<String, dynamic> subscriptionData;
  SubscriptionLoaded(this.subscriptionData);
}
