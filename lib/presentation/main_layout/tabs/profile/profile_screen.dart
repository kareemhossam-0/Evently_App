import 'package:evently_app/core/resourses/colors_manager.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_drop_down_menu.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_profile_header.dart';
import 'package:evently_app/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedLang = "English";
  String selectedTheme = "Light";
  late ConfigProvider configProvider;


  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProfileHeader(
          userName: "Kareem Hossam",
          email: "kareemHossam@gmail.com",
        ),

        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CustomDropDownMenu(
                title: AppLocalizations.of(context)!.language,

                textView: configProvider.isEnglish ? "English" : "عربي",

                menuItems: ["English", "عربي"],

                onChange: _onLanguageChange,
              ),

              SizedBox(height: 16.h),
              CustomDropDownMenu(
                  title: AppLocalizations.of(context)!.title,
                  textView: configProvider.isDark ?
                  AppLocalizations.of(context)!.dark :
                  AppLocalizations.of(context)!.light,
                  menuItems: [
                    AppLocalizations.of(context)!.light,
                    AppLocalizations.of(context)!.dark,
                  ],
                  onChange: _onThemeChange
              )

            ],
          ),
        ),

        Spacer(flex: 1,),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.red,
                  foregroundColor: ColorsManager.white
              ),
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(width: 16.w,),
                  Icon(Icons.logout),
                  SizedBox(width: 8.w,),
                  Text(AppLocalizations.of(context)!.logout),
                ],
              )),
        ),
      ],
    );
  }

  void _onThemeChange(String? newTheme) {
    configProvider.changeAppTheme(
        newTheme == AppLocalizations.of(context)!.light
            ? ThemeMode.light
            : ThemeMode.dark
    );
  }

  void _onLanguageChange(String? newLang) {
    configProvider.changeAppLanguage(
        newLang == "English" ?
        "en" : "ar"
    );
  }
}
