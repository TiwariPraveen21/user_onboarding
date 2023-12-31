import 'package:demo1/constants.dart';
import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? pController;
  final ValueChanged<String>? onChanged2;
  const PasswordTextFieldWidget({
    super.key,
    this.hintText,
    this.pController,
    this.onChanged2,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: pController,
      onChanged: onChanged2,
      obscureText: true,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: const Icon(
            Icons.remove_red_eye,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none),
    );
  }
}
