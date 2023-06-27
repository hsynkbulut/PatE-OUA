import 'package:pat_e/ui/widgets/customappbar.dart';
import 'package:pat_e/ui/widgets/sidemenu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Anasayfa Sayfası',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
