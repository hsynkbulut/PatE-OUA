// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';
import 'package:pat_e/locator.dart';
import 'package:pat_e/core/services/authentication_service.dart';

class RegisterPageViewModel with ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  File? profilePhoto;

  Future<void> signUp(BuildContext context) async {
    String? result = await _authenticationService.signUpUser(
      email: emailController.text,
      password: passwordController.text,
      username: nameController.text,
      profilePhoto: profilePhoto,
    );

    if (result != null) {
      // Kayıt başarılı, işlemler devam edebilir.
      // Örneğin, ana sayfaya yönlendirme yapabilirsiniz.
      Navigator.pushNamed(context, RouteConstant.homeScreenRoute);
    } else {
      // Kayıt başarısız, kullanıcıya bir hata mesajı gösterebilirsiniz.
    }
  }
}
