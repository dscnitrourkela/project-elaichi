class CustomException implements Exception {
  const CustomException(
    this.cause, {
    this.message,
  });

  final String? message;

  final dynamic cause;

  @override
  String toString() => 'CustomException(message: $message, cause: $cause)';
}
