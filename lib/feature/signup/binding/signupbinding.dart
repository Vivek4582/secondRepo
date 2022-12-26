import 'package:get/get.dart';
import 'package:untitled/feature/signup/controller/signupcontroller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SignupController());
  }

}