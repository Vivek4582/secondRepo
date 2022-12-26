import 'package:get/get.dart';
import 'package:untitled/feature/dashboard/controller/dashboardcontroller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}