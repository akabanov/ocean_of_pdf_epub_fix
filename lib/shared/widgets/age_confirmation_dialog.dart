import 'package:flutter/material.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/classic_button.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/dialog_content.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/section_title.dart';

class AgeConfirmationDialog extends StatelessWidget {
  const AgeConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DialogContent(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle('Age Verification'),

          const SizedBox(height: 12),

          Text(
            'This content is intended for mature audiences only. '
            'By proceeding, you confirm that you are at least 18 years old '
            'and agree to view adult content.',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withAlpha(200),
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'Please confirm your age to continue:',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSurface.withAlpha(230),
            ),
          ),

          const SizedBox(height: 24),

          // Buttons section
          Center(
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClassicButton(
                  label: 'I am under 18',
                  icon: Icons.block,
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                ClassicButton(
                  label: 'I am 18 or older',
                  icon: Icons.check_circle_outline,
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
