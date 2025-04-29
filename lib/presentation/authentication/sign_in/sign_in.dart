import 'package:evently_app/core/resourses/assets_manager.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_botton.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/presentation/authentication/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset(ImageAssets.logo)),
            Expanded(
              flex: 4,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      labelText: AppLocalizations.of(context)!.email,
                      prefixIcon: Icons.email,
                      isSecure: false,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      labelText: AppLocalizations.of(context)!.password,
                      prefixIcon: Icons.lock,
                      isSecure: secure,
                      suffixIcon:
                          secure ? Icons.visibility_off : Icons.visibility,
                      onClick: () {
                        _onSecure();
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextBotton(
                        alignment: Alignment.centerRight,
                        text: AppLocalizations.of(context)!.forget_password,
                        onPress: () {}),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                        title: AppLocalizations.of(context)!.login,
                        onPress: () {}),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dont_have_account,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        CustomTextBotton(
                          alignment: Alignment.center,
                          text: AppLocalizations.of(context)!.create_account,
                          onPress: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomDivider(text: AppLocalizations.of(context)!.or),
                    SizedBox(height: 20.h),
                    CustomButton(
                        title: AppLocalizations.of(context)!.login_with_google,
                        onTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSecure() {
    setState(() {
      secure = !secure;
    });
  }
}
