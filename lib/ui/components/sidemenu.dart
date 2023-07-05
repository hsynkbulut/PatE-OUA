import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/utils/routing/route_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1.0),
                bottomRight: Radius.circular(1.0),
              ),
              color: primaryColor,
              /*
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/back.jpg'))*/
            ),
            child: Text(AppConstant.appName,
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 100,
                    fontFamily: 'OhChewy')),
          ),
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text("Anasayfa"),
            onTap: () =>
                {Navigator.pushNamed(context, RouteConstant.homeScreenRoute)},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text("Hayvan Sahiplenme"),
            onTap: () => {
              Navigator.pushNamed(context, RouteConstant.animalAdoptionRoute)
            },
          ),
          ListTile(
            leading: const Icon(Icons.domain_verification),
            title: const Text("Bağış & Destek"),
            onTap: () =>
                {Navigator.pushNamed(context, RouteConstant.donationRoute)},
          ),
          ListTile(
            leading: const Icon(Icons.announcement),
            title: const Text("Kayıp İlanı"),
            onTap: () =>
                {Navigator.pushNamed(context, RouteConstant.lostAndFoundRoute)},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Çıkış Yap"),
            onTap: () =>
                {Navigator.pushNamed(context, RouteConstant.loginScreenRoute)},
          )
        ],
      ),
    );
  }
}
