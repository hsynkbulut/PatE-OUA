import 'package:flutter/material.dart';
import 'package:pat_e/core/services/auth_service.dart';
import 'package:pat_e/locator.dart';

class ForgotPasswordPageViewModel with ChangeNotifier {
  final AuthService _authService = locator<AuthService>();
  final TextEditingController emailController = TextEditingController();

  void resetPassword(BuildContext context) {
    _authService.resetPassword(
      context,
      email: emailController.text,
    );
  }
}
