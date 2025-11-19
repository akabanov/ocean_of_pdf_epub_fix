import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:ocean_of_pdf_epub_fix/shared/hive/app_hive_box.dart';
import 'package:ocean_of_pdf_epub_fix/shared/log/log.dart';

class SettingsNotifier<T> extends Notifier<T> {
  static final Log _log = Log.forType(SettingsNotifier);

  SettingsNotifier({
    required this.storeKey,
    required this.seed,
    required this.encode,
    required this.decode,
  });

  static SettingsNotifier<bool> boolean({
    required String storeKey,
    required bool seed,
  }) => SettingsNotifier(
    seed: seed,
    storeKey: storeKey,
    encode: (x) => x.toString(),
    decode: (x) => bool.parse(x),
  );

  static SettingsNotifier<E> enumeration<E extends Enum>({
    required String storeKey,
    required E seed,
    required List<E> values,
  }) => SettingsNotifier(
    seed: seed,
    storeKey: storeKey,
    encode: (x) => x.name,
    decode: values.byName,
  );

  final String storeKey;
  final T seed;
  final String Function(T) encode;
  final T Function(String) decode;

  final Box<String> _box = AppHiveBox.settings.box();

  @override
  T build() {
    final string = _box.get(storeKey);
    if (string != null) {
      try {
        return decode(string);
      } catch (e) {
        _log.warning("Can't decode '$string' into ${T.runtimeType}: $e");
      }
    }
    return seed;
  }

  Future<void> updateValue(T value) async {
    state = value;
    unawaited(
      _box.put(storeKey, encode(value)).catchError((e, _) {
        _log.severe("Can't save ${T.runtimeType} '$value': $e");
      }),
    );
  }
}
