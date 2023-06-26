import 'package:flutter/material.dart';
import 'package:pat_e/ui/widgets/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavbar(selectedIndex: 0),
    );
  }
}
