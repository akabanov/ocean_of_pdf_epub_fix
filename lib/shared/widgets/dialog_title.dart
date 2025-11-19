import 'package:flutter/material.dart';

/// Layout and design convention for all app dialog titles.
class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key, required this.icon, required this.title});

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        icon,
        Text(
          title,
          softWrap: true,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
