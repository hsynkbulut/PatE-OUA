import 'package:flutter/material.dart';
import 'package:pat_e/ui/widgets/sidemenu.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("Team"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'TEAM',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
