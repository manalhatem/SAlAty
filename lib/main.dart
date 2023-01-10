import 'package:flutter/material.dart';
import 'package:salaty/utilities/router.dart';
import 'package:salaty/utilities/routes.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sala App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.splash,
    //  home: const SplashScreen(),
    );
  }
}


