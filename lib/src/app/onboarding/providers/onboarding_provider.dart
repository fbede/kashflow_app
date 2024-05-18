import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interactors/onboarding_interactor.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingProvider extends _$OnboardingProvider {
  late final OnboardingInteractor _onboardingService;

  @override
  bool build({required SharedPreferences prefs}) {
    _onboardingService = OnboardingInteractor(prefs: prefs);
    return _onboardingService.isOnboardingComplete;
  }

  Future<void> completeOnboarding() async {
    await _onboardingService.completeOnboarding();
    state = true;
  }
}
