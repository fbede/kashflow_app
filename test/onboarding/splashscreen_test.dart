/* import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/src/app/onboarding/views/home_screen.dart';
import 'package:kashflow/src/app/onboarding/views/onboarding_screen.dart';
import 'package:kashflow/src/app/onboarding/views/splashscreen.dart';
import 'package:kashflow/shared/keys.dart';
import 'package:kashflow/src/core/routing/router.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
      '''Tests that the onboarding screen is shown after the splashscreen is displayed if the user has not onboarded''',
      (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      MaterialApp.router(
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
 */