import 'package:flutter/material.dart';
import 'package:pat_e/core/services/auth_service.dart';
import 'package:pat_e/locator.dart';

class RegisterPageViewModel with ChangeNotifier {
  final AuthService _authService = locator<AuthService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUp(BuildContext context) {
    _authService.signUp(context,
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text);
  }
}
