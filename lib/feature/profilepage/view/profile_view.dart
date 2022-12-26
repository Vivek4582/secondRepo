
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/profilecontroller.dart';

class ProfileView extends GetView<ProfileController>{




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Obx(
        ()=> Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Signup" ,style: TextStyle(color:Colors.black),),
            backgroundColor: Colors.white,
          ),
          body:Center(
            child:controller.pages[controller.selectedIndex.value],
          ),





          bottomNavigationBar: InkWell(
            child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                      backgroundColor: Colors.green
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: "My detail",
                      backgroundColor: Colors.yellow
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile",
                    backgroundColor: Colors.blue,
                  ),
                ],
                currentIndex: controller.selectedIndex.value,

                onTap: controller.onTapButton,
                elevation: 5
            ),
          ),
        ),
      )
    );

    }
    }



