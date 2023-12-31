import 'package:demo1/Screens/MobileLogin/components/background.dart';
import 'package:demo1/Screens/verifyMobileOTP/otpverification.dart';
//import 'package:demo1/Screens/verifyMobileOTP/verify_otp.dart';
import 'package:demo1/components/common_text_field.dart';
import 'package:demo1/components/rounded_button.dart';
import 'package:demo1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  TextEditingController phoneController = TextEditingController();

  void sendOTP() async{
    String phone = "+91${phoneController.text.trim()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, forceResendingToken) {
        Navigator.push(
          context,MaterialPageRoute(builder:(context) =>OTPVerify(
            verificationId: verificationId,
          ))
          );
      },
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        print(error.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout:const Duration(seconds: 30)
    );

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
                controller: phoneController,
                prefixIcon:const Icon(Icons.phone_iphone_outlined,color: kPrimaryColor,),
                hintText: "Enter your Mobile Number",
                onChanged: (value) {},
              ),
            ),

             RoundedButton(text:"SIGNUP",color: kPrimaryColor,textcolor: Colors.white, press: (){sendOTP();}),
      
        ],
      ),
      );
  }
}

