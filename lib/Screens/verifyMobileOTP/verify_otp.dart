
import 'package:demo1/Screens/verifyMobileOTP/components/body.dart';
import 'package:flutter/material.dart';

class VerifyOTP extends StatelessWidget {
  const VerifyOTP({super.key, required String verificationId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(verificationId:"",),
    );
  }
}