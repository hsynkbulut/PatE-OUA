import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/common/constants/path_constant.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/bottomnavbar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.showBackButton,
    required this.pageTitle,
  }) : super(key: key);

  final bool showBackButton;
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      backgroundColor: primaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Yönlendirme işlemi
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavbar(selectedIndex: 0)),
              );
            },
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
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  // Yönlendirme işlemi
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavbar(selectedIndex: 0)),
                  );
                },
                child: Image.asset(
                  PathConstant.appBarLogoImage,
                  width: 53,
                  height: 53,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  pageTitle, // Sayfaya özel metin burada görüntüleniyor
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
