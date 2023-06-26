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
    return TextField(
      obscureText: obscureText,
      style: TextStyle(
        color: black,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          icon,
          color: black.withOpacity(.3),
        ),
        hintText: hintText,
      ),
      cursorColor: black.withOpacity(.5),
    );
  }
}
