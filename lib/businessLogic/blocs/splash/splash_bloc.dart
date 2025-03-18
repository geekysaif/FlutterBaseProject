import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../businessUtils/constants/constants.dart';
import '../../../businessUtils/sharedPreference/SharedPreferencesManager.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SharedPreferencesManager sharedPrefs;
  SplashBloc(this.sharedPrefs) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      final String strIsLogin = sharedPrefs.getString(AppStrings.isLogin) ?? "false";
      if (strIsLogin == "false") {
       emit(UnAuthenticated());
      } else {
        emit(Authenticated());
      }
    });
  }
}
