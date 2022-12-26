import 'package:get/get.dart';
import 'package:untitled/core/repository/login/login_repo_impl.dart';
import 'package:untitled/feature/loginpage/controller/logincontroller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>LoginRepoImpl());

    Get.put(LoginController());
  }

}