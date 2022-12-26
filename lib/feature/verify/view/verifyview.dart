import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pinput/pinput.dart';
import 'package:untitled/core/routes.dart';
import 'package:untitled/feature/verify/controller/verifycontroller.dart';

class VerifyView extends GetView<VerifyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 25,
              ),
              Text(
                "VERIFY",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,

              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "WE HAVE SENT A VERIFICATION CODE ",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "TO ENTERED A PHONE NUMBER",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: controller.defaultPinTheme,
                androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                controller:controller.otp,

                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),
              Text("RESEND OTP",
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade600,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: ()
                           async {
                                                      var connectionResult =
                                                          await Connectivity().checkConnectivity();

                                                      if (connectionResult == ConnectivityResult.none) {
                                                        Get.defaultDialog(
                                                            title: 'Warning',
                                                            content: const Text(
                                                                'Please!!! check internet connection'));
                                                      } else {
                                                        if(controller.otpValid()){
                                                          controller.otpValid();
                                                        controller.verifyOTP(controller.otp.text);

                                                        }
                                                      }

                                              },


                        child: Text("Verify Phone Number")),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                              (route) => false,
                        );
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  }