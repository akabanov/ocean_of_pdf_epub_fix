import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:ocean_of_pdf_epub_fix/app/app.dart';
// import 'package:ocean_of_pdf_epub_fix/hive/hive_registrar.g.dart';
import 'package:ocean_of_pdf_epub_fix/pwa_install/pwa_install.dart';
import 'package:ocean_of_pdf_epub_fix/shared/hive/app_hive_box.dart';
import 'package:ocean_of_pdf_epub_fix/shared/log/log.dart';

void main() async {
  Log.init();
  final log = Log.forName('main');

  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString(
      'assets/google_fonts/OFL.txt',
    );
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });

  PWAInstall().setup(
    installCallback: () {
      log.info('App has been installed');
    },
  );

  await Hive.initFlutter();
  // Hive.registerAdapters();
  for (final box in AppHiveBox.values) {
    await box.openBox();
  }

  runApp(const App());
}
