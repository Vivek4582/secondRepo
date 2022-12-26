import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Navthirdcontroller extends GetxController{
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString name = "".obs;
  RxString password = "".obs;
@override
void onInit() async{
  // TODO: implement onInit
  printdata();
  super.onInit();
}
  printdata() async {
    print("Good Work");
    // final response = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name.value = prefs.getString("name")!;
    email.value = prefs.getString("emailId")!;
    phone.value = prefs.getString("phone")!;
    password.value = prefs.getString("password")!;




    print(name);
    print(email);
  }

}