import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterbaseproject/businessUtils/sharedPreference/SharedPreferencesManager.dart';
import '../../../businessUtils/constants/constants.dart';
import '../../models/newloginresponse/login_resp.dart';
import '../../repo/app_repo.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppRepo appRepo;
  final SharedPreferencesManager sharedPrefs;

  LoginBloc(this.appRepo, this.sharedPrefs) : super(LoginInitial()) {
    on<CallLogin>((event, emit) async {
      try {
        emit(LoginLoading());
        final resp = await appRepo.login({
          "username": event.username,
          "password": event.password,
        });
        if (resp.statusCode == 200) {

          sharedPrefs.setString(AppStrings.isLogin, 'true');
          sharedPrefs.setString(AppStrings.loginToken, resp.body!.accessToken.toString());
          sharedPrefs.setString(AppStrings.UserId, resp.body!.id.toString());
          sharedPrefs.setString(AppStrings.UserName, resp.body!.username.toString());
          sharedPrefs.setString(AppStrings.UserEmail, resp.body!.email.toString());
          sharedPrefs.setString(AppStrings.UserFirstName, resp.body!.firstName.toString());
          sharedPrefs.setString(AppStrings.UserLastName, resp.body!.lastName.toString());
          sharedPrefs.setString(AppStrings.UserGender, resp.body!.gender.toString());
          sharedPrefs.setString(AppStrings.UserImage, resp.body!.image.toString());
          sharedPrefs.setString(AppStrings.RefreshToken, resp.body!.refreshToken.toString());
          final String loginToken = sharedPrefs.getString(AppStrings.loginToken) ?? "";
          emit(LoginSuccess(resp, loginToken));
        } else {
          emit(const LoginFail("Error"));
        }
      } catch (e) {
        emit(LoginError("$e"));
      }
    });

    on<CallLogout>((event, emit) {
      try {
        sharedPrefs.clear();
        emit(Logout());
      } catch (e) {
        emit(LoginError("$e"));
      }
    });
  }
}
