// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';
import 'package:pat_e/ui/components/bottomnavbar.dart';
import 'package:pat_e/ui/views/authentication/forgot_password.dart';
import 'package:pat_e/ui/views/authentication/signin_page.dart';
import 'package:pat_e/ui/views/authentication/signup_page.dart';
import 'package:pat_e/ui/views/profile/profile.dart';
import 'package:pat_e/ui/views/contact/contactpage.dart';
import 'package:pat_e/ui/views/about/aboutpage.dart';
import 'package:pat_e/ui/views/startup/onboard.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.onBoardScreenRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardPage());
      case RouteConstant.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case RouteConstant.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case RouteConstant.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case RouteConstant.homeScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BottomNavbar(selectedIndex: 0));
      case RouteConstant.profileRoute:
        return MaterialPageRoute(builder: (_) => const Profile());
      case RouteConstant.contactRoute:
        return MaterialPageRoute(builder: (_) => const ContactPage());
      case RouteConstant.aboutScreenRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
