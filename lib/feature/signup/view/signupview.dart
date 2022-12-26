import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:untitled/core/routes.dart';
import 'package:untitled/feature/signup/controller/signupcontroller.dart';

class SignUpView extends  GetView<SignupController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios,size: 26,),
            color: Colors.black,
            onPressed: (() => Get.back()),
          ),
        ),

        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 30,
              ),
              const Text(
                'CREATE ACCOUNT',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'ENTER YOUR PHONE NUMBER TO SEND OTP',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                child: Column(
                  children: [
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        controller.phonenumber.text=phone.completeNumber;
                        print(phone.countryCode);
                      },
                      onCountryChanged: (country) {
                        print('Country changed to: ${country.name}');
                      },
                    ),
                    SizedBox(height: 200,),
                    SizedBox(
                      width: Get.width,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () async {
                            var connectionResult =
                            await Connectivity().checkConnectivity();
                            if (connectionResult == ConnectivityResult.none) {
                              Get.defaultDialog(
                                  title: 'Warning',
                                  content: const Text(
                                      'Please!!! check internet connection'));
                            } else {
                              if (controller.isPhone()) {
                                controller.registerUser();
                                if (controller.loader.value) {
                                  context.loaderOverlay.show();
                                }else{
                                  context.loaderOverlay.hide();

                                }
                              }
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text('SEND OTP',style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),)),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'OR',
                      style:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.googleLogin();
                            Get.toNamed(Routes.detail);


                          },
                          style: ElevatedButton.styleFrom(
                            side:
                            const BorderSide(color: Colors.blue),
                            backgroundColor: Colors.white,
                            textStyle:
                            const TextStyle(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(11),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/google2.jfif',
                                  width: 30,
                                ),
                                const SizedBox(width: 5,),
                                const Text(
                                  ' SIGNUP',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}