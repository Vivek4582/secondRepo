import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/model/login_response.dart';



class DetailsController extends GetxController{
  RxString phone="".obs;
  RxString CurrentAddress="".obs;
  RxString CurrentTime="".obs;
  RxString CurrentDate="".obs;
  // var phone2= "8819930429";

  RxString namess="".obs;
  RxString ID= "".obs;

  RxBool circleChange = true.obs;
  RxBool dataId = true.obs;

  late TextEditingController names=TextEditingController();
  late TextEditingController email=TextEditingController();
  late TextEditingController password=TextEditingController();
  late TextEditingController phoneno=TextEditingController();

  List <LoginResponse>DataTableList=<LoginResponse>[].obs;
  // List <FetchResponse>DataById=<FetchResponse>[].obs;





  @override
  void onInit() async {
    printdata();
    super.onInit();
  }
  printdata()async{
    print("Good Task");
    final response=await  SharedPreferences.getInstance();
    SharedPreferences prefs =await SharedPreferences.getInstance();
    phone.value= prefs.getString("phone")!;
    ID.value= prefs.getString("id")!;


    print(phone.value);

    print("hello");
    // fetchDataTable();
  }
  DetailsController() {

  }


    // SharedPreferences prefs =await SharedPreferences.getInstance();
    // CurrentAddress.value= prefs.getString("currentTime")!;
    // CurrentTime.value= prefs.getString("currentAddress")!;
    // CurrentDate.value= prefs.getString("currentDate")!;
    // namess.value= prefs.getString("name")!;
    // print('hogya');
    // print(namess);



  }



