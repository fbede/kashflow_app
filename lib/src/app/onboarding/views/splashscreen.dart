import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../shared/extensions/build_context_extensions.dart';
import '../../app.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
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
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => _gotoNextScreen());
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

  Future<void> _gotoNextScreen() async {
    final router = GoRouter.of(context);

    await LocalDB().doWhenOpened((e) => talker.log('Database Opened'));

    final hasOnboarded = ref.watch(onboardingProvider);
    final defaultCurrencyIsSet =
        (await ref.watch(defaultCurrencyProvider.future)) != null;

    if (hasOnboarded & defaultCurrencyIsSet) {
      router.goNamed(Routes.home);
      return;
    }

    router.goNamed(Routes.onboarding);
  }
}
