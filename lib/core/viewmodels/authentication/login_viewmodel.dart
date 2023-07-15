// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';
import 'package:pat_e/core/services/authentication_service.dart';
import 'package:pat_e/locator.dart';

class LoginPageViewModel with ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    String? email = emailController.text;
    String? password = passwordController.text;

    if (email != null && password != null) {
      String? userID = await _authenticationService.signInUser(
          email: email, password: password);

      if (userID != null) {
        // Giriş başarılı, yapılacak işlemler
        // Örneğin: Ana sayfaya yönlendirme
        Navigator.pushNamed(context, RouteConstant.homeScreenRoute);
      } else {
        // Giriş başarısız, hata işlemleri
        // Örneğin: Hatalı giriş bilgileri mesajı gösterme
      }
    }
  }
}
