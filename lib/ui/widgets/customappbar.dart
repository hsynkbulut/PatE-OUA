import 'package:flutter/material.dart';
import 'package:pat_e/ui/views/home/home.dart';
import 'package:pat_e/core/utils/themes/const.dart';
import 'package:pat_e/ui/widgets/bottomnavbar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: purple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Pat-E',
                  style: TextStyle(
                    fontFamily: 'ErasBold',
                    fontSize: 22,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavbar(selectedIndex: 0)),
              );
            },
            child: Image.asset(
              'assets/images/logo3.png',
              width: 55,
              height: 55,
            ),
          ),
          Text(
            'Pati Dostu Uygulama',
            style: TextStyle(
              fontFamily: 'ErasBold',
              fontSize: 15,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
