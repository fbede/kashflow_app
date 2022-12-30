import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/util/strings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      animationDuration: Duration(milliseconds: 1000),
      splash: 'assets/images/app_logo.png',
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.scale,
      screenRouteFunction: () async {
        final prefs = GetIt.I.get<SharedPreferences>();
        final hasOnboarded = prefs.getBool(ONBOARDED_KEY) ?? false;

        if (!hasOnboarded) {
          print('meant to go');
          context.go(ONBOARDING_ROUTE);
          //TODO: Add login logic
        } else {
          //*Note: For some weird reason if this is not put in an else clause it will be executed even if the condition is met
          context.go(DASHBOARD_ROUTE);
        }

        return 'home';
      },
    );
  }
}
