import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_drop_down_menu.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                title: "Language",

                textView: selectedLang,

                menuItems: ["English", "عربي"],

                onChange: _onLanguageChange,
              ),

              SizedBox(height: 16.h),

              CustomDropDownMenu(
                title: "Theme",

                textView: selectedTheme,

                menuItems: ["Light", "Dark"],

                onChange: _onThemeChange,
              ),
            ],
          ),
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
