/// Gets error messages to the UI.
class Failure {
  /// The integer error code for the error.
  final int code;

  /// The error message for the error.
  final String message;

  /// Returns an instance of failure with the supplied error code and message.
  Failure(this.code, this.message);

  @override
  String toString() => message;
}
