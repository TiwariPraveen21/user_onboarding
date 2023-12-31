import 'package:demo1/Screens/MobileLogin/mobile_login_screen.dart';
import 'package:demo1/Screens/Signup/components/background.dart';
import 'package:demo1/Screens/Signup/components/social_icon.dart';
import 'package:demo1/Screens/login/login_screen.dart';
import 'package:demo1/components/already_have_an_account.dart';
import 'package:demo1/components/common_text_field.dart';
//import 'package:demo1/components/confirm_password_textField_widget.dart';
//import 'package:demo1/components/email_text_field_widget.dart';
import 'package:demo1/Screens/Signup/components/or_divider.dart';
//import 'package:demo1/components/pass_text_field_widget.dart';
import 'package:demo1/components/rounded_button.dart';
import 'package:demo1/constants.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();

  void createAccount()async{
   String email = emailController.text.trim();
   String pass = passController.text.trim();
   String cpass = cpassController.text.trim();

   emailController.clear();
   passController.clear();
   cpassController.clear(); 

   if(email == "" || pass == ""  || cpass == ""){
    print("Please fill all the details");
   }

   else if(pass != cpass){
   print("Passowrd do not match"); 
   }

   else{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
      print("User Created");

      if(userCredential.user != null){
       Navigator.pop(context);
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
        const Text("Sign Up",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
      
        SizedBox(height: size.height*0.03,),
      
        SvgPicture.asset("assets/icons/signup.svg",height:size.height*0.25,),
      
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

            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(20)),
              child: CommonTextFieldWidget(
                controller: cpassController,
                hintText: "Enter your password again",
                prefixIcon:const Icon(Icons.lock,color: kPrimaryColor,),
                suffixIcon:const Icon(Icons.remove_red_eye,color: kPrimaryColor,),
                obscureText: true,
                onChanged: (value) {},
              ),
            ),
      
             RoundedButton(text:"SIGNUP",color: kPrimaryColor,textcolor: Colors.white, press: (){createAccount();}),
      
             SizedBox(height: size.height*0.03,),
      
             AlreadyHaveAnAccount(
              login: false,
              press: (){
                Navigator.push(
                  context,MaterialPageRoute(
                    builder:(context) => LoginScreen(),
                    )
                  );
              },
             ),
             SizedBox(height: size.height*0.03,),
      
             const OrDivider(),
      
            SizedBox(height: size.height*0.03,),
      
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaIcons(
                  iconSrc:"assets/icons/icons-google.svg",
                  press: (){
      
                  },
                ),
                SocialMediaIcons(
                  iconSrc:"assets/icons/icons-fb.svg",
                  press: (){
                    
                  },
                ),
                SocialMediaIcons(
                  iconSrc:"assets/icons/phone.svg",
                  press: (){
                   Navigator.push(
                    context, MaterialPageRoute(
                      builder:(context) =>const MobileLoginScreen())
                      ); 
                  },
                )
              ],
             )
      
             
           ],
          ),
      ))
    ;
  }
}
