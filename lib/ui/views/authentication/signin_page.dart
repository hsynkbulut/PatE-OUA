import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/common/constants/path_constant.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';
import 'package:pat_e/core/utils/themes/custom_textfield.dart';
import 'package:pat_e/core/utils/themes/color.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              gradientColor1,
              gradientColor2,
              gradientColor3,
            ])),
        child: Scaffold(
          backgroundColor:
              transparentColor, // Arka plan rengini transparan olarak ayarla
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    PathConstant.logoPath2,
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppConstant.appName.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'ErasBold',
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const CustomTextfield(
                    obscureText: false,
                    hintText: 'Email adresinizi girin',
                    icon: Icons.alternate_email,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextfield(
                    obscureText: true,
                    hintText: 'Şifrenizi girin',
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteConstant.homeScreenRoute);
                    },
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: const Center(
                        child: Text(
                          'Oturum Aç',
                          style: TextStyle(
                              color: mainAuxiliaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteConstant.registerScreenRoute);
                    },
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: const Center(
                        child: Text(
                          'Kaydol',
                          style: TextStyle(
                              color: mainAuxiliaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstant.forgotPasswordRoute);
                      },
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Şifremi Unuttum',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: bgColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
