import 'package:pat_e/core/utils/themes/const.dart';
import 'package:pat_e/ui/views/home/home.dart';
import 'package:pat_e/ui/views/more/more.dart';
import 'package:pat_e/ui/views/profile/profile.dart';
import 'package:pat_e/ui/views/team/team.dart';
import 'package:pat_e/ui/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Pat-E',
                style: TextStyle(
                    color: yellow, fontSize: 100, fontFamily: 'OhChewy')),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1.0),
                bottomRight: Radius.circular(1.0),
              ),
              color: purple,
              /*
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/back.jpg'))*/
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Anasayfa"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavbar(selectedIndex: 0)))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pets),
            title: Text("Hayvan Sahiplenme"),
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => More()))
            },
          ),
          ListTile(
            leading: Icon(Icons.domain_verification),
            title: Text("Bağış & Destek"),
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Profile()))
            },
          ),
          ListTile(
            leading: Icon(Icons.announcement),
            title: Text("Kayıp İlanı"),
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Team()))
            },
          ),
          ListTile(
            leading: Icon(Icons.cast_for_education),
            title: Text("Bilgi & Eğitim"),
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()))
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text("Gönüllülük & Etkinlikler"),
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => More()))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Çıkış Yap"),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavbar(selectedIndex: 3)))
            },
          )
        ],
      ),
    );
  }
}
