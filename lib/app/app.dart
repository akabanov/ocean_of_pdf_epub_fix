import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ocean_of_pdf_epub_fix/shared/providers/provider_logger.dart';
import 'package:ocean_of_pdf_epub_fix/shared/scaffold_messenger/scaffold_messenger.dart';

/// Root application widget with ProviderScope and app-wide configuration.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ProviderScope at the top of the tree for Riverpod
    return ProviderScope(
      observers: [AppProviderObserver()],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        home: const Placeholder(),
      ),
    );
  }
}
