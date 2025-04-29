import 'package:evently_app/core/resourses/colors_manager.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_drop_down_menu.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedLang = "English";
  String selectedTheme = "Light";

  @override
  Widget build(BuildContext context) {
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

                textView: selectedLang,

                menuItems: ["English", "عربي"],

                onChange: _onLanguageChange,
              ),

              SizedBox(height: 16.h),

              CustomDropDownMenu(
                title: AppLocalizations.of(context)!.theme,

                textView: selectedTheme,

                menuItems: [
                  AppLocalizations.of(context)!.light,
                  AppLocalizations.of(context)!.dark,
                ]onChange: _onThemeChange,
              ),
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
    setState(() {
      selectedTheme = newTheme!;
    });
  }

  void _onLanguageChange(String? newLang) {
    setState(() {
      selectedLang = newLang!;
    });
  }
}
