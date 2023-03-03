import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/util/visible_strings.dart';

//TODO: Fix Onboarding View
class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          UserText.Welcome,
          style: TextStyle(fontSize: 32),
        ),
        SizedBox(height: 8),
        FilledButton(
          onPressed: () => context.goNamed(AppRoute.CHOOSE_DEFAULT_CURRENCY),
          child: Text(
            UserText.Choose_Default_Currency,
          ),
        ),
      ],
    ))));
  }
}
