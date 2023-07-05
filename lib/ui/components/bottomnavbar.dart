// ignore_for_file: avoid_print

import 'package:pat_e/ui/views/home/home.dart';
import 'package:pat_e/ui/views/about/aboutpage.dart';
import 'package:pat_e/ui/views/profile/profile.dart';
import 'package:pat_e/ui/views/contact/contactpage.dart';
import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/themes/color.dart';

// ignore: must_be_immutable
class BottomNavbar extends StatefulWidget {
  int selectedIndex = 0;
  BottomNavbar({super.key, required this.selectedIndex});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      currentIndex = widget.selectedIndex;
    });
  }

  @override
  void initState() {
    onItemTapped(widget.selectedIndex);
    super.initState();
  }

  final List<Widget> pages = const [
    Home(),
    Profile(),
    ContactPage(),
    AboutPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0
        ? const Home()
        : currentIndex == 1
            ? const Profile()
            : currentIndex == 2
                ? const ContactPage()
                : const AboutPage();
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Icon(Icons.search),
        onPressed: () {
          print("add fab button");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Home();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: currentIndex == 0
                              ? primaryColor
                              : intermediateAuxiliaryColor,
                        ),
                        Text(
                          "Anasayfa",
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? primaryColor
                                  : intermediateAuxiliaryColor),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Profile();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currentIndex == 1
                              ? primaryColor
                              : intermediateAuxiliaryColor,
                        ),
                        Text(
                          "Profil",
                          style: TextStyle(
                              color: currentIndex == 1
                                  ? primaryColor
                                  : intermediateAuxiliaryColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ContactPage();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: currentIndex == 2
                              ? primaryColor
                              : intermediateAuxiliaryColor,
                        ),
                        Text(
                          "İletişim",
                          style: TextStyle(
                              color: currentIndex == 2
                                  ? primaryColor
                                  : intermediateAuxiliaryColor),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const AboutPage();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          color: currentIndex == 3
                              ? primaryColor
                              : intermediateAuxiliaryColor,
                        ),
                        Text(
                          "Hakkında",
                          style: TextStyle(
                              color: currentIndex == 3
                                  ? primaryColor
                                  : intermediateAuxiliaryColor),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
