import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../gen/assets.gen.dart';
import '../shared/db/local_db.dart';
import '../shared/extensions/build_context_extensions.dart';
import '../shared/keys.dart';
import '../shared/logger/log_handler.dart';
import '../shared/route_names.dart';
import '../ui_elements/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: slowGlobalAnimationDuration,
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
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

    try {
      await LocalDB().doWhenOpened((e) => talker.log('Database Opened'));

      final prefs = GetIt.I<SharedPreferences>();
      final hasOnboarded = prefs.getBool(PrefKeys.hasOnboarded) ?? false;

      if (hasOnboarded) {
        router.goNamed(Routes.home);
        return;
      }

      router.goNamed(Routes.onboarding);
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }
}
