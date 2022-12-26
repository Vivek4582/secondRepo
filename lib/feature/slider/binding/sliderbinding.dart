import 'package:get/get.dart';
import 'package:untitled/feature/slider/controller/slidecontroller.dart';

class Sliderbinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SlideController());
  }

}