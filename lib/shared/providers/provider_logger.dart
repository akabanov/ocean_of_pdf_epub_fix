import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ocean_of_pdf_epub_fix/shared/log/log.dart';

/// Global Riverpod observer that logs any provider error with its stacktrace.
///
/// Attach via ProviderScope(observers: const [AppProviderObserver()]).
final class AppProviderObserver extends ProviderObserver {
  static final Log _log = Log.forType(AppProviderObserver);

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    final provider = context.provider;
    final providerName = _providerName(context);

    // Send error to Flutter's error handler (shows in console and dev tools)
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'flutter_riverpod',
        informationCollector: () => [
          DiagnosticsNode.message('Provider: $providerName'),
          DiagnosticsNode.message(
            'Provider runtimeType: ${provider.runtimeType}',
          ),
        ],
        context: ErrorDescription('Riverpod provider emitted an error'),
      ),
    );

    // Fallback console log for non-Flutter handlers / tests
    _log.severe(
      '[Riverpod] Error in provider "$providerName"',
      error,
      stackTrace,
    );
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    _log.info(
      'Provider ${_providerName(context)}: ${previousValue.runtimeType} -> ${newValue.runtimeType}',
    );
  }

  String _providerName(ProviderObserverContext context) {
    return context.provider.name ?? context.provider.runtimeType.toString();
  }
}
