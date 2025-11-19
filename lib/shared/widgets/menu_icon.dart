import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon(this.icon, {super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
    );
  }
}
