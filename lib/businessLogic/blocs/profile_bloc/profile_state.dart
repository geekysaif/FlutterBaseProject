part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final String? strUserEmail;
  final String? strUserFirstName;
  final String? strUserLastName;
  final String? strUserGender;
  final String? strUserImage;

  const ProfileSuccess({
    required this.strUserEmail,
    required this.strUserFirstName,
    required this.strUserLastName,
    required this.strUserGender,
    required this.strUserImage,
  });
}

class ProfileFail extends ProfileState {
  final String error;

  const ProfileFail(this.error);
}

class ProfileError extends ProfileState {
  final String error;

  const ProfileError(this.error);
}
