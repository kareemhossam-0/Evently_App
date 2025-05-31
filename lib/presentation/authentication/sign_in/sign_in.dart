import 'package:evently_app/core/extentions/text_ex.dart';
import 'package:evently_app/core/resourses/assets_manager.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_botton.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/presentation/authentication/widgets/custom_divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/DM/userDM.dart';
import '../../../core/data/firebase_services/firebase_services.dart';
import '../../../core/resourses/constant_manager.dart';
import '../../../core/resourses/dialog_utils.dart';
import '../../../core/resourses/routes_manager.dart';
import '../../../l10n/app_localizations.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool secure = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    navigate();
  }

  void navigate() async {
    if (FirebaseAuth.instance.currentUser != null) {
      UserDM.currentUSer = await FirebaseServices.getUserFromFireStore(
          FirebaseAuth.instance.currentUser!.uid);
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset(ImageAssets.logo)),
          Expanded(
            flex: 4,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      validator: (input) {
                        if (input == null || input
                            .trim()
                            .isEmpty) {
                          return "Plz, enter email";
                        }
                        if (!input.isValidEmail) {
                          return "Email bad format";
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: AppLocalizations.of(context)!.email,
                      prefixIcon: Icons.email_sharp,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                        validator: (input) {
                          if (input == null || input
                              .trim()
                              .isEmpty) {
                            return "Plz, enter password";
                          }
                          if (input.length < 6) {
                            return "Sorry, password should be at least 6 chars";
                          }
                          return null;
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: AppLocalizations.of(context)!.password,
                        prefixIcon: Icons.lock,
                        isSecure: secure,
                        suffixIcon:
                        secure ? Icons.visibility_off : Icons.visibility,
                        onClick: _onClick),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextButton(
                      alignment: Alignment.centerRight,
                      title: AppLocalizations.of(context)!.forget_password,
                      onPress: () {},
                    ),
                    CustomElevatedButton(
                        title: AppLocalizations.of(context)!.login,
                        onPress: _signIn),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dont_have_account,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomTextButton(
                            title: AppLocalizations.of(context)!.create_account,
                            onPress: () {
                              Navigator.pushReplacementNamed(
                                  context, RoutesManager.signUp);
                            })
                      ],
                    ),
                    CustomDivider(
                      text: AppLocalizations.of(context)!.or,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomButton(
                        title: AppLocalizations.of(context)!.login_with_google,
                        onTap: () {}),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onClick() {
    setState(() {
      secure = !secure;
    });
  }

  void _signIn() async {
    if (!formKey.currentState!.validate()) return;

    /// sign in user
    try {
      DialogUtils.showLoadingDialog(context);
      await FirebaseServices.signIn(
          emailController.text, passwordController.text);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(context, "User Logged-In Successfully",
          posTitle: "Go", posAction: () {
            Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
          });
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code == ConstantManager.invalidCredential) {
        DialogUtils.showMessageDialog(context, "Wrong email or password",
            posTitle: "retry");
      }
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(context, e.toString(), posTitle: "retry");
    }
  }
}