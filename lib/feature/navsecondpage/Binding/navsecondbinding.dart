import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:untitled/feature/navsecondpage/controller/navsecondcontroller.dart';

class Navsecondbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailsController());
  }
}