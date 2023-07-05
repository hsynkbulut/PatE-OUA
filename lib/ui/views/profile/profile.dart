import 'package:flutter/material.dart';
import 'package:pat_e/ui/components/sidemenu.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Profil Sayfası',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
