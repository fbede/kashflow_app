import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  Future<String> futureCall() async {
    // do async operation ( api call, auto login)
    return Future.value('home');
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/app_logo.png'),
      backgroundColor: Theme.of(context).backgroundColor,
      showLoader: false,
      loadingText: Text(''),
      futureNavigator: futureCall(),
    );
  }
}
