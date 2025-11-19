import 'package:flutter/material.dart';
import 'package:ocean_of_pdf_epub_fix/shared/log/log.dart' show Log;

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void maybeShowSnackBar(
  SnackBar snackBar, {
  AnimationStyle? snackBarAnimationStyle,
}) {
  final currentState = scaffoldMessengerKey.currentState;
  if (currentState == null) {
    Log.forName('scaffold_messenger').severe(
      'Scaffold messenger not found; '
      'have you set `scaffoldMessengerKey` in your `MaterialApp`?',
    );
    return;
  }

  currentState.showSnackBar(
    snackBar,
    snackBarAnimationStyle: snackBarAnimationStyle,
  );
}
