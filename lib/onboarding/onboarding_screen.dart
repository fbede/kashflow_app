import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';
import '../shared/keys.dart';
import '../shared/responsive.dart';
import '../shared/route_names.dart';
import '../shared/themes.dart';
import '../shared/user_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;

  final _prefs = GetIt.I<SharedPreferences>();
  final _duration = fastGlobalAnimationDuration;
  final _curve = Curves.linear;
  final _maxIndex = 3;
  final _minIndex = 0;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(() {
      currentIndex = _controller.page!.toInt();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                _WelcomeScreenPage(
                  title: UserText.onboardingPage1TitleText,
                  subtitle: UserText.onboardingPage1SubTitleText,
                  content: Assets.images.appLogo.image(height: 128, width: 128),
                ),
                _WelcomeScreenPage(
                  title: UserText.onboardingPage2TitleText,
                  subtitle: UserText.onboardingPage2SubTitleText,
                  content: Assets.svg.dailyTransactions.svg(),
                ),
                _WelcomeScreenPage(
                  title: UserText.onboardingPage3TitleText,
                  subtitle: UserText.onboardingPage3SubTitleText,
                  content: Assets.svg.incomeExpense.svg(),
                ),
                _WelcomeScreenPage(
                  title: UserText.onboardingPage4TitleText,
                  subtitle: UserText.onboardingPage4SubTitleText,
                  content: Assets.svg.assetsAndLiabilities.svg(),
                ),
              ],
            ),
            _buildIndicators(),
            _buildNavButtons()
          ],
        ),
      );

  Align _buildIndicators() => Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 128,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              (_maxIndex + 1) * 2,
              growable: false,
              _listGenerator,
            ),
          ),
        ),
      );

  Widget _listGenerator(int i) {
    final index = i ~/ 2;
    final size = currentIndex == index ? 16.0 : 8.0;
    final normalColor = context.theme().colorScheme.primaryContainer;
    final selectedColor = context.theme().colorScheme.secondary;
    final color = currentIndex == index ? selectedColor : normalColor;

    if (i.isEven) {
      return GestureDetector(
        onTap: () async => _gotoPage(index),
        child: AnimatedContainer(
          key: ValueKey(index),
          duration: _duration,
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    return const SizedBox(width: 8);
  }

  Align _buildNavButtons() => Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 128,
          child: Row(
            children: [
              const SizedBox(width: 16),
              AnimatedScale(
                scale: currentIndex != _minIndex ? 1 : 0,
                duration: _duration,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () async => _gotoPage(currentIndex - 1),
                  child: Icon(PhosphorIcons.regular.caretLeft),
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                heroTag: null,
                onPressed: () async => _gotoPage(currentIndex + 1),
                child: AnimatedSwitcher(
                  duration: _duration,
                  transitionBuilder: (child, animation) =>
                      RotationTransition(turns: animation, child: child),
                  child: currentIndex != _maxIndex
                      ? Icon(
                          PhosphorIcons.regular.caretRight,
                          key: const ValueKey(0),
                        )
                      : Icon(
                          PhosphorIcons.regular.check,
                          key: const ValueKey(1),
                        ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      );

  Future<void> _gotoPage(int page) async {
    if (page < _minIndex) return;

    if (page > _maxIndex) {
      context.goNamed(Routes.home);
      await _prefs.setBool(PrefKeys.hasOnboarded, true);
      return;
    }

    await _controller.animateToPage(page, duration: _duration, curve: _curve);
    currentIndex = page;
    setState(() {});
  }
}

class _WelcomeScreenPage extends StatelessWidget {
  const _WelcomeScreenPage({
    this.title = '',
    this.subtitle = '',
    this.content = const SizedBox(),
  });

  final String title;
  final String subtitle;
  final Widget content;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 96),
            Expanded(child: content),
            const SizedBox(height: 32),
            Text(
              title,
              style: _getOnboardingTitleTextStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              subtitle,
              style: _onboardingSubtitleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 112),
          ],
        ),
      );
}

TextStyle _getOnboardingTitleTextStyle(BuildContext context) => TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w100,
      fontFamily: FontFamily.dancingScript,
      color: context.theme().colorScheme.secondary,
    );

const _onboardingSubtitleTextStyle = TextStyle(fontSize: 16);
