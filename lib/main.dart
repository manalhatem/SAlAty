import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salaty/utilities/router.dart';
import 'package:salaty/utilities/routes.dart';
import 'bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

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


