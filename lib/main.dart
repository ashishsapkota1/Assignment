import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/utils/routes/routes.dart';
import 'package:untitled1/view/splash_screen.dart';
import 'package:untitled1/viewModel/cart_viewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        home: BlocProvider(
          create: (context) => CartViewModel(),
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
