import 'package:logger/logger.dart';

export 'package:logger/logger.dart';

/// Returns a logger instance with SimpleLogPrinter as the printer.
Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}

/// Customised log printer for meaningful and concise log messages.
class SimpleLogPrinter extends LogPrinter {
  /// The constructor takes in the className.
  SimpleLogPrinter(this.className);
  
  /// Stores the name of the calling class.
  final String className;

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    // final emoji = PrettyPrinter.levelEmojis[event.level];

    return [color('$className - ${event.message}')];
  }
}
