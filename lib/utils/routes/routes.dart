import 'package:flutter/material.dart';
import 'package:untitled1/utils/routes/routes_name.dart';
import 'package:untitled1/view/view.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.loginScreen:
        return PageTransition(
          alignment: Alignment.center,
            duration: const Duration(milliseconds: 700),
            child: const LoginScreen(),
            type: PageTransitionType.rotate,
            settings: setting);

      case RoutesName.homeScreen:
        return PageTransition(
          alignment: Alignment.center,
            child: const HomeScreen(),
            duration: const Duration(milliseconds: 900),
            type: PageTransitionType.rotate,
            settings: setting);

      case RoutesName.checkoutScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CheckoutScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Routes defined'),
            ),
          );
        });
    }
  }
}
