import 'package:evently_app/config/theme/themes_manger.dart';
import 'package:evently_app/core/resourses/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.router,
            initialRoute: RoutesManager.signUp,
            theme: ThemeManger.light,
            darkTheme: ThemeManger.dark,
            themeMode: ThemeMode.light,
          ),
    );
  }
}
