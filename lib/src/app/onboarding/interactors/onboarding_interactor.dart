import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/shared.dart';

class OnboardingInteractor {
  final SharedPreferences _prefs;

  OnboardingInteractor({SharedPreferences? prefs})
      : _prefs = prefs ?? GetIt.I<SharedPreferences>();

  bool get isOnboardingComplete =>
      _prefs.getBool(PrefKeys.hasOnboarded) ?? false;

  Future<void> completeOnboarding() async =>
      _prefs.setBool(PrefKeys.hasOnboarded, true);
}
