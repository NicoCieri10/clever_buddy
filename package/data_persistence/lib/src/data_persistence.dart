import 'package:core/core.dart';
import 'package:data_persistence/src/data_persistence_exceptions.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// {@template data_persistence}
/// This class handles the local storage of data.
/// {@endtemplate}
class DataPersistence {
  /// {@macro data_persistence}
  const DataPersistence();

  /// The key for the user info box.
  static const _userInfoKey = 'userInfo';

  /// Initializes the data persistence.
  Future<void> init() async {
    try {
      final directory = await getApplicationSupportDirectory();

      if (!directory.existsSync()) {
        directory.createSync();
      }

      Hive.init(directory.path);

      await Future.wait([
        Hive.openBox<dynamic>(_userInfoKey),
      ]);
    } catch (e) {
      throw DataPersistenceInitException(e);
    }
  }

  /// Clears all the data.
  Future<void> clear() async {
    try {
      await Future.wait([
        _userInfo.clear(),
      ]);
    } catch (e) {
      throw DataPersistenceWriteException(e);
    }
  }

  /// Returns the user info box.
  Box<dynamic> get _userInfo => Hive.box<dynamic>(_userInfoKey);

  /// Get whether the user is logged in or not.
  Stream<bool> get isLoggedInStream async* {
    yield* _userInfo.watch(key: UserInfoKeys.user).asyncMap(
          (_) => _userInfo.get(UserInfoKeys.user) != null,
        );
  }

  /// Sets the user credentials.
  Future<void> setUserInfo(User user) async {
    final userMap = user.toMap();
    try {
      await _userInfo.put(UserInfoKeys.user, userMap);
    } catch (e) {
      throw DataPersistenceWriteException(e);
    }
  }

  /// Returns the user credentials.
  User? get getUser {
    try {
      final user = _userInfo.get(UserInfoKeys.user) as Map?;
      final userMap = user?.cast<String, dynamic>();

      if ((userMap?.isEmpty ?? true) || userMap == null) return null;

      return User.fromMap(userMap);
    } catch (e) {
      throw DataPersistenceReadException(e);
    }
  }
}

/// {@template user_info_keys}
/// This class handles all the keys for the user info box.
/// {@endtemplate}
class UserInfoKeys {
  /// {@macro user_info_keys}
  const UserInfoKeys();

  /// The key for the user credentials.
  static const user = 'user';
}
