part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

final class Authenticated extends SplashState {
  @override
  List<Object> get props => [];
}

final class UnAuthenticated extends SplashState {
  @override
  List<Object> get props => [];
}

