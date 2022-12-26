




import 'package:untitled/core/model/login_response.dart';

abstract class LoginRepo{
  Future<List<LoginResponse>?> loginAPI(String name,String password);

}