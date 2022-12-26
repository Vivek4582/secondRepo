import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:untitled/core/routes.dart';
import 'package:untitled/feature/dashboard/controller/dashboardcontroller.dart';

class DashBoardView extends GetView<DashboardController>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("DASHBOARD",style: TextStyle(color: Colors.black),),
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
         child: Container(
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text("WELCOME",style: TextStyle(fontSize: 40,color: Colors.black),),
                 ],
               ),
               Image.asset("assets/ONBOARDING3.jpg",height: 300,width: 400,),
               SizedBox(height: 70,),
               SizedBox(
                 width: 250,
                 height: 50,
                 child: ElevatedButton(
                     onPressed: () {
                       controller.gotologin();
                     },
                     style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                     ),
                     child: const Text('LOGIN')),
               ),
           SizedBox(height: 20,),
               SizedBox(
                 width: 250,
                 height: 50,
                 child:   ElevatedButton(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                           Text('SIGNUP',
                             style:TextStyle(
                               color: Colors.blue,
                             ),
                           ),
                         ]),
                       ),
                     ],
                   ),
                   onPressed: (){
                     Get.toNamed(Routes.signup);
                   },

                   style: ButtonStyle(
                     backgroundColor: MaterialStatePropertyAll(Colors.white),
                     shape:MaterialStatePropertyAll(RoundedRectangleBorder(side: BorderSide(color: Colors.blue,width: 1,style: BorderStyle.solid),borderRadius: BorderRadius.circular(40),
                     ),

                     ),


                   ),

                 ),
               ),




             ],
           ),
         ),
       ),
     ),
   );
  }

}