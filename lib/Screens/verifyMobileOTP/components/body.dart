import 'package:demo1/Screens/homescreen/home_screen.dart';
import 'package:demo1/Screens/verifyMobileOTP/components/background.dart';
import 'package:demo1/components/common_text_field.dart';
import 'package:demo1/components/rounded_button.dart';
import 'package:demo1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  final String verificationId; 
  const Body({super.key, 
  required this.verificationId
  })
  ;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
 
  TextEditingController otpController = TextEditingController();

  verifyOTP()async{
   String otp = otpController.text.trim();
   PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: otp);

   try{
   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
   if(userCredential.user != null){
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context,MaterialPageRoute(builder:(context) => HomeScreen()));
   }
   }on FirebaseAuthException catch(e){
    print(e.code.toString());
   }
   
  }


  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return BackGround(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
      
            SizedBox(height: size.height*0.03,),
      
            SvgPicture.asset("assets/icons/login-center.svg",
                height: size.height * 0.35),
      
            SizedBox(height: size.height*0.03),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(20)),
              child: CommonTextFieldWidget(
                controller: otpController,
                prefixIcon:const Icon(Icons.phone_iphone_outlined,color: kPrimaryColor,),
                hintText: "Enter OTP",
                onChanged: (value) {},
              ),
            ),

             RoundedButton(text:"Verify",color: kPrimaryColor,textcolor: Colors.white, press: (){verifyOTP();}),
      
        ],
      ),
      );
  }
}