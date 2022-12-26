import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:untitled/feature/navthirdpage/controller/navthirdcontroller.dart';

class Navthird extends GetView<Navthirdcontroller>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>(
         Center(
          child: Container(
            height: 400,
            width: 300,
            child: Card(
              color: Colors.greenAccent,

              child: Column(

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(
                        backgroundColor: Colors.redAccent[400],
                        radius: 30,
                      ),

                       Text(controller.name.value,style:TextStyle(fontWeight: FontWeight.w800,fontSize: 30,color: Colors.black),),
                       Text(controller.email.value,style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                    ],

                  ),
                  SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,20,0,0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name',style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                            Text(controller.name.value),
                            SizedBox(height: 10,),

                            Text('Email',style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                            Text(controller.email.value),
                            SizedBox(height: 10,),

                            Text('Phone',style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                            Text(controller.phone.value),
                            SizedBox(height: 10,),

                            Text('Password',style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                            Text(controller.password.value),
                            SizedBox(height: 20,),



                          ],
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),









      )
    ),
    )
    );

  }

}