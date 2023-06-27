import 'package:pat_e/ui/views/home/home.dart';
import 'package:pat_e/ui/views/more/more.dart';
import 'package:pat_e/ui/views/profile/profile.dart';
import 'package:pat_e/ui/views/team/team.dart';
import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/themes/const.dart';

class BottomNavbar extends StatefulWidget {
  int selectedIndex = 0;
  BottomNavbar({required this.selectedIndex});

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
// TODO: implement initState
    super.initState();
  }

  final List<Widget> pages = [Home(), Profile(), Team(), More()];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0
        ? Home()
        : currentIndex == 1
            ? Profile()
            : currentIndex == 2
                ? Team()
                : More();
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        child: Icon(Icons.search),
        onPressed: () {
          print("add fab button");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
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
                        currentScreen = Home();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: currentIndex == 0 ? purple : Colors.grey,
                        ),
                        Text(
                          "Anasayfa",
                          style: TextStyle(
                              color: currentIndex == 0 ? purple : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currentIndex == 1 ? purple : Colors.grey,
                        ),
                        Text(
                          "Profil",
                          style: TextStyle(
                              color: currentIndex == 1 ? purple : Colors.grey),
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
                        currentScreen = Team();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: currentIndex == 2 ? purple : Colors.grey,
                        ),
                        Text(
                          "İletişim",
                          style: TextStyle(
                              color: currentIndex == 2 ? purple : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = More();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          color: currentIndex == 3 ? purple : Colors.grey,
                        ),
                        Text(
                          "Hakkında",
                          style: TextStyle(
                              color: currentIndex == 3 ? purple : Colors.grey),
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
