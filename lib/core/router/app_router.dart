import 'package:flutter/material.dart';
import 'package:weather_app/core/router/arguments.dart';
import 'package:weather_app/features/auth/presentation/ui/home_page.dart';
import 'package:weather_app/features/auth/presentation/ui/sign_in.dart';
import 'package:weather_app/features/auth/presentation/ui/sign_up.dart';
import '../../features/weather/presentation/ui/map_view.dart';
import '../../features/weather/presentation/ui/weather_view.dart';

class Routes {
  static const String homeRoute = "/home";
  static const String signInRoute = "/signIn";
  static const String singUpRoute = "/signUp";
  static const String mapRoute = "/map";
  static const String weatherRoute = "/weather";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.singUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.mapRoute:
        return MaterialPageRoute(builder: (_) => const MapView());
      case Routes.weatherRoute:
        return MaterialPageRoute(builder: (_) => WeatherView(arguments: settings.arguments as WeatherViewArguments));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(body: Container()),
    );
  }
}
