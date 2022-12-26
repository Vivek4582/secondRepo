import 'package:get/get.dart';
import 'package:untitled/feature/loginpage/controller/logincontroller.dart';
import 'package:untitled/feature/splash/controller/splashcontroller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}