
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:untitled/feature/details/controller/detailcontroller.dart';

class DetailView extends GetView<DetailController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(controller.userMail),
              const SizedBox(
                height: 10,
              ),

              const Text(
                "ENTER DETAILS",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter name',
                      ),
                      controller: controller.name,
                      validator: (value) =>
                          controller.isValid(value, 'Please Enter value'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter email ID',
                      ),
                      controller: controller.email,
                      validator: (value) =>
                          controller.isValid(value, 'Please Enter value'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter phone',
                      ),
                      controller: controller.phone,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() => TextFormField(
                      obscureText: controller.isPassword.value,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: controller.isPassword.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            controller.showPassword();
                          },
                        ),
                      ),
                      controller: controller.password,
                      validator: (value) =>
                          controller.isValid(value, 'Enter password'),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: Get.width,
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
                            }else {
                                 controller.insertdata();
                                 // Get.snackbar('title', 'message');
                                  }
                            },




                          child: Text("Verify Phone Number"))
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
