import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/account%20module/home_screen.dart';
import 'package:kashflow/onboarding/onboarding_screen.dart';
import 'package:kashflow/onboarding/splashscreen.dart';
import 'package:kashflow/shared/core/keys.dart';
import 'package:kashflow/shared/core/router.dart';
import 'package:kashflow/shared/elements/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
      '''Tests that the onboarding screen is shown after the splashscreen is displayed if the user has not onboarded''',
      (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      MaterialApp.router(
        theme: getLightTheme(),
        routerConfig: getTestRouter(),
      ),
    );

    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(FadeTransition), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(OnboardingScreen), findsOneWidget);
  });

  testWidgets(
      '''Tests that the home screen is shown after the splashscreen is displayed when the user has onboarded''',
      (tester) async {
    SharedPreferences.setMockInitialValues({PrefKeys.hasOnboarded: true});

    await tester.pumpWidget(
      MaterialApp.router(
        theme: getLightTheme(),
        routerConfig: getTestRouter(),
      ),
    );

    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(FadeTransition), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
