import 'package:demo1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcons extends StatelessWidget {
  final String iconSrc;
 final Function()? press;
  const SocialMediaIcons({
    super.key, 
    required this.iconSrc, 
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
       margin:const EdgeInsets.symmetric(horizontal: 10), 
       padding:const EdgeInsets.all(15),
       decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: kPrimaryLightColor
        ),
        shape: BoxShape.circle
       ),
       child: SvgPicture.asset(
       iconSrc,
       height: 20,
       width: 20,
       ),
      ),
    );
  }
}

