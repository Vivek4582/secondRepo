import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:untitled/core/routes.dart';
import 'package:untitled/feature/signup/controller/signupcontroller.dart';

class VerifyController extends GetxController{
    RxBool loader=false.obs;
    SignupController signupController = Get.find();
    FirebaseAuth auth = FirebaseAuth.instance;
     TextEditingController otp=  TextEditingController();







    verifyOTP(otp) async {
    AuthCredential phoneAuthCredential=PhoneAuthProvider.credential(verificationId: signupController.verificationID, smsCode:otp);
    try {
      final authCred=await auth.signInWithCredential(phoneAuthCredential);
      if(authCred.user!=null){
        loader.value=true;
        Get.offNamed(Routes.detail);
      }
    }on FirebaseAuthException catch (e) {
      print(e.message);
      GetSnackBar(title: "alert",message: "please enter a valid otp").show();

    }
  }

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color:Colors.blue),
      ),
    );

    otpValid(){
      if(otp.text.length<6||otp.text.isEmpty){
        GetSnackBar(title: "alert",message: "please enter a valid otp").show();

        return false;
      }else{
        return true;
      }


    }


}