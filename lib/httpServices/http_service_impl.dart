import 'package:dio/dio.dart';
import 'package:untitled/core/url_constant.dart';
import 'package:untitled/httpServices/http_service.dart';

class HttpServiceImpl implements HttpService{
  late Dio _dio;
  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: URLConstant.baseUrl));
  }

  @override
  Future<Response> loginAPI(String number, String password) async {
    Response response;
    try {
      response=await Dio().get('${URLConstant.baseUrl}${URLConstant.login}userName=$number&password=$password');
    }on DioError catch (e) {
      throw Exception(e.message);

    }
    return response;
  }

  @override
  Future<Response> signupAPI(String username, String emailId, String password, String phoneNumber) async {
    Response response;
    try {
    print("Good to See You");
    print(URLConstant.baseUrl+URLConstant.signup+'name=$username&emailId=$emailId&password=$password&phone=$phoneNumber');
    response = await _dio.post(URLConstant.baseUrl+URLConstant.signup+'name=$username&emailId=$emailId&password=$password&phone=$phoneNumber');
    print("done");
    }
    on DioError catch (e) {
    print(e.message);
    throw Exception(e.message);
    }
    return response;
  }
  
}