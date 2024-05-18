import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/shared.dart';

class OnboardingInteractor {
  final SharedPreferences _prefs;

  OnboardingInteractor({required SharedPreferences prefs}) : _prefs = prefs;

  bool get isOnboardingComplete =>
      _prefs.getBool(PrefKeys.hasOnboarded) ?? false;

  Future<void> completeOnboarding() async =>
      _prefs.setBool(PrefKeys.hasOnboarded, true);
}
