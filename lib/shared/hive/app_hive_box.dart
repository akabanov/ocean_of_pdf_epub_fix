import 'package:hive_ce/hive.dart';

enum AppHiveBox<T> {
  settings<String>();

  Future<Box<T>> openBox() async {
    return Hive.openBox<T>(name);
  }

  Box<T> box() {
    return Hive.box(name);
  }
}
