import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:untitled/feature/navthirdpage/controller/navthirdcontroller.dart';

import '../../navfirstpage/controller/navfirstcontroller.dart';
import '../../navsecondpage/controller/navsecondcontroller.dart';
import '../controller/profilecontroller.dart';

class Profilebinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(()=>Navthirdcontroller());
    Get.lazyPut(()=>DetailsController());
    Get.lazyPut(()=>Navfirstcontroller());

    Get.put(ProfileController());

  }

}