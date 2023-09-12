import 'package:bloc/bloc.dart';
import 'package:widget_app/api_repository/login_repository.dart';
import 'package:widget_app/utils/prefs.dart';

import '../../models/login/login_info.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final LoginRepoImpl _loginRepo;
  LoginBloc({required LoginRepoImpl loginRepo})
      : super(const LoginState.notLogin()) {
    _loginRepo = loginRepo;

    on<LoginEvent>((event, emit) async {
      final info = LoginInfo(
          deviceId: 'D82E4D7D-4306-4D2A-B72F-1AF58BC9C818',
          accessToken:
              'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg',
          appVersion: '1.1.3',
          deviceOs: 'iOS',
          deviceOsVersion: '16.6',
          deviceName: 'iPhone X');
      final responseLogin = await _loginRepo.login(info);
      await Prefs.setString("accessToken", responseLogin.accessToken);
      emit(const LoginState(loginSuccess: true));
    });
  }
}
