import 'package:demo1/Screens/Signup/signup_screen.dart';
import 'package:demo1/Screens/Welcome/components/background.dart';
import 'package:demo1/Screens/login/login_screen.dart';
import 'package:demo1/components/rounded_button.dart';
import 'package:demo1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    //This size will provide the total heigth and width of our screen
    Size size = MediaQuery.of(context).size;

    //call the background widget with created on another page and child is implemented here
    return BackGround(
      child: SingleChildScrollView(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          const Text("Welcome to StudyGarh",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
          SizedBox(height: size.height*0.05,),
          SvgPicture.asset("assets/icons/chat.svg",height: size.height*0.45,),
          SizedBox(height: size.height*0.05,),
          RoundedButton(text:"LOGIN",color: kPrimaryColor,textcolor: Colors.white,
          press: (){
            Navigator.push(
              context, MaterialPageRoute(
                builder:(context) =>const LoginScreen())
                );
          }
          ),
      
          RoundedButton(text:"SIGN UP",color: kPrimaryLightColor,textcolor: Colors.black,
          press: (){
            Navigator.push(
              context, MaterialPageRoute(builder:(context) =>const SignUpScreen())
              );
          }
          ),
      
          
         ],
        ),
      ),
      );
  }
}

