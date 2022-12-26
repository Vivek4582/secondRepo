import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:untitled/feature/loginpage/controller/logincontroller.dart';

class LoginView extends GetView<LoginController>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("LOGIN",style: TextStyle(color: Colors.black),),
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
     body: Center(
       child: Padding(
         padding: const EdgeInsets.all(14.0),
         child: SingleChildScrollView(
           child: Container(
             child: Column(
               children: [
                 Image.asset("assets/LOGIN 1.png",height: 300,width: 400,),
                 Form(
                   key:controller.myloginkey,
                   child: Column(
                   children: [
                     Container(
                       margin: EdgeInsets.only(bottom: 22),
                       child: TextFormField(
                         controller: controller.userNameController,
                         autovalidateMode: AutovalidateMode.onUserInteraction,

                         obscureText: false,
                         decoration: InputDecoration(
                           labelText: "Enter Email ID/Phone Number ",
                           border:OutlineInputBorder(),
                         ),
                         validator: (value) {
                           if (value == null || value.isEmpty|| value==10) {
                             return 'Enter the valid email or phone number';
                           }
                           return null;
                         },
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(bottom: 22),
                       child: TextFormField(
                         controller: controller.userPasswordController,
                         autovalidateMode: AutovalidateMode.onUserInteraction,
                         obscureText: true,
                         decoration: InputDecoration(
                           labelText: "Enter Password ",
                           border:OutlineInputBorder(),
                         ),
                         validator: (value) {
                           if (value == null || value.isEmpty) {
                             return 'Enter the Valid Password';
                           }
                           return null;
                         },
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text("Forgot Password",style:TextStyle(
                             color: Colors.blue,
                             fontWeight: FontWeight.bold,fontSize:15
                         ),),
                       ],
                     ),
                     SizedBox(height: 20,),
                     SizedBox(
                       width: 320,
                       height: 50,
                       child: ElevatedButton(
                           onPressed: () async {

                               var connectionResult =
                               await Connectivity().checkConnectivity();
                               if (connectionResult == ConnectivityResult.none) {
                                 Get.defaultDialog(
                                     title: 'Warning',
                                     content: const Text(
                                         'Please!! check internet connection'));
                               } else {
                                 controller.loginAPI();

                                 // Get.snackbar('title', 'message');
                               }

                           },
                           child: const Text('LOGIN')),
                     ),
                     SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Create an account ",style:TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,fontSize:25
                     ),),

                         Text("SIGNUP",style:TextStyle(
                           color: Colors.blue,
                           fontWeight: FontWeight.bold,fontSize:30
                         ),),
                       ],
                     ),
                   ],

                 ),),

               ],
             ),


   ),
         ),
       ),
   ),
   );
  }

}
