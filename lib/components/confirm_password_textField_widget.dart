import 'package:demo1/constants.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? cpController;
  final ValueChanged<String>? onChanged3;
  const ConfirmPasswordTextFieldWidget({
    super.key,
    this.hintText,
    this.cpController,
    this.onChanged3,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cpController,
      onChanged: onChanged3,
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
