import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/themes/color.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller; // Controller eklendi
  final IconData icon;
  final bool obscureText;
  final String hintText;

  const CustomTextfield({
    Key? key,
    required this.controller, // Controller parametresi eklendi
    required this.icon,
    required this.obscureText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: secondaryColor,
          width: 2.0,
        ),
      ),
      child: TextField(
        controller: controller, // Controller kullanıldı
        obscureText: obscureText,
        style: const TextStyle(
          color: mainAuxiliaryColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: quaternaryColor.withOpacity(.6),
          ),
          hintText: hintText,
        ),
        cursorColor: mainAuxiliaryColor.withOpacity(.5),
      ),
    );
  }
}
