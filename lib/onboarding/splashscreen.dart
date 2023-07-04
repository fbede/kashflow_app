import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/gen/assets.gen.dart';
import 'package:kashflow/shared/core/keys.dart';
import 'package:kashflow/shared/core/local_db.dart';
import 'package:kashflow/shared/core/log_handler.dart';
import 'package:kashflow/shared/core/responsive.dart';
import 'package:kashflow/shared/core/route_names.dart';
import 'package:kashflow/shared/elements/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        color: context.theme().scaffoldBackgroundColor,
        child: Center(
          child: FractionallySizedBox(
            heightFactor: 0.2,
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
      await LocalDB.instance
          .doWhenOpened((e) => Logger.instance.log('Database Opened'));

      await Future.delayed(slowGlobalAnimationDuration, () {});
      final prefs = await SharedPreferences.getInstance();
      final hasOnboarded = prefs.getBool(PrefKeys.hasOnboarded) ?? false;

      if (hasOnboarded) {
        router.goNamed(Routes.home);
        return;
      }

      router.goNamed(Routes.onboarding);
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }
}
