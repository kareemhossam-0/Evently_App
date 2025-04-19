import 'package:evently_app/presentation/authentication/sign_in/sign_in.dart';
import 'package:evently_app/presentation/authentication/sign_up/sign_up.dart';
import 'package:evently_app/presentation/main_layout/main_layout.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String signIn = 'signIn';
  static const String signUp = '/signUp';
  static const String mainLayout = '/mainLayout';

  static Route? router(RouteSettings setting) {
    switch (setting.name) {
      case signIn:
        return MaterialPageRoute(builder: (context) => const SignIn());

      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUp());

      case mainLayout:
        return MaterialPageRoute(builder: (context) => const MainLayout());
    }
  }
}
