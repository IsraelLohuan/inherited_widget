import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeStore = ThemeWidget.of(context);
    final themeMode = themeStore.value;

    return Scaffold(
      appBar: AppBar(title: const Text(''),),
      body: Column( 
        children: [
          RadioListTile<ThemeMode>(
            value: ThemeMode.system, 
            groupValue: themeMode, 
            onChanged: (value) {
              themeStore.changeTheme(ThemeMode.system);
            },
            title: const Text('Tema do sistema'),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.dark, 
            groupValue: themeMode, 
            onChanged: (value) {
              themeStore.changeTheme(ThemeMode.dark);
            },
            title: const Text('Tema Dark'),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.light, 
            groupValue: themeMode, 
            onChanged: (value) {
              themeStore.changeTheme(ThemeMode.light);
            },
            title: const Text('Tema Light'),
          )
        ],
      ),
    );
  }
}

