import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

/// {@template user_repository}
/// This class handles User Collection requests
/// {@endtemplate}
class UserRepository {
  static SupabaseClient get _supabase => Supabase.instance.client;
  static SupabaseQueryBuilder get _collection => _supabase.from('users');

  /// Method used to create new [User]
  static Future<bool> createUser(User user) async {
    try {
      final userMap = user.toMap();
      await _collection.insert(userMap);

      return true;
    } catch (e) {
      throw UserRepositoryCreateException(e);
    }
  }

  /// Method used to fetch a [User]
  static Future<User> fetchUser(String id) async {
    try {
      final data = await _collection.select().eq('id', id).limit(1).single();

      return User.fromMap(data.cast<String, dynamic>());
    } catch (e) {
      throw UserRepositoryFetchException(e);
    }
  }
}
