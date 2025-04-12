/// {@template user_repository_exception}
/// Exception for the `UserRepository`.
/// {@endtemplate}
class UserRepositoryException implements Exception {
  /// {@macro user_repository_exception}
  const UserRepositoryException(this.error);

  /// The error that caused the exception.
  final Object? error;

  @override
  String toString() {
    if (error == null) return 'UserRepositoryException';
    return 'UserRepositoryException: $error';
  }
}

/// {@template user_repository_create_exception}
/// Exception for the creation of a new `User`.
/// {@endtemplate}
class UserRepositoryCreateException extends UserRepositoryException {
  /// {@macro user_repository_create_exception}
  const UserRepositoryCreateException(super.error);
}

/// {@template user_repository_fetch_exception}
/// Exception for the fetch of a `User`.
/// {@endtemplate}
class UserRepositoryFetchException extends UserRepositoryException {
  /// {@macro user_repository_fecth_exception}
  const UserRepositoryFetchException(super.error);
}
