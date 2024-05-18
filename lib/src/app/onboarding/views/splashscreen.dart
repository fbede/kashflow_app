import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';
import '../../../shared/extensions/build_context_extensions.dart';
import '../interactors/onboarding_interactor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final _prefs = GetIt.I<SharedPreferences>();

  late final _onboardingService = OnboardingInteractor(prefs: _prefs);
  late final _controller = AnimationController(
    duration: slowGlobalAnimationDuration,
    vsync: this,
  )..repeat(reverse: true);
  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _gotoNextScreen());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: context.theme.scaffoldBackgroundColor,
        child: Center(
          child: FractionallySizedBox(
            heightFactor: 0.4,
            child: FadeTransition(
              opacity: _animation,
              child: Assets.images.appLogo.image(),
            ),
          ),
        ),
      );

  void _gotoNextScreen() async {
    final hasOnboarded = _onboardingService.isOnboardingComplete;

    await LocalDB().doWhenOpened((e) => talker.log('Hello'));

    if (hasOnboarded) {
      context.goNamed(Routes.home);
      return;
    }

    context.goNamed(Routes.onboarding);
  }
}
