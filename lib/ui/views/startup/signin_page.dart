import 'package:flutter/material.dart';
import 'package:pat_e/ui/views/startup/forgot_password.dart';
import 'package:pat_e/ui/views/startup/signup_page.dart';
import 'package:pat_e/ui/widgets/bottomnavbar.dart';
import 'package:pat_e/ui/widgets/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pat_e/core/utils/themes/const.dart';

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
              Color(0xFF9072F3),
              Color(0xFF8769e9),
              Color(0xFF7148b5),
            ])),
        child: Scaffold(
          backgroundColor:
              Colors.transparent, // Arka plan rengini kırmızı olarak ayarla
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'PAT-E',
                    style: TextStyle(
                      fontFamily: 'ErasBold',
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: yellow, // Sarı renkte kalın yazıyla PAT-E yazısı
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextfield(
                    obscureText: false,
                    hintText: 'Email adresinizi girin',
                    icon: Icons.alternate_email,
                  ),
                  const SizedBox(height: 10),
                  CustomTextfield(
                    obscureText: true,
                    hintText: 'Şifrenizi girin',
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: BottomNavbar(selectedIndex: 0),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: const Center(
                        child: Text(
                          'Oturum Aç',
                          style: TextStyle(
                              color: black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: const SignUp(),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: const Center(
                        child: Text(
                          'Kaydol',
                          style: TextStyle(
                              color: Colors.black,
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
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const ForgotPassword(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Şifremi Unuttum',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: white,
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
