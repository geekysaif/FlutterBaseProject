import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbaseproject/businessUtils/appRouter/AppRouter.dart';
import 'package:flutterbaseproject/businessUtils/navigationService/NavigationService.dart';
import '../businessLogic/blocs/splash/splash_bloc.dart';
import '../businessUtils/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String strIsLogin = "";

  @override
  void initState() {
    super.initState();

    // Animation setup
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();

    // Navigate to the next screen after delay
    Timer(const Duration(seconds: 1), () {
      context.read<SplashBloc>().add(GetAuthentication());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is Authenticated) {
          //context.go('/home');
          AppRouter.home;
         NavigationService.navigateAndReplace( AppRouter.home);
        }
        if (state is UnAuthenticated) {
          NavigationService.navigateAndReplace( AppRouter.introSlider);
         // context.go('/introSlider');
         // Navigator.pushReplacementNamed(context, '/introSlider');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white, // Set background color
        body: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 150), // Your logo
                const SizedBox(height: 20),
                const Text(
                  "GeekySaif Welcomes to You!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
