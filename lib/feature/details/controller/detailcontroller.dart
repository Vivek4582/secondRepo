import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/repository/signup/signup_repo_impl.dart';
import 'package:untitled/core/routes.dart';



class DetailController extends GetxController {
  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  getdata() async {
    final pref = await SharedPreferences.getInstance();
    phone.text= pref.getString('verifiednumber')!  ;
  }
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isEmailValid = false.obs;
  final formkey = GlobalKey<FormState>();
  RxBool isPassword = true.obs;
  bool netSatus = true;
  bool formSatus = true;

  CollectionReference Attendance = FirebaseFirestore.instance.collection('Attendance');
  final userMail = Get.arguments;
  showPassword() {
    if (isPassword.value == true) {
      isPassword.value = false;
    } else {
      isPassword.value = true;
    }
  }

  isEmail(email) {
    bool isEmailValid = EmailValidator.validate(email);
    if (!isEmailValid) {
      bool isdigit = isNumeric(email);
      if (isdigit) {
        if (!(email.length == 10)) {
          formSatus = false;
          Get.snackbar(
            'Warning',
            'Please enter 10 digit number',
            colorText: Colors.white,
            backgroundColor: Colors.redAccent,
          );
          return false;
        }
      } else {
        formSatus = false;
        Get.snackbar(
          'Warning',
          'invalid email',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,

        );
        return false;
      }
    }
    return true;
  }

  isValid(value, msg) {
    if (value == null || value.isEmpty) {
      return msg;
    }
    return null;
  }

  signupformvalid() {
    if (formkey.currentState!.validate()) {
      if (isEmail(email.text)) {
        return true;
      }
    }
  }

  late SignupRepoImpl _signupRepoImpl;
  DetailController(){
    _signupRepoImpl=Get.put(SignupRepoImpl());
  }
  insertdata() async {
    final response = await _signupRepoImpl.signupAPI(name.text, email.text, password.text,phone.text);
    if(response.response!=null){
      if(response.response=='1'){
        createcollection('att'+name.text);
        addAttendance(name.text, email.text, password.text,phone.text);
        return Get.defaultDialog(
            title: 'Success',
            content: const Text('You have successfully signed up,Go to login'),
            actions:[
              TextButton(onPressed: () {
                Get.toNamed(Routes.login);
              }, child: const Text('ok'))
            ]
        );
      }
    }
  }
  createcollection(collectionName){
    FirebaseFirestore.instance.collection(collectionName).add({});

  }
  //add students in firebase
  Future<void> addAttendance(name,email,password,phone){
    return Attendance.add(
        {
          'name':name,
          'email':email,
          'password':password,
          'phone':phone
        }

      // ignore: avoid_print
    ).then((value) => print('data added'))
        .catchError((error)=> print("failed to add user: $error"));


  }
// for autofill phone number
// PhoneNumber.text=SignupController.

}
