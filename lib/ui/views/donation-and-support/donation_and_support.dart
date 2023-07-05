import 'package:flutter/material.dart';
import 'package:pat_e/ui/components/sidemenu.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class DonationAndSupport extends StatefulWidget {
  const DonationAndSupport({super.key});

  @override
  State<DonationAndSupport> createState() => _DonationAndSupportState();
}

class _DonationAndSupportState extends State<DonationAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: const CustomAppBar(showBackButton: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Bağış & Destek Anasayfası',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
