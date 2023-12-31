import 'package:demo1/constants.dart';
import 'package:flutter/material.dart';


//This is the Textfield that is uded in the login page
class EmailTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? eController;
  final ValueChanged<String>? onChanged1;
  const EmailTextFieldWidget({
    super.key,
    this.hintText,
    this.eController,
    this.onChanged1, 
    this.suffixIcon, 
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: eController,
      onChanged: onChanged1,
      decoration: InputDecoration(
          icon:const Icon(Icons.person,color: kPrimaryColor,),
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: InputBorder.none
          ),
    );
  }
}
