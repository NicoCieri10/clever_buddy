import 'package:bloc/bloc.dart';
import 'package:clever_buddy/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthManager authManager,
  })  : _authManager = authManager,
        super(const LoginState());

  final AuthManager _authManager;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: LoginStatus.attempting));
    try {
      final authUser = await _authManager.signIn(
        email: email.trim(),
        password: password.trim(),
      );

      print(authUser);

      // await _dataPersistence.setUserInfo(user);

      emit(state.copyWith(status: LoginStatus.authenticated));
    } on AuthException catch (e) {
      if (e.message == 'Email not confirmed') {
        await _authManager.resendEmail(
          email: email.toLowerCase(),
          type: OtpType.signup,
        );
        await _authManager.signOut();
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
