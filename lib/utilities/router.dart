import 'package:flutter/material.dart';

import '../screens/ category/views/category_details.dart';
import '../screens/auth/login/views/login_view.dart';
import '../screens/auth/register/views/register_view.dart';
import '../screens/auth/welcome.dart';
import '../screens/btn_nav.dart';
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
      return MaterialPageRoute(builder: ((context) =>  HomeView()));
    case AppRoutes.btn:
      return MaterialPageRoute(builder: ((context) =>  const BtnNavBAr()));
    case AppRoutes.catDetail:
      return MaterialPageRoute(builder: ((context) =>  const CategoryDetails()));
    default:
      return MaterialPageRoute(builder: ((context) => const SplashScreen()));
  }
}