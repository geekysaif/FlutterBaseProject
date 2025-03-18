
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbaseproject/businessLogic/blocs/profile_bloc/profile_bloc.dart';
import 'package:flutterbaseproject/businessLogic/blocs/splash/splash_bloc.dart';
import 'package:flutterbaseproject/businessUtils/appRouter/AppRouter.dart';
import 'package:flutterbaseproject/businessUtils/constants/constants.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'businessLogic/blocs/login_bloc/login_bloc.dart';
import 'businessLogic/blocs/product_details/product_details_bloc.dart';
import 'businessLogic/blocs/products_bloc/products_bloc.dart';
import 'businessLogic/repo/app_repo.dart';
import 'businessLogic/services/api_services/api_service.dart';
import 'businessPresentation/loginUI/login.dart';
import 'businessUtils/getDeviceType/device_utils.dart';
import 'businessUtils/sharedPreference/SharedPreferencesManager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferencesManager prefs = SharedPreferencesManager();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final prefs = await SharedPreferences.getInstance();
  //await prefs.init(); // Initialize shared preferences
  runApp(MyApp(sharedPreferences: prefs));
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({super.key, required this.sharedPreferences});
   
  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  final apiService = ApiService.create();
  String? accessToken;
  @override
  void initState() {
    super.initState();
    initializeDeviceType();
  }

  @override
  Widget build(BuildContext context) {
    AppRepo appRepo = AppRepo(apiService);
    final SharedPreferencesManager sharedPrefs = SharedPreferencesManager(widget.sharedPreferences);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc(sharedPrefs)),
        BlocProvider(create: (context) => LoginBloc(appRepo,sharedPrefs)),
        BlocProvider(create: (context) => ProductsBloc(appRepo,sharedPrefs)),
        BlocProvider(create: (context) => ProductDetailsBloc(appRepo,sharedPrefs)),
        BlocProvider(create: (context) => ProfileBloc(appRepo,sharedPrefs)),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
          return MaterialApp(
            //routerConfig: appRouter,
            title: AppStrings.appName,
            initialRoute: kIsWeb ? AppRouter.login : AppRouter.splash,
            onGenerateRoute: AppRouter.generateRoute,
            navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,

          /*  initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const Login(), // Replace with your home screen
              '/introSlider': (context) =>   IntroSlider(), // Replace with your home screen
              '/home': (context) => const Home(), // Replace with your home screen
              '/products': (context) => const Products(), // Replace with your product screen
              '/events': (context) => const EventsList(), // Replace with your product screen
            },*/
          );
        }
      ),
    );
  }


}

Future<void> initializeDeviceType() async {
  AppStrings.deviceType = await DeviceUtils.getDeviceTypeAsString();
}


