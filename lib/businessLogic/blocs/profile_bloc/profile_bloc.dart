import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterbaseproject/businessLogic/repo/app_repo.dart';
import 'package:flutterbaseproject/businessUtils/constants/constants.dart';
import 'package:flutterbaseproject/businessUtils/sharedPreference/SharedPreferencesManager.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AppRepo appRepo;
  final SharedPreferencesManager sharedPrefs;

  ProfileBloc(this.appRepo, this.sharedPrefs) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      try {
        emit(ProfileLoading());
        String? strUserEmail = sharedPrefs.getString(AppStrings.UserEmail);
        String? strUserFirstName = sharedPrefs.getString(AppStrings.UserFirstName);
        String? strUserLastName = sharedPrefs.getString(AppStrings.UserLastName);
        String? strUserGender = sharedPrefs.getString(AppStrings.UserGender);
        String? strUserImage = sharedPrefs.getString(AppStrings.UserImage);
        emit(ProfileSuccess(
            strUserEmail: strUserEmail,
            strUserFirstName: strUserFirstName,
            strUserLastName: strUserLastName,
            strUserGender: strUserGender,
            strUserImage: strUserImage));
      } catch (e) {
        emit(ProfileError("$e"));
      }
    });
  }
}
