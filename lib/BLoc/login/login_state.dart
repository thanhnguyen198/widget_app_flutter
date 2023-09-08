import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState extends Equatable {
  final bool loginSuccess;
  const LoginState({required this.loginSuccess});

  const LoginState.notLogin() : this(loginSuccess: false);
  @override
  List<Object> get props => [];
}
