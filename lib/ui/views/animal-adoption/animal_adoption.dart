import 'package:flutter/material.dart';
import 'package:pat_e/ui/components/sidemenu.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class AnimalAdoption extends StatefulWidget {
  const AnimalAdoption({super.key});

  @override
  State<AnimalAdoption> createState() => _AnimalAdoptionState();
}

class _AnimalAdoptionState extends State<AnimalAdoption> {
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
              'Hayvan Sahiplenme Anasayfası',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
