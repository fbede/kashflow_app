import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/util/hidden_strings.dart';
import 'package:kashflow/util/paths.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String logoPath = '';
    Color bgColor = Colors.white;

    if (Theme.of(context).brightness == Brightness.light) {
      logoPath = Paths.APP_LOGO_PATH_LIGHT;
    } else {
      logoPath = Paths.APP_LOGO_PATH_DARK;
      bgColor = Colors.black;
    }

    return AnimatedSplashScreen.withScreenRouteFunction(
      animationDuration: Duration(milliseconds: 1000),
      backgroundColor: bgColor,
      splash: logoPath,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.scale,
      screenRouteFunction: () async {
        final prefs = GetIt.I.get<SharedPreferences>();
        final hasOnboarded = prefs.getBool(PrefKey.ONBOARDED) ?? false;

        //TODO: NOTE: Add Auth Screens before welcome screen and
        //change condition to check for logged in state

        if (!hasOnboarded) {
          context.goNamed(AppRoute.WELCOME);
        } else {
          context.goNamed(DASHBOARD_ROUTE);
        }

        return '';
      },
    );
  }
}
