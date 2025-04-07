/// {@template data_persistence_exception}
/// Exception for the `DataPersistenceRepository`.
/// {@endtemplate}
class DataPersistenceException implements Exception {
  /// {@macro data_persistence_exception}
  const DataPersistenceException(this.error);

  /// The error that caused the exception.
  final Object error;
}

/// {@template data_persistence_init_exception}
/// Exception for the initialization of `DataPersistenceRepository`.
/// {@endtemplate}
class DataPersistenceInitException extends DataPersistenceException {
  /// {@macro data_persistence_init_exception}
  const DataPersistenceInitException(super.error);
}

/// {@template data_persistence_read_exception}
/// Exception for the `DataPersistenceRepository` when the data is not found.
/// {@endtemplate}
class DataPersistenceReadException extends DataPersistenceException {
  /// {@macro data_persistence_read_exception}
  const DataPersistenceReadException(super.error);
}

/// {@template data_persistence_write_exception}
/// Exception for when the `DataPersistenceRepository` cannot write the data.
/// {@endtemplate}
class DataPersistenceWriteException extends DataPersistenceException {
  /// {@macro data_persistence_write_exception}
  const DataPersistenceWriteException(super.error);
}

/// {@template data_persistence_delete_exception}
/// Exception for when the `DataPersistenceRepository` cannot delete the data.
/// {@endtemplate}
class DataPersistenceDeleteException extends DataPersistenceException {
  /// {@macro data_persistence_delete_exception}
  const DataPersistenceDeleteException(super.error);
}

/// {@template data_persistence_unknown_exception}
/// Exception for when the `DataPersistenceRepository` throws an unknown error.
/// {@endtemplate}
class DataPersistenceUnknownException extends DataPersistenceException {
  /// {@macro data_persistence_unknown_exception}
  const DataPersistenceUnknownException(super.error);
}
