import 'package:flutter/material.dart';

class LargeGradientIcon extends StatelessWidget {
  const LargeGradientIcon({super.key, required this.child});

  LargeGradientIcon.icon(IconData icon, {super.key})
    : child = Icon(icon, color: Colors.white, size: 28);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: child),
    );
  }
}
