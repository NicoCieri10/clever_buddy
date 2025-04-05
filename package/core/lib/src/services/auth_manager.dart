import 'package:supabase_flutter/supabase_flutter.dart';

/// Service [AuthManager] used for authorization across the app
class AuthManager {
  const AuthManager._();

  static final Supabase _auth = Supabase.instance;

  /// Getter used to get the current authenticated user
  static User? get currentUser => _auth.client.auth.currentUser;

  /// Getter used to know wether the user is logged in or not
  static bool get isLoggedIn => _auth.client.auth.currentUser != null;

  /// Method used to sign out from Supabase
  static Future<void> signOut() => _auth.client.auth.signOut();

  /// Method used to sign in on Supabase
  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async =>
      _auth.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

  /// Method used to sign up on Supabase
  static Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async =>
      _auth.client.auth.signUp(
        email: email,
        password: password,
      );

  /// Method used to re-send the verification email
  static Future<ResendResponse> resendEmail({
    required String email,
    required OtpType type,
  }) async =>
      _auth.client.auth.resend(
        email: email,
        type: type,
      );

  /// Method used to reset the user password
  static Future<void> resetPassword({required String email}) async =>
      _auth.client.auth.resetPasswordForEmail(email);
}
