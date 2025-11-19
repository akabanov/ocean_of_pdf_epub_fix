import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ocean_of_pdf_epub_fix/pwa_install/pwa_install.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/about_app.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/large_gradient_icon.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/menu_icon.dart';

enum _AppMenuAction {
  install,
  about,
}

class AppMenuButton extends ConsumerWidget {
  const AppMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<_AppMenuAction>(
      tooltip: 'Menu',
      icon: MenuIcon(Icons.more_vert),
      onSelected: (action) async {
        _activate(action, context, ref);
      },
      itemBuilder: (context) => [
        if (PWAInstall().installPromptEnabled) ...[
          const PopupMenuDivider(),

          PopupMenuItem(
            value: _AppMenuAction.install,
            child: _MenuItem(Icons.add_to_home_screen_outlined, 'Install app'),
          ),
        ],

        const PopupMenuDivider(),

        PopupMenuItem(
          value: _AppMenuAction.about,
          child: _MenuItem(Icons.info_outline, 'About'),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
        ),
        SizedBox(width: 12),
        Text(text),
      ],
    );
  }
}

void _activate(
  _AppMenuAction action,
  BuildContext context,
  WidgetRef ref,
) async {
  switch (action) {
    case _AppMenuAction.about:
      final packageInfo = await PackageInfo.fromPlatform();
      if (!context.mounted) return;
      showAboutDialog(
        context: context,
        applicationIcon: LargeGradientIcon.icon(CupertinoIcons.wrench),
        applicationName: 'OOP EPUB fixer',
        applicationVersion: packageInfo.version,
        children: [AboutApp()],
      );

    case _AppMenuAction.install:
      PWAInstall().promptInstall_();
  }
}
