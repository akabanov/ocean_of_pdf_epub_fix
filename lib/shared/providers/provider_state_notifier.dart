import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderStateNotifier<T> extends Notifier<T> {
  ProviderStateNotifier(this.seed);

  final T seed;

  @override
  T build() {
    return seed;
  }

  void set(T newState) {
    if (state != newState) {
      state = newState;
    }
  }
}
