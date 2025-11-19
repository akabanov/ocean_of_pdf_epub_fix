import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class Log {
  static init() {
    Logger.root.level = kDebugMode ? Level.ALL : Level.WARNING;
    Logger.root.onRecord.listen((record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  final Logger _logger;

  Log.forName(String name) : _logger = Logger(name);

  Log.forType(Type type) : _logger = Logger(type.toString());

  // Forward the Logger API you need:
  void finest(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.finest(message, error, stackTrace);

  void finer(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.finer(message, error, stackTrace);

  void fine(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.fine(message, error, stackTrace);

  void config(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.config(message, error, stackTrace);

  void info(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.info(message, error, stackTrace);

  void warning(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.warning(message, error, stackTrace);

  void severe(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.severe(message, error, stackTrace);

  void shout(Object? message, [Object? error, StackTrace? stackTrace]) =>
      _logger.shout(message, error, stackTrace);

  Stream<LogRecord> get onRecord => _logger.onRecord;

  Level get level => _logger.level;

  set level(Level? value) => _logger.level = value;
}
