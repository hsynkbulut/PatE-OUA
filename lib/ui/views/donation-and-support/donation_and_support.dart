// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/common/constants/path_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/components/rounded_button.dart';
import 'package:pat_e/ui/components/sidemenu.dart';

class DonationHomePage extends StatefulWidget {
  @override
  _DonationHomePageState createState() => _DonationHomePageState();
}

class _DonationHomePageState extends State<DonationHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: const CustomAppBar(
        showBackButton: true,
        pageTitle: AppConstant.donationAndSupportTitle,
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
                      'Bagıs ve Destek',
                      style: TextStyle(
                        fontFamily: 'OhChewy',
                        fontSize: 40.0,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    RoundedButton(
                      onPressed: () {
                        // "Bağış İlanlarına Bak" butonuna tıklama işlemleri
                      },
                      colour: secondaryColor,
                      tcolor: primaryColor,
                      title: 'Bağış İlanlarına Bak',
                    ),
                    const SizedBox(height: 2.0),
                    RoundedButton(
                      onPressed: () {
                        // "Bağış Talebinde Bulun" butonuna tıklama işlemleri
                      },
                      colour: primaryColor,
                      tcolor: secondaryColor,
                      title: 'Bağış Talebinde Bulun',
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 200,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          PathConstant.categoryDonation,
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
