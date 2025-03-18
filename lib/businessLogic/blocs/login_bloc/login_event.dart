part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class CallLogin extends LoginEvent {
  final String username;
  final String password;

  CallLogin(this.username, this.password);
}


class CallLogout extends LoginEvent {
  CallLogout();
}
