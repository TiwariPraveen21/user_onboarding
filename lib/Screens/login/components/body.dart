import 'package:demo1/Screens/Signup/signup_screen.dart';
import 'package:demo1/Screens/homescreen/home_screen.dart';
import 'package:demo1/Screens/login/components/background.dart';
import 'package:demo1/components/already_have_an_account.dart';
import 'package:demo1/components/common_text_field.dart';
//import 'package:demo1/components/email_text_field_widget.dart';
//import 'package:demo1/components/pass_text_field_widget.dart';
import 'package:demo1/components/rounded_button.dart';
import 'package:demo1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController =  TextEditingController();
  TextEditingController passController =  TextEditingController();

  void loginUser()async{
    String email = emailController.text.trim();
    String pass = passController.text.trim();

    if(email == "" || pass == ""){
      print("Please fill all the Details");
    }

    else{
     try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
      if(userCredential.user != null){
       Navigator.popUntil(context, (route) => route.isFirst);
       Navigator.pushReplacement(
        context,MaterialPageRoute(builder:(context) => HomeScreen()));
      }
     }on FirebaseAuthException catch(e){
      print(e.code.toString());
     }
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      //this is the child that is called from the body.dart
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
      
            SizedBox(height: size.height*0.03,),
      
            SvgPicture.asset("assets/icons/login.svg",
                height: size.height * 0.35),
      
            SizedBox(height: size.height*0.03,),
      
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(20)),
              child: CommonTextFieldWidget(
                controller: emailController,
                hintText: "Enter your email here",
                prefixIcon:const Icon(Icons.person,color: kPrimaryColor,),
                onChanged: (value) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(20)),
              child: CommonTextFieldWidget(
                controller: passController,
                hintText: "Enter your password",
                prefixIcon:const Icon(Icons.lock,color: kPrimaryColor,),
                suffixIcon:const Icon(Icons.remove_red_eye,color: kPrimaryColor,),
                obscureText: true,
                onChanged: (value) {},
              ),
            ),
      
             RoundedButton(text:"Login",color: kPrimaryColor,textcolor: Colors.white, press: (){loginUser();}),
      
             SizedBox(height: size.height*0.03,),
      
             AlreadyHaveAnAccount(
              press: (){
               Navigator.push(
                context, MaterialPageRoute
                (builder:(context) =>const SignUpScreen(),
                )
                ); 
              },
             )
          ],
        ),
      ),
    );
  }
}


