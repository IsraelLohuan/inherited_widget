import 'package:flutter/material.dart';
import 'package:inherited_widget_estudo/home_page.dart';
import 'package:inherited_widget_estudo/store/theme_store.dart';

import 'services/local_storage/hive_local_storage.dart';

void main() async {
  final localStorage = HiveLocalStorage();
  await localStorage.init();

  final themeStore = ThemeStore(localStorage)..init();

  runApp(
    ThemeWidget(
      notifier: themeStore, 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeStore = ThemeWidget.of(context);
    final themeMode = themeStore.value;

    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeMode,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: const HomePage(),
    );
  }
}

class ThemeWidget extends InheritedNotifier<ThemeStore> {
  const ThemeWidget({
    Key? key, 
    required ThemeStore notifier,
    required Widget child
  }) : super(key: key, child: child, notifier: notifier);

  static ThemeStore of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<ThemeWidget>()!;
    return inherited.notifier!;
  }
}