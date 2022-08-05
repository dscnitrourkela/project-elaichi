class LocalStorageException implements Exception {
  const LocalStorageException(
    this.message, {
    this.localStorageState,
  });

  /// A message describing the format error.
  final String message;

  /// The current state of Local Storage.
  final Set<String>? localStorageState;

  @override
  String toString() => 'LocalStorageException(message: $message,'
      ' localStorageState: $localStorageState)';
}
