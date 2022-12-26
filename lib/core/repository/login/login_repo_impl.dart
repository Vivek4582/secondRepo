
import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled/core/model/login_response.dart';

import '../../../httpServices/http_service.dart';
import '../../../httpServices/http_service_impl.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  late HttpService _httpService;

  LoginRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }


  @override
  Future<List<LoginResponse>?> loginAPI(String name,String password) async {
    // TODO: implement loginAPI
    try {
      final response = await _httpService.loginAPI(name, password);
      if (response.statusCode == 200) {
        return loginResponseFromJson(response.toString());
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  List<LoginResponse> loginResponseFromJson(String str) =>
      List<LoginResponse>.from(
          json.decode(str).map((x) =>LoginResponse.fromJson(x)));

  // @override
  // Future<List<LoginResponse>?> loginAPIByNo(String phoneNumber) async {
  //   try {
  //     final response = await _httpService.loginAPIRequestByNo(phoneNumber);
  //     if (response.statusCode == 200) {
  //       return loginResponseFromJson(response.toString());
  //     }
  //   } on Exception catch (e) {
  //     print(e);
  //     return null;
  //   }
  //   return null;
  //
  // }


}