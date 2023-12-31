import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({
    super.key, 
    required this.child,
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
            left: 0,
            top: 0,
            child: Image.asset("assets/images/main_top.png",width: size.width*0.3,)
            ),
            Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset("assets/images/main_bottom.png",width: size.width*0.25,)
            ),
            child,
        ],
      ),
    );
  }
}