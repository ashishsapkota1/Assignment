import 'package:flutter/material.dart';
import 'package:untitled1/utils/routes/routes.dart';
import 'package:untitled1/utils/routes/routes_name.dart';
import 'package:untitled1/view/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      home: SplashScreen(),
    );
  }
}

