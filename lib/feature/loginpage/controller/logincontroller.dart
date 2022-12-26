
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/repository/login/login_repo.dart';
import 'package:untitled/core/repository/login/login_repo_impl.dart';
import 'package:untitled/core/routes.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> myloginkey = GlobalKey<FormState>();
  RxBool obvalue = false.obs;
  late TextEditingController userNameController = new TextEditingController();
  late TextEditingController userPasswordController = new TextEditingController();
  late LoginRepo _loginRepo;
  LoginController() {
    _loginRepo = Get.put(LoginRepoImpl());
  }




  void checkconn()async{
    try{
      final result = await InternetAddress.lookup('google.com');
      if (result.isEmpty && result[0].rawAddress.isNotEmpty){
        Get.snackbar("Connectivity", "Net connected",
            snackPosition: SnackPosition.TOP);
      }
    } on SocketException catch(_){
      Get.snackbar("Warning", "check internet connection",
          snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white,animationDuration: Duration(seconds: 3));
    }

     // login();
  }
  loginAPI()async {

    var isValide = myloginkey.currentState?.validate();
    if (isValide == true) {
      final response = await _loginRepo.loginAPI(
          userNameController.text, userPasswordController.text);
      print("Response print");
      if (response![0].response == 1) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("Id", response[0].id!);
        prefs.setInt("response", response[0].response!);
        prefs.setString("name", response[0].name!);
        prefs.setString("emailId", response[0].emailId!);
        prefs.setString("phone", response[0].phone!);
        prefs.setString("password", response[0].password!);

        Future.delayed(
          const Duration(seconds: 3),
              () => Get.offAllNamed(Routes.profile),
        );

      }
      }
      else {
        Get.snackbar("Warning", "Invalid credential",
            backgroundColor: Colors.white,
            colorText: Colors.red,
            snackPosition: SnackPosition.BOTTOM);
      }
      print(isValide);

      // print(response[0].response);

      print("Line Number 19");
    }
  }




//
//
// @override
// void initState() {
//   RxBool passwordVisible = false.obs;
// }
//
//
// late TextEditingController userName =  TextEditingController();
// late TextEditingController email =  TextEditingController();
// GlobalKey<FormState> loginkey = new GlobalKey<FormState>();
// validate()
// {
//
// }
// changevalue(){
//
//   obvalue.value=!obvalue.value;
//
//
//
// }