import 'package:get/get.dart';
import 'package:untitled/feature/navthirdpage/controller/navthirdcontroller.dart';

class Navthirdbinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(()=>Navthirdcontroller());
    Get.put(Navthirdcontroller());


  }

}