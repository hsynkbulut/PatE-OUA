import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/themes/const.dart';
import 'package:pat_e/ui/widgets/custom_textfield.dart';
import 'package:pat_e/ui/views/startup/signin_page.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
                  const Text(
                    'PAT-E',
                    style: TextStyle(
                      fontFamily: 'ErasBold',
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: yellow,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextfield(
                    obscureText: false,
                    hintText: 'Email adresinizi girin',
                    icon: Icons.alternate_email,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
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
                          'Şifre Sıfırla',
                          style: TextStyle(
                            color: black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const SignIn(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: 'Hesabınız var mı? ',
                              style: TextStyle(
                                color: black,
                              ),
                            ),
                            TextSpan(
                              text: 'Giriş Yap',
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ]),
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
