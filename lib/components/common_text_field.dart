import 'package:flutter/material.dart';


//This is the Textfield that is uded in the login page
class CommonTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const CommonTextFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged, 
    this.obscureText = false, 
    this.suffixIcon, 
    this.prefixIcon, 
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: InputBorder.none
          ),
    );
  }
}