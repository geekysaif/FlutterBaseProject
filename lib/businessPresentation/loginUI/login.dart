import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbaseproject/businessUtils/appRouter/AppRouter.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';
import 'package:flutterbaseproject/businessUtils/constants/constants.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';
import 'package:logging/logging.dart';
import '../../businessLogic/blocs/login_bloc/login_bloc.dart';
import '../../businessLogic/repo/app_repo.dart';
import '../../businessLogic/services/api_services/api_service.dart';
import '../../businessUtils/internet/ConnectivityService.dart';
import '../../businessUtils/toast/ToastUtil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // This widget is the root of your application.
  final apiService = ApiService.create();

  setupLog() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  @override
  void initState() {
    setupLog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppRepo appRepo = AppRepo(apiService);
    return const MyHomePage(title: 'Login');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isObscured = true;
  String loginToken = "";
  final _formKey = GlobalKey<FormState>();
  ConnectivityService connectivityService = ConnectivityService();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

/*call login api*/
  Future<void> hitLoginApi() async {
    bool isConnected = await connectivityService.checkConnectivity();
    if (isConnected) {
      context.read<LoginBloc>().add(CallLogin('emilys', 'emilyspass'));
      // context.read<LoginBloc>().add(CallLogin('mor_2314', '83r5^_'));
    } else {
      ToastUtil.showToast(AppStrings.noInternetMessage);
    }
  }

  /*validate email*/
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    // Regular expression for email validation
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // No error
  }

  /*validate password*/
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null; // No error
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          ToastUtil.showToast(AppStrings.loginSuccess);
          log("loginToken:-- ${state.strToken}");
          NavigationService.navigateAndReplace(AppRouter.home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.darkGreen)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: const Image(
                                    alignment: Alignment.center,
                                    height: 150.0,
                                    width: 150.0,
                                    image: AssetImage('assets/images/logo.png'),
                                    //  image: NetworkImage('https://picsum.photos/200'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  alignLabelWithHint: true,
                                  label: Text(AppStrings.email),
                                  hintText: 'Enter email',
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  labelStyle:
                                      TextStyle(color: AppColors.darkGreen),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.darkGreen, width: 2.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.darkGreen, width: 2.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.red, width: 2.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.red, width: 2.0),
                                  ),
                                  prefixIcon: Icon(Icons.person,
                                      color: AppColors.darkGreen),
                                ),
                                // Validation logic
                                validator: _validateEmail,
                                maxLines: 1,
                              //  autofocus: true,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                obscureText: _isObscured,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    label: const Text(AppStrings.password),
                                    hintText: 'Enter password',
                                    hintStyle: const TextStyle(fontSize: 12.0),
                                    labelStyle: const TextStyle(
                                        color: AppColors.darkGreen),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.darkGreen,
                                          width: 2.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.darkGreen,
                                          width: 2.0),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.red, width: 2.0),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.red, width: 2.0),
                                    ),
                                    prefixIcon: const Icon(Icons.key,
                                        color: AppColors.darkGreen),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        color: AppColors.darkGreen,
                                        _isObscured
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscured = !_isObscured;
                                        });
                                      },
                                    )),

                                // Validation logic
                                validator: _validatePassword,
                                maxLines: 1,
                                autofocus: false,
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  50.0, 10.0, 50.0, 10.0),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        Size(200, 50)),
                                    // Set width (200) and height (50)
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.darkGreen),
                                    // Background color
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            50.0), // Customize the border radius
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      hitLoginApi();
                                    } else {
                                      print('Validation failed');
                                    }
                                  },
                                  child: const Text(
                                    AppStrings.login,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (state is LoginLoading) ...[
                  const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: AppColors.darkGreen,
                      )),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
