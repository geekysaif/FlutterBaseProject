import 'package:flutter/material.dart';
import 'package:flutterbaseproject/businessPresentation/eventUI/eventPage.dart';
import 'package:flutterbaseproject/businessPresentation/homeUI/homepage.dart';
import 'package:flutterbaseproject/businessPresentation/loginUI/login.dart';
import 'package:flutterbaseproject/businessPresentation/productsUI/products.dart';
import 'package:flutterbaseproject/businessPresentation/productsUI/productsdetails.dart';
import 'package:flutterbaseproject/businessPresentation/profileUI/Profile.dart';
import 'package:flutterbaseproject/introSlider/ui/introslider.dart';
import 'package:flutterbaseproject/splash/splashScreen.dart';
import '../../businessLogic/models/eventResponse/event_model.dart';
import '../../businessPresentation/eventUI/event_details_screen.dart';

class AppRouter {
  // Define the routes
  static const String splash = '/';
  static const String products = '/products';
  static const String productsDetail = '/productsDetail';
  static const String profile = '/profile';
  static const String home = '/home';
  static const String login = '/login';
  static const String introSlider = '/introSlider';
  static const String eventDetail = '/eventDetail';
  static const String event = '/event';

  // Generate routes dynamically
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
            builder: (_) => SplashScreen()); // Set the initial route here ;
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case profile:
        return MaterialPageRoute(builder: (_) => Profile());
      case introSlider:
        return MaterialPageRoute(builder: (_) => IntroSlider());
      case products:
        return MaterialPageRoute(builder: (_) => Products());

      case productsDetail:
        final String strID = settings.arguments as String; // Example argument
        return MaterialPageRoute(
            builder: (_) => ProductsDetails(strProductId: strID));

      case event:
        return MaterialPageRoute(builder: (_) => EventsList());

      case eventDetail:
        final EventData eventData =
            settings.arguments as EventData; // Example argument
        return MaterialPageRoute(
            builder: (_) => EventDetailsScreen(event: eventData));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
