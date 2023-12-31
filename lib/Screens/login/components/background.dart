import 'package:flutter/material.dart';

class Background extends StatelessWidget {
   final Widget child;
  const Background({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
         Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            "assets/images/main_top.png",
            width: size.width*0.35,
            )
          ),

          Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            "assets/images/login_bottom.png",
            width: size.width*0.4,
            )
          ),
          //We are declaring child as it is required the data of child is passed from body.dart
          child,  
        ],
      ),
    );
  }
}