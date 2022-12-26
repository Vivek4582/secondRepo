import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/navfirstcontroller.dart';

class navfirst extends GetView<Navfirstcontroller>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(()=>(
             Center(
              child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(


                  width: Get.width,
                    // height: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(

                          elevation: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.name.value,style: TextStyle(fontSize:30,fontWeight: FontWeight.w800,color: Colors.black),),
                                        SizedBox(height: 5,),
                                        Text(controller.email.value,style: TextStyle(fontSize:20,fontWeight: FontWeight.w800,color: Colors.black)),



                                      ],
                                    ),
                                    // CircleAvatar(
                                    //   backgroundColor: Colors.black,
                                    //   backgroundImage: controller.isImageSet.value ==
                                    //       true
                                    //       ? FileImage(File(
                                    //       controller.profilepicpath.value))
                                    //   as ImageProvider
                                    //       : const AssetImage(
                                    //       'asset/google2.jfif'),
                                    //   radius: 50,
                                    // )
                                    Image.asset("assets/google2.jfif",height: 50,width: 50,),


                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height:57

                                    , //height of button
                                    width:250, //width of button
                                    child:
                                    controller.issuccess.value==false?

                                    SizedBox(
                                      width: Get.width,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(

                                              backgroundColor: Colors.yellow.shade600, //background color of button
                                              side: BorderSide(width:1), //border width and color
                                              elevation: 3, //elevation of button
                                              shape: RoundedRectangleBorder( //to set border radius to button
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              padding: EdgeInsets.all(20) //content padding inside button
                                          ),
                                          onPressed: (){
                                            // controller.name.value;
                                            // controller.currentDate.value;
                                            // controller.currentAddress.value;
                                            // controller.currentTime.value;
                                            controller.takephoto(ImageSource.camera);
                                            controller.issuccess.value=true;
                                            print('function cld');

                                            // controller.logging();
                                            //code to execute when this button is pressed.
                                          },
                                          child: Text("Time In", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700))

                                      ),
                                    ): ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.yellow.shade600, //background color of button
                                            side: BorderSide(width:1), //border width and color
                                            elevation: 3, //elevation of button
                                            shape: RoundedRectangleBorder( //to set border radius to button
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            padding: EdgeInsets.all(20) //content padding inside button
                                        ),
                                        onPressed: (){
                                          // controller.name.value;
                                          // controller.currentDate.value;
                                          // controller.currentAddress.value;
                                          // controller.currentTime.value;
                                          controller.takephoto(ImageSource.camera);
                                          controller.issuccess.value=false;

                                          print('function cld');


                                          //code to execute when this button is pressed.
                                        },
                                        child: Text("Time Out", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700))
                                    )
                                ),
                              )
                            ],

                          ),

                        ),
                        Container(
                          width: Get.width,
                          child: Card(
                            elevation: 20,
                            child: Column(
                              children: [
                                ListTile(
                            leading: Icon(Icons.location_on_outlined,color: Colors.blue,size: 20,),
                            title: Text('Your Location',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,),),
                            trailing: Icon(Icons.refresh,color: Colors.blue,size: 20,),
                                ),
                                Divider(),
                                Container(
                                  width: Get.width,
                                  // height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.currentAddress.value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.blue),),
                                        // Text("Your current Date & Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
SizedBox(height: 10,),
                                        // Text(controller.currentDate.value,style: TextStyle(fontSize:15,fontWeight: FontWeight.w600,color: Colors.black)),
                                        // SizedBox(height: 10,),
                                        // Text(controller.currentTime.value,style: TextStyle(fontSize:15,fontWeight: FontWeight.w600,color: Colors.black)),


                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ],),),
                ],
              ),
            )
          ),
        ),
        ),
      ),
    );
  }
}
