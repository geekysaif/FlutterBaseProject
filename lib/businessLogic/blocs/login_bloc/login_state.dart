part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {

}

class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final Response<LoginResp> response;
  final String  strToken;

  const LoginSuccess(this.response, this.strToken);
}
class LoginFail extends LoginState {
  final String error;
  const LoginFail(this.error);
}
class LoginError extends LoginState {
  final String error;
  @override
  List<Object> get props => [error];
  const LoginError(this.error);
}

class Logout extends LoginState {

  @override
  List<Object> get props => [ ];

}
