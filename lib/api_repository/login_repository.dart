import 'package:widget_app/models/login/login_info.dart';
import 'package:widget_app/models/login/user_info.dart';
import 'package:widget_app/services/service.dart';

abstract class LoginRepo {
  Future<UserInfo> login(LoginInfo info);
}

class LoginRepoImpl implements LoginRepo {
  LoginApi get api => LoginApiImpl.instance.api;

  @override
  Future<UserInfo> login(LoginInfo info) {
    return api.login(info);
  }
}
