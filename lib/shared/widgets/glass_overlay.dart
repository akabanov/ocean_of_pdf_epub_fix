import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedGlassOverlay extends StatefulWidget {
  const AnimatedGlassOverlay({
    super.key,
    required this.opaque,
    this.child,
    this.blurStrength = 6,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  final bool opaque;
  final Widget? child;
  final double blurStrength;
  final Duration animationDuration;

  @override
  State<AnimatedGlassOverlay> createState() => _AnimatedGlassOverlayState();
}

class _AnimatedGlassOverlayState extends State<AnimatedGlassOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: widget.opaque ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(AnimatedGlassOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    final opaque = widget.opaque;
    if (opaque != oldWidget.opaque) {
      if (opaque) {
        _animation.forward();
      } else {
        _animation.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blur = widget.blurStrength;

    return IgnorePointer(
      ignoring: !widget.opaque,
      child: FadeTransition(
        opacity: _animation,
        child: ClipRect(
          child: BackdropFilter(
            enabled: widget.opaque,
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: ColoredBox(color: Colors.black54, child: widget.child),
          ),
        ),
      ),
    );
  }
}
