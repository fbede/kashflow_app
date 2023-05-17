import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../gen/assets.gen.dart';
import '../shared/route_names.dart';
import '../util/responsive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
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
        .addPostFrameCallback((_) async => await _gotoNextScreen());
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
    await Future.delayed(const Duration(seconds: 1), () {});
    router.goNamed(Routes.onboarding);
  }
}
