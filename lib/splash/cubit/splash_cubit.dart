import 'package:bloc/bloc.dart';
import 'package:clever_buddy/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required AuthManager authManager,
  })  : _authManager = authManager,
        super(const SplashState()) {
    init();
  }

  final AuthManager _authManager;

  Future<void> init() async {
    emit(state.copyWith(status: SplashStatus.attempting));
    try {
      await Future.delayed(
        const Duration(seconds: 1),
        () {},
      );

      final result = await InternetConnectionChecker().hasConnection;

      if (!result) {
        emit(state.copyWith(status: SplashStatus.offline));
        return;
      }

      final isLoggedIn = _authManager.isLoggedIn();

      if (!isLoggedIn) {
        emit(state.copyWith(status: SplashStatus.unauthenticated));
        return;
      }

      emit(state.copyWith(status: SplashStatus.authenticated));
    } catch (e) {
      emit(
        state.copyWith(
          status: SplashStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }
}
