import 'package:flutter/material.dart';

/// Layout and design convention for all app dialog contents.
class DialogContent extends StatelessWidget {
  const DialogContent({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: SingleChildScrollView(child: child),
    );
  }
}
