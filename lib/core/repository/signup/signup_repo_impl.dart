import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled/core/model/sign_up_response.dart';
import 'package:untitled/core/repository/signup/signup_repo.dart';
import 'package:untitled/httpServices/http_service.dart';
import 'package:untitled/httpServices/http_service_impl.dart';



class SignupRepoImpl implements SignupRepo {
  late HttpService _httpService;

  SignupRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }


  // @override
  // Future<SignupResponse> deleteAPI(String id) async {
  //   // TODO: implement loginAPI
  //
  //   final response = await _httpService.deleteAPIRequest(id);
  //   Map<String, dynamic> ResponseMap = Map.from(jsonDecode(response.data));
  //   return SignupResponse.fromJson(ResponseMap);
  // }


  // @override
  // Future<SignupResponse> signupAPI(String username, String emailId,
  //     String password, String phoneNumber) async {
  //   // TODO: implement loginAPI
  //   print("this executed");
  //   final response = await _httpService.signupAPI(
  //       username, emailId, password, phoneNumber);
  //   Map<String, dynamic> ResponseMap = Map.from(jsonDecode(response. toString()));
  //   return SignupResponse.fromJson(ResponseMap);
  // }
  @override
  Future<SignupResponse> signupAPI(String name, String email, String password, String phone) async {
    final response=await _httpService.signupAPI(name, email, password, phone);
    Map<String,dynamic> responseMap=Map.from(jsonDecode(response.data));
    return SignupResponse.fromJson(responseMap);

  }


}



  // @override
  // Future<List<FetchDataResponse>?> fetchDataAPI(String myNumber, String password) async {
  //   final response = await _httpService.fetchDataAPIRequest(  myNumber, password);
  //   return  FetchDataResponseFromJson(response.toString());
  //   }
  //   // return null;
  // }
  // List<FetchDataResponse> FetchDataResponseFromJson(String str) => List<FetchDataResponse>.from(json.decode(str).map((x) => FetchDataResponse.fromJson(x)));
  //
