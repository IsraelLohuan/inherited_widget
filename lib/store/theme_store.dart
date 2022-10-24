
import 'package:flutter/material.dart';
import 'package:inherited_widget_estudo/services/local_storage/local_storage.dart';

const _themeModeKey = '_themeModeKey';

class ThemeStore extends ValueNotifier<ThemeMode> {
  final LocalStorage storage;

  ThemeStore(this.storage) : super(ThemeMode.system);
  
  Future<void> changeTheme(ThemeMode themeMode) async {
    value = themeMode;
    await storage.put(_themeModeKey, themeMode.name);
  }

  void init() {
    final name = storage.get(_themeModeKey);
    value = ThemeMode.values.firstWhere((e) => e.name == name, orElse: () {
      return ThemeMode.system;
    });
  }
}