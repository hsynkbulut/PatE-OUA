// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';
import 'package:pat_e/ui/components/bottomnavbar.dart';
import 'package:pat_e/ui/views/animal-adoption/animal_adoption.dart';
import 'package:pat_e/ui/views/authentication/login_page.dart';
import 'package:pat_e/ui/views/authentication/register_page.dart';
import 'package:pat_e/ui/views/authentication/forgot_password.dart';
import 'package:pat_e/ui/views/donation-and-support/donation_and_support.dart';
import 'package:pat_e/ui/views/lost-and-found/lost_and_found.dart';
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
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RouteConstant.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case RouteConstant.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case RouteConstant.homeScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BottomNavbar(selectedIndex: 0));
      case RouteConstant.profileRoute:
        return MaterialPageRoute(builder: (_) => const Profile());
      case RouteConstant.contactRoute:
        return MaterialPageRoute(builder: (_) => const ContactPage());
      case RouteConstant.aboutScreenRoute:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case RouteConstant.animalAdoptionRoute:
        return MaterialPageRoute(builder: (_) => const AnimalAdoption());
      case RouteConstant.donationRoute:
        return MaterialPageRoute(builder: (_) => const DonationAndSupport());
      case RouteConstant.lostAndFoundRoute:
        return MaterialPageRoute(builder: (_) => const LostAndFound());
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
