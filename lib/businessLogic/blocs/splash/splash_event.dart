part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();
}
class GetAuthentication extends SplashEvent {
  const GetAuthentication();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}