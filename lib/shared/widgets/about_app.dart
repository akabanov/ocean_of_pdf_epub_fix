import 'package:flutter/material.dart';
import 'package:ocean_of_pdf_epub_fix/app/env.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/hyperlink_button.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/section_title.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle('About This App'),

          const SizedBox(height: 12),

          Text(
            'Blah.',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withAlpha(200),
            ),
          ),

          const SizedBox(height: 24),

          SectionTitle('Ocean of PDF'),

          const SizedBox(height: 12),

          Text(
            'Blah.',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withAlpha(200),
            ),
          ),

          const SizedBox(height: 32),

          // Links section
          HyperlinkButton(
            label: 'Visit O',
            icon: Icons.open_in_new,
            url: Env.oopUrl,
          ),
        ],
      ),
    );
  }
}
