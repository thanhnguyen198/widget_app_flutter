import 'package:bloc/bloc.dart';
import 'package:widget_app/utils/prefs.dart';

import '../../models/login/loginParameter.dart';
import '../../services/api.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final api = Api();
  LoginBloc() : super(const LoginState.notLogin()) {
    on<LoginEvent>((event, emit) async {
      final param = LoginParameter(
          'D82E4D7D-4306-4D2A-B72F-1AF58BC9C818',
          'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg',
          '1.1.3',
          'iOS',
          '16.6',
          'iPhone X');
      final responseLogin = await api.login(param);
      await Prefs.setString("accessToken", responseLogin?.accessToken ?? '');
      emit(const LoginState(loginSuccess: true));
    });
  }
}
