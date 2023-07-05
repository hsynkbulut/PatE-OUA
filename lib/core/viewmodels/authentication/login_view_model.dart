import 'package:flutter/material.dart';
import 'package:pat_e/core/services/auth_service.dart';
import 'package:pat_e/locator.dart';

class LoginPageViewModel with ChangeNotifier {
  final AuthService _authService = locator<AuthService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn(BuildContext context) {
    _authService.signIn(context,
        email: emailController.text, password: passwordController.text);
  }
}
