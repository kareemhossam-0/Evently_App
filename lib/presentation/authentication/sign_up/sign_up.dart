import 'package:evently_app/core/extentions/text_ex.dart';
import 'package:evently_app/core/resourses/assets_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_botton.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/firebase_services/firebase_services.dart';
import '../../../core/resourses/constant_manager.dart';
import '../../../core/resourses/dialog_utils.dart';
import '../../../core/resourses/routes_manager.dart';
import '../../../l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool securePassword = true;
  bool secureRePassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.register,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Image.asset(ImageAssets.logo)),
          Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                            controller: nameController,
                            validator: (input) {
                              if (input == null || input
                                  .trim()
                                  .isEmpty) {
                                return "Plz, enter name";
                              }

                              return null;
                            },
                            keyboardType: TextInputType.name,
                            labelText: AppLocalizations.of(context)!.name,
                            prefixIcon: Icons.person),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextFormField(
                            controller: emailController,
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
                            keyboardType: TextInputType.emailAddress,
                            labelText: AppLocalizations.of(context)!.email,
                            prefixIcon: Icons.email_rounded),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextFormField(
                          controller: passwordController,
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
                          keyboardType: TextInputType.visiblePassword,
                          labelText: AppLocalizations.of(context)!.password,
                          prefixIcon: Icons.lock,
                          suffixIcon: securePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          isSecure: securePassword,
                          onClick: _onPasswordIconClick,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextFormField(
                          controller: rePasswordController,
                          validator: (input) {
                            if (input == null || input
                                .trim()
                                .isEmpty) {
                              return "Plz, enter re-password";
                            }
                            if (input != passwordController.text) {
                              return "password not match";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          labelText: AppLocalizations.of(context)!.re_password,
                          prefixIcon: Icons.lock,
                          suffixIcon: secureRePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          isSecure: secureRePassword,
                          onClick: _onRePasswordIconClick,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomElevatedButton(
                            title: AppLocalizations.of(context)!.register,
                            onPress: _signUp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .already_have_account,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                            CustomTextButton(
                                title: AppLocalizations.of(context)!.login,
                                onPress: () {
                                  Navigator.pushReplacementNamed(
                                      context, RoutesManager.signIn);
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _onPasswordIconClick() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onRePasswordIconClick() {
    setState(() {
      secureRePassword = !secureRePassword;
    });
  }

  void _signUp() async {
    if (!formKey.currentState!.validate()) return;
    try {
      DialogUtils.showLoadingDialog(context);
      await FirebaseServices.signUp(
          emailController.text, passwordController.text, nameController.text);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(context, "User Registered Successfully",
          posTitle: "Login", posAction: () {
            Navigator.pushReplacementNamed(context, RoutesManager.signIn);
          });
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code == ConstantManager.weakPassword) {
        DialogUtils.showMessageDialog(
          context,
          "The password provided is too weak.",
          posTitle: "retry",
        );
      } else if (e.code == ConstantManager.emailInUse) {
        DialogUtils.showMessageDialog(
          context,
          'The account already exists for that email.',
          posTitle: "retry",
        );
      }
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(
        context,
        e.toString(),
        posTitle: "retry",
      );
    }
  }
}