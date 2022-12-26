import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/routes.dart';

class  SignupController extends GetxController {
  TextEditingController phonenumber = TextEditingController();
  var countryCode='91';
  RxBool loader=false.obs;



  // late GoogleSignIn googleSign;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  // for logout
  logout(){
  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
  }
// for google sign in
googleLogin() async {
print("googleLogin method Called");
GoogleSignIn _googleSignIn = GoogleSignIn();
try {
var reslut = await _googleSignIn.signIn();
if (reslut == null) {
return;
}
final userData = await reslut.authentication;
final credential = GoogleAuthProvider.credential(
accessToken: userData.accessToken, idToken: userData.idToken);
var finalResult = await FirebaseAuth.instance.signInWithCredential(credential);
print(finalResult);
print("Values is");
print("Result $reslut");
print(reslut.displayName);
print(reslut.email);
print(reslut.photoUrl);
Get.toNamed(Routes.detail);

} catch (error) {
print("Error");
print(error);

}
}


  //for sending otp
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";

  registerUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('verifiednumber',phonenumber.text);
    await auth.verifyPhoneNumber(
      phoneNumber: phonenumber.text,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        print(error);
      },
      codeSent: (verificationId, forceResendingToken) {
        verificationID = verificationId;
        print(verificationId);
        Get.toNamed(Routes.verify);
      },
      codeAutoRetrievalTimeout: (verificationId) {


      },
    );
  }

  isPhone(){
    if(phonenumber.text.isEmpty){
      GetSnackBar(title: "alert",message: "please enter a no.").show();

      // const CustomSnackbar(msg: 'Please Enter Number',title: 'Warning').show();
      return false;
    }

    else if(!(countryCode=='91')){
      GetSnackBar(title: "alert",message:  'Only Indian number are valid').show();


      // const CustomSnackbar(msg: 'Only Indian number are valid',title: 'Warning').show();
      return false;
    }


    else{

      return true;
    }


  }
}