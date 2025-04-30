import 'package:evently_app/config/theme/themes_manger.dart';
import 'package:evently_app/core/resourses/routes_manager.dart';
import 'package:evently_app/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(

            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.router,
            initialRoute: RoutesManager.mainLayout,
            theme: ThemeManger.light,
            darkTheme: ThemeManger.dark,
            themeMode: configProvider.currentTheme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: [
              Locale('en'), // English
              Locale('ar'), // Spanish
            ],
            locale: Locale(configProvider.currentLanguage),
          ),
    );
  }
}
