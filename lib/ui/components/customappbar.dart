import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/common/constants/path_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/bottomnavbar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.showBackButton});
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop())
          : null,
      backgroundColor: primaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Row(
              children: const [
                SizedBox(width: 10),
                Text(
                  AppConstant.appName,
                  style: TextStyle(
                    fontFamily: 'ErasBold',
                    fontSize: 22,
                    color: secondaryColor,
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
              PathConstant.appBarLogoImage,
              width: 55,
              height: 55,
            ),
          ),
          const Text(
            AppConstant.appDescription,
            style: TextStyle(
              fontFamily: 'ErasBold',
              fontSize: 20,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
