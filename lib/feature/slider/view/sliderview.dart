import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:untitled/core/routes.dart';
import 'package:untitled/feature/slider/controller/slidecontroller.dart';

class SlideView extends GetView<SlideController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        title: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.bottomRight,
              child: IconButton(onPressed: () {

              },color: Colors.black87, icon: Icon(Icons.arrow_back_ios)
              ),
            ),
            InkWell(
              child: Text("Skip",style: TextStyle(fontSize: 20, color: Colors.black87),),
              onTap: () => Get.toNamed(Routes.dashboard),
            )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: "PLANNING",
                image: Image.asset('assets/ONBOARDING1.jpg'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Lorem ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Color(0xff255DEC))),
                      child:
                      Text("Next", style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    )
                  ],
                ),
                decoration: PageDecoration()),
            PageViewModel(
                title: "STARTUP",
                image: Image.asset('assets/LOGIN 1.png'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Lorem ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Color(0xff255DEC))),
                      child:
                      Text("Next", style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    )
                  ],
                ),
                decoration: PageDecoration()),
            PageViewModel(
                title: "SUCCESS",
                image: Image.asset('assets/ONBOARDING3.jpg'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Lorem ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Color(0xff255DEC))),
                      child:
                      Text("Next", style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    )
                  ],
                ),
                decoration: PageDecoration()),
          ],
          onDone: () {
            // When done button is press
            Get.toNamed(Routes.dashboard);
          },
          autoScrollDuration: 2000,
          showDoneButton: true,
          showNextButton: false,
          showSkipButton: true,
          skip: Text(
            'Skip',
            style: TextStyle(color: Colors.black),
          ),
          next:
          const Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
          showBackButton: false,
          done: const Text("Done",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            //size of dots
            color: Colors.grey,
            //color of dots
            activeSize: Size(22.0, 10.0),
            activeColor: Color(0xffFFD600),
            //color of active dot
            activeShape: RoundedRectangleBorder(
              //shave of active dot
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
      // body: IntroductionScreen(
      //
      //   showNextButton: false,
      //   done: const Text("Done"),
      //   onDone: () {
      //     Get.toNamed(Routes.dashboard);
      //     // On button pressed
      //   },
      //   pages: getpages(),
      //   globalBackgroundColor: Colors.white,
      // )
      // body: Center(
      //
        // child: Padding(
        //   padding: const EdgeInsets.all(14.0),
        //   child: Container(
        //     child: Column(
        //       children: [
        //         Image.asset("assets/ONBOARDING1.jpg",height: 300,width: 400,),
        //         SizedBox(height: 20,),
        //
        //         Text("PLANNING",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w800, color: Colors.greenAccent),),
        //         SizedBox(height: 30,),
        //
        //         Text("lorem Ipsum is simply dummy",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
        //         SizedBox(height: 8,),
        //
        //         Text("text of the Printing",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
        //         SizedBox(height: 8,),
        //
        //         Text("typesetting industry",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
        //         SizedBox(height: 50,),
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //       ],
        //     ),
        //   ),
        // ),
