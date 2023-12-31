import 'package:flutter/material.dart';

//This is the button(Login and signup) that is used on the Welcome screen of the application
class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color,textcolor;
  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    required this.color,
    required this.textcolor
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      width: size.width*0.8,
      height: size.height*0.05,
      child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
            )
        )
      ),
        onPressed: press, 
        child:Text(text,style: TextStyle(color:textcolor,fontSize: 18),)
        ),
    );
  }
}

