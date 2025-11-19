import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyDownEventListener extends StatefulWidget {
  final Map<LogicalKeyboardKey, void Function()> callbacks;
  final Widget child;

  const KeyDownEventListener({
    super.key,
    required this.callbacks,
    required this.child,
  });

  @override
  State<KeyDownEventListener> createState() => _KeyDownEventListenerState();
}

class _KeyDownEventListenerState extends State<KeyDownEventListener> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (KeyEvent event) {
        final callback = widget.callbacks[event.logicalKey];
        if (callback != null && event is KeyDownEvent) {
          callback();
        }
      },
      child: GestureDetector(
        onTap: _focusNode.requestFocus,
        behavior: HitTestBehavior.translucent,
        child: widget.child,
      ),
    );
  }
}
