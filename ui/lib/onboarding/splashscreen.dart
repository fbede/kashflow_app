import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/keys.dart';
import '../core/responsive.dart';
import '../core/route_names.dart';
import '../gen/assets.gen.dart';
import '../gen/dart_define.dart';
import '../ui_elements/themes.dart';

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
      await LocalDB(
        devMode: DartDefine.flavor == Flavor.development,
      ).doWhenOpened((e) => logger.log('Database Opened'));

      //final prefs = await SharedPreferences.getInstance();
      //final hasOnboarded = prefs.getBool(PrefKeys.hasOnboarded) ?? false;

      //TODO: Go home if onboarding is complete
      //  if (hasOnboarded) {
      //  router.goNamed(Routes.home);
      //    return;
      //  }

      router.goNamed(Routes.onboarding);
    } on Exception catch (e, s) {
      logger.handle(e, s);
      rethrow;
    }
  }
}
