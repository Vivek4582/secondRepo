import 'package:dio/dio.dart';

abstract class HttpService {
  void init();
  Future<Response> signupAPI(String username,  String emailId, String password,String phoneNumber);
  Future<Response> loginAPI(String name, String password);





}