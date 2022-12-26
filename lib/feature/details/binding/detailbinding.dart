import 'package:get/get.dart';
import 'package:untitled/core/repository/signup/signup_repo_impl.dart';
import 'package:untitled/feature/details/controller/detailcontroller.dart';

class DetailBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>SignupRepoImpl());

    Get.put(DetailController());




  }
}