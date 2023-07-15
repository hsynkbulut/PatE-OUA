// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/common/constants/path_constant.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/components/rounded_button.dart';
import 'package:pat_e/ui/components/sidemenu.dart';

class AnimalAdoptionHomePage extends StatefulWidget {
  @override
  _AnimalAdoptionHomePageState createState() => _AnimalAdoptionHomePageState();
}

class _AnimalAdoptionHomePageState extends State<AnimalAdoptionHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: const CustomAppBar(
        showBackButton: true,
        pageTitle: AppConstant.animalAdoptionHomeTitle,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.white],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -100,
                right: -90,
                child: Container(
                  width: 360,
                  height: 230,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 122, 77, 255),
                  ),
                ),
              ),
              Positioned(
                bottom: -218,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 530,
                    height: 420,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hayvan Sahiplenme',
                      style: TextStyle(
                        fontFamily: 'OhChewy',
                        fontSize: 40.0,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    RoundedButton(
                      onPressed: () {
                        // "Hayvan Sahiplen" butonuna tıklama işlemleri
                        Navigator.pushNamed(
                            context, RouteConstant.adoptPetRoute);
                      },
                      colour: secondaryColor,
                      tcolor: primaryColor,
                      title: 'Hayvan Sahiplen',
                    ),
                    const SizedBox(height: 2.0),
                    RoundedButton(
                      onPressed: () {
                        // "Hayvan Sahiplendir" butonuna tıklama işlemleri
                        Navigator.pushNamed(
                            context, RouteConstant.rehomeAnimalRoute);
                      },
                      colour: primaryColor,
                      tcolor: secondaryColor,
                      title: 'Hayvan Sahiplendir',
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 200,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          PathConstant.categoryAdoption,
                          width: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
