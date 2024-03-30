part of 'register_cubit.dart';

enum RegisterStatus {
  initial,
  attempting,
  registered,
  success,
  emailAlreadyInUse,
  error,
}

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.error,
  });

  final RegisterStatus status;
  final String? error;

  bool get isInitial => status == RegisterStatus.initial;
  bool get isAttempting => status == RegisterStatus.attempting;
  bool get isRegistered => status == RegisterStatus.registered;
  bool get isSuccess => status == RegisterStatus.success;
  bool get isEmailAlreadyInUse => status == RegisterStatus.emailAlreadyInUse;
  bool get isError => status == RegisterStatus.error;

  RegisterState copyWith({
    RegisterStatus? status,
    String? error,
  }) {
    return RegisterState(
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
