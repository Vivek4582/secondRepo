import 'package:get/get.dart';
import 'package:untitled/feature/verify/controller/verifycontroller.dart';

class VerifyBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(VerifyController());

  }
}