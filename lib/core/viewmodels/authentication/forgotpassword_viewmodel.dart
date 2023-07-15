import 'package:flutter/material.dart';
import 'package:pat_e/core/services/authentication_service.dart';
import 'package:pat_e/locator.dart';

class ForgotPasswordPageViewModel with ChangeNotifier {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final TextEditingController emailController = TextEditingController();

  void resetPassword(BuildContext context) {
    _authService.resetPassword(context, emailController.text);
  }
}
