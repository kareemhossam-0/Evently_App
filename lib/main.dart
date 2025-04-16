import 'package:evently_app/config/theme/themes_manger.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManger.light,
      darkTheme: ThemeManger.dark,
      themeMode: ThemeMode.light,
    );
  }
}
