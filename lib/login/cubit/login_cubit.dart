import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: LoginStatus.attempting));
    try {
      final authUser = await AuthManager.signIn(
        email: email.trim(),
        password: password.trim(),
      );

      if (authUser.user == null) throw const AuthException('AuthCubit error');

      // TODO(NicoCieri): save user on DataPersistence
      // await _dataPersistence.setUserInfo(user);

      emit(state.copyWith(status: LoginStatus.authenticated));
    } on AuthException catch (e) {
      if (e.message == 'Email not confirmed') {
        await AuthManager.resendEmail(
          email: email.toLowerCase(),
          type: OtpType.signup,
        );
        await AuthManager.signOut();
        emit(state.copyWith(status: LoginStatus.emailNotVerified));
        return;
      }

      emit(state.copyWith(status: LoginStatus.unauthenticated));
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          error: e.toString(),
        ),
      );
    }
  }
}
