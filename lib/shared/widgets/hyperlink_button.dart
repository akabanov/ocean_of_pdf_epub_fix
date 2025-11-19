import 'package:flutter/material.dart';
import 'package:ocean_of_pdf_epub_fix/shared/widgets/classic_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperlinkButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String url;

  const HyperlinkButton({
    super.key,
    required this.label,
    required this.icon,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ClassicButton(
      icon: icon,
      label: label,
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
    );
  }
}
