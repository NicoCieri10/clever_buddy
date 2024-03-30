part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  attempting,
  authenticated,
  unauthenticated,
  emailNotVerified,
  error,
  passwordResetEmailSent,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.error,
  });

  final LoginStatus status;
  final String? error;

  bool get isInitial => status == LoginStatus.initial;
  bool get isAttempting => status == LoginStatus.attempting;
  bool get isAuthenticated => status == LoginStatus.authenticated;
  bool get isUnauthenticated => status == LoginStatus.unauthenticated;
  bool get isEmailNotVerified => status == LoginStatus.emailNotVerified;
  bool get isError => status == LoginStatus.error;
  bool get isPasswordResetEmailSent =>
      status == LoginStatus.passwordResetEmailSent;

  LoginState copyWith({
    LoginStatus? status,
    String? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
