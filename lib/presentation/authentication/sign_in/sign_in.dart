import 'package:evently_app/core/resourses/assets_manager.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_botton.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/presentation/authentication/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
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
            Expanded(child: Image.asset(AssetsManager.logo)),
            Expanded(
              flex: 4,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    SizedBox(height: 24.h),
                    const CustomTextFormField(
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                      isSecure: false,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      isSecure: secure,
                      suffixIcon:
                          secure ? Icons.visibility_off : Icons.visibility,
                      onClick: () {
                        _onSecure();
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextBotton(text: 'Forget Password?', onPress: () {}),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(title: 'Login', onPress: () {}),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t Have Account? ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        CustomTextBotton(
                          text: 'Create Account',
                          onPress: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    const CustomDivider(text: 'Or'),
                    SizedBox(height: 16.h),
                    CustomButton(title: "Login With Google", onTap: () {}),
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
