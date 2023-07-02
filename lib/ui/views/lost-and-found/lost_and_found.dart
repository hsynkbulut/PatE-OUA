import 'package:flutter/material.dart';
import 'package:pat_e/ui/components/sidemenu.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class LostAndFound extends StatefulWidget {
  const LostAndFound({super.key});

  @override
  State<LostAndFound> createState() => _LostAndFoundState();
}

class _LostAndFoundState extends State<LostAndFound> {
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
              'Kayıp İlanı Anasayfası',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
