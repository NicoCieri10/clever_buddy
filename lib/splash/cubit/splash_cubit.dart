import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(status: SplashStatus.attempting));
    try {
      await Future.delayed(
        const Duration(seconds: 1),
        () {},
      );

      final result = await InternetConnectionChecker.instance.hasConnection;

      if (!result) {
        emit(state.copyWith(status: SplashStatus.offline));
        return;
      }

      if (!AuthManager.isLoggedIn) {
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
