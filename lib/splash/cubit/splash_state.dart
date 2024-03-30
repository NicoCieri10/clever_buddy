part of 'splash_cubit.dart';

enum SplashStatus {
  initial,
  attempting,
  authenticated,
  unauthenticated,
  offline,
  failure,
}

class SplashState extends Equatable {
  const SplashState({
    this.status = SplashStatus.initial,
    this.error,
  });

  final SplashStatus status;
  final String? error;

  bool get isInitial => status == SplashStatus.initial;
  bool get isAuthenticated => status == SplashStatus.authenticated;
  bool get isUnauthenticated => status == SplashStatus.unauthenticated;
  bool get isOffline => status == SplashStatus.offline;
  bool get isFailure => status == SplashStatus.failure;

  SplashState copyWith({
    SplashStatus? status,
    String? error,
  }) {
    return SplashState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
