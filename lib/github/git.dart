import 'package:flutter/material.dart';

class Github extends StatelessWidget {
  const Github({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub"),
        leading: Icon(Icons.connected_tv_sharp),
      ),
      body: Center(child: Card(
        child: Container(
          child: Column(
            children: [
              Text("welcome To GITHUB",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.green,fontSize: 40),),
              Text("second comment GITHUB",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.green,fontSize: 40),),


            ],
          ),
        ),
      ),
      ),
      
    );
  }
}
