import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/navfirstcontroller.dart';

class navfirstbinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(()=>Navfirstcontroller());
    Get.put(Navfirstcontroller());



  }

}