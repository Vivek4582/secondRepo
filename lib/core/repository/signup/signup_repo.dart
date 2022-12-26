






import 'package:untitled/core/model/sign_up_response.dart';

abstract class SignupRepo{
  Future<SignupResponse> signupAPI(String username, String emailId, String password,String phoneNumber);
}