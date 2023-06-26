import 'package:flutter/material.dart';
import 'package:pat_e/ui/widgets/sidemenu.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("More"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'MORE',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
