import 'package:evently_app/core/resourses/assets_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_botton.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  bool securePassword = true;
  bool secureRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Register'),
        centerTitle: true,
      ),
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
                    const CustomTextFormField(
                      labelText: 'Name',
                      prefixIcon: Icons.person,
                      isSecure: false,
                    ),
                    SizedBox(height: 16.h),
                    const CustomTextFormField(
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                      isSecure: false,
                    ),
                    SizedBox(height: 16.h),

                    CustomTextFormField(
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      isSecure: securePassword,
                      suffixIcon:
                      securePassword ? Icons.visibility_off : Icons.visibility,
                      onClick: () {
                        _onSecure();
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      isSecure: secureRePassword,
                      suffixIcon:
                      secureRePassword ? Icons.visibility_off : Icons
                          .visibility,
                      onClick: () {
                        _onRESecure();
                      },
                    ),
                    SizedBox(height: 16.h),


                    CustomElevatedButton(
                        title: 'Create Account', onPress: () {}),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have Account ?",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall,
                        ),
                        CustomTextBotton(
                          alignment: Alignment.center,
                          text: 'Login',
                          onPress: () {},
                        ),
                      ],
                    ),


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
      securePassword = !securePassword;
    });

  }

  void _onRESecure() {
    setState(() {
      secureRePassword = !secureRePassword;
    });
  }

}
