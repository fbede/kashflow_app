import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      animationDuration: Duration(milliseconds: 1000),
      //duration: 2000,
      splash: 'assets/images/app_logo.png',
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.scale,
      screenRouteFunction: () async {
        //TODO: Rename later
        context.goNamed('home');
        return 'home';
      },
    );
  }
}
