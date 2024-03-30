import 'package:supabase_flutter/supabase_flutter.dart';

class AuthManager {
  final Supabase _auth = Supabase.instance;

  User? currentUser() => _auth.client.auth.currentUser;

  bool isLoggedIn() => _auth.client.auth.currentUser != null;

  Future<void> signOut() => _auth.client.auth.signOut();

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async =>
      _auth.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async =>
      _auth.client.auth.signUp(
        email: email,
        password: password,
      );

  Future<ResendResponse> resendEmail({
    required String email,
    required OtpType type,
  }) async =>
      _auth.client.auth.resend(
        email: email,
        type: type,
      );

  Future<void> resetPassword({required String email}) async =>
      _auth.client.auth.resetPasswordForEmail(email);
}
