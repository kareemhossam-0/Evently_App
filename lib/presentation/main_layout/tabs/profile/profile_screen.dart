import 'package:evently_app/core/resourses/colors_manager.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_drop_down_menu.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_profile_header.dart';
import 'package:evently_app/provider/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/DM/userDM.dart';
import '../../../../core/resourses/routes_manager.dart';
import '../../../../l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedLang = "English";

  late ConfigProvider configProvider;

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    configProvider = Provider.of<ConfigProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProfileHeader(
            userName: UserDM.currentUSer!.name,
            email: UserDM.currentUSer!.email),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomDropDownMenu(
                title: AppLocalizations.of(context)!.language,
                textView: configProvider.isEnglish ? "English" : "عربي",
                menuItems: ["English", "عربي"],
                onChange: _onLanguageChange,
              ),
              SizedBox(height: 16.h),
              CustomDropDownMenu(
                  title: AppLocalizations.of(context)!.theme,
                  textView: configProvider.isDark
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  menuItems: [
                    AppLocalizations.of(context)!.light,
                    AppLocalizations.of(context)!.dark,
                  ],
                  onChange: _onThemeChange),
              SizedBox(
                height: 80.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.red,
                  ),
                  onPressed: _logOut,
                  child: Text("LogOut"))
            ],
          ),
        )
      ],
    );
  }

  void _onThemeChange(String? newTheme) {
    /// change current theme based new theme
    configProvider.changeAppTheme(
        newTheme == AppLocalizations.of(context)!.light
            ? ThemeMode.light
            : ThemeMode.dark);
  }

  void _onLanguageChange(String? newLang) {
    String lang = newLang == "English" ? "en" : "ar";
    configProvider.changeAppLang(lang);
  }

  void _logOut() async {
    await FirebaseAuth.instance.signOut();

    ///Current User  (firebase auth)
    UserDM.currentUSer = null;
    Navigator.pushReplacementNamed(context, RoutesManager.signIn);
  }
}