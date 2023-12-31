import 'package:demo1/constants.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
     children: [
       Expanded(
         child: Divider(
           indent: 60,
           endIndent: 10,
          
           color: kPrimaryLightColor,
           thickness: 2,
         ),
       ),
       Text("OR"),
       Expanded(
         child: Divider(
         endIndent: 60,
           indent: 10,
           color: kPrimaryLightColor,
           thickness: 2,
         ),
       )
     ],
    );
  }
}

