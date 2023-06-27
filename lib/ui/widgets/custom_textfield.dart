import 'package:flutter/material.dart';
import 'package:pat_e/core/utils/themes/const.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;

  const CustomTextfield({
    Key? key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: yellow, // Border rengi burada ayarlanabilir
          width: 2.0, // Border kalınlığı burada ayarlanabilir
        ),
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: purple3.withOpacity(.6),
          ),
          hintText: hintText,
        ),
        cursorColor: Colors.black.withOpacity(.5),
      ),
    );
  }
}
