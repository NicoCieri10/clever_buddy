import 'package:bloc/bloc.dart';
import 'package:clever_buddy/auth/auth.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required AuthManager authManager,
  })  : _authManager = authManager,
        super(const RegisterState());

  final AuthManager _authManager;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: RegisterStatus.attempting));

    try {
      final authUser = await _authManager.signUp(
        email: email.trim(),
        password: password.trim(),
      );

      if (authUser.user?.identities == null ||
          authUser.user!.identities!.isEmpty) {
        emit(state.copyWith(status: RegisterStatus.emailAlreadyInUse));
        return;
      }

      // final create = await UserRepository.createUser(
      //   user: user.copyWith(
      //     id: result.user!.id,
      //     profilePicture: profilePictureUrl,
      //   ),
      // );

      await _authManager.signOut();

      emit(state.copyWith(status: RegisterStatus.registered));
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          error: e.toString(),
        ),
      );
    }
  }
}
