import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/login/login_info.dart';
import '../../models/login/user_info.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: 'https://dev.kisekaeapp.com/api')
abstract class LoginApi {
  factory LoginApi(Dio dio) = _LoginApi;

  @POST('/v2/login')
  Future<UserInfo> login(@Body() LoginInfo parameter);
}

class LoginApiImpl {
  static LoginApiImpl instance = LoginApiImpl._();
  LoginApiImpl._();

  late LoginApi _loginApi;
  LoginApi get api => _loginApi;

  Future<void> initLoginApi(Dio dio) async {
    _loginApi = LoginApi(dio);
  }
}
