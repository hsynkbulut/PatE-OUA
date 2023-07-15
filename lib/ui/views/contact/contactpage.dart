import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/components/sidemenu.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: const CustomAppBar(
        showBackButton: false,
        pageTitle: AppConstant.contactTitle,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'İletişim Sayfası',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
