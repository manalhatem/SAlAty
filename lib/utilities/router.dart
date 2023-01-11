import 'package:flutter/material.dart';

import '../screens/auth/login/views/login_view.dart';
import '../screens/auth/register/views/register_view.dart';
import '../screens/auth/welcome.dart';
import '../screens/home/views/home_view.dart';
import '../screens/on_boarding/views/on_boarding.dart';
import '../screens/splash.dart';
import 'routes.dart';


Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: ((context) => const SplashScreen()));
    case AppRoutes.onBoarding:
      return MaterialPageRoute(builder: ((context) => const OnBoardingView()));
    case AppRoutes.welcome:
      return MaterialPageRoute(builder: ((context) => const WelcomeView()));
    case AppRoutes.login:
      return MaterialPageRoute(builder: ((context) => const LoginView()));
    case AppRoutes.register:
      return MaterialPageRoute(builder: ((context) => const RegisterView()));
    case AppRoutes.home:
      return MaterialPageRoute(builder: ((context) => const HomeView()));
    default:
      return MaterialPageRoute(builder: ((context) => const SplashScreen()));
  }
}