import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../interactors/onboarding_interactor.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingProvider extends _$OnboardingProvider {
  final OnboardingInteractor _interactor;

  OnboardingProvider({OnboardingInteractor? interactor})
      : _interactor = interactor ?? OnboardingInteractor();

  @override
  bool build() => _interactor.isOnboardingComplete;

  Future<void> completeOnboarding() async {
    await _interactor.completeOnboarding();
    state = true;
  }
}
