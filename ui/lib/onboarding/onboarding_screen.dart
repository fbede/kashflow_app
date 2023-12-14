import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/keys.dart';
import '../core/responsive.dart';
import '../core/route_names.dart';
import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';
import '../ui_elements/themes.dart';
import '../ui_elements/user_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;

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
                  key: const ValueKey('page1'),
                  title: UserText.onboardingPage1TitleText,
                  subtitle: UserText.onboardingPage1SubTitleText,
                  content: Assets.images.appLogo.image(height: 128, width: 128),
                ),
                _WelcomeScreenPage(
                  key: const ValueKey('page2'),
                  title: UserText.onboardingPage2TitleText,
                  subtitle: UserText.onboardingPage2SubTitleText,
                  content: Assets.svg.dailyTransactions.svg(),
                ),
                _WelcomeScreenPage(
                  key: const ValueKey('page3'),
                  title: UserText.onboardingPage3TitleText,
                  subtitle: UserText.onboardingPage3SubTitleText,
                  content: Assets.svg.incomeExpense.svg(),
                ),
                _WelcomeScreenPage(
                  key: const ValueKey('page4'),
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
              (_maxIndex * 2) + 1,
              growable: false,
              _listGenerator,
            ),
          ),
        ),
      );

  Widget _listGenerator(int i) {
    final index = i ~/ 2;
    final size = currentIndex == index ? 16.0 : 8.0;
    final normalColor = context.colorScheme.primaryContainer;
    final selectedColor = context.colorScheme.secondary;
    final color = currentIndex == index ? selectedColor : normalColor;

    if (i.isEven) {
      return GestureDetector(
        onTap: () async => _gotoPage(index),
        child: AnimatedContainer(
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
                  child: const Icon(PhosphorIconsRegular.caretLeft),
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
                      ? const Icon(
                          PhosphorIconsRegular.caretRight,
                          key: ValueKey(0),
                        )
                      : const Icon(
                          PhosphorIconsRegular.check,
                          key: ValueKey(1),
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

      unawaited(_savePreferences());

      return;
    }

    await _controller.animateToPage(page, duration: _duration, curve: _curve);
    currentIndex = page;
    setState(() {});
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PrefKeys.hasOnboarded, true);
  }
}

class _WelcomeScreenPage extends StatelessWidget {
  const _WelcomeScreenPage({
    super.key,
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
      color: context.colorScheme.secondary,
    );

const _onboardingSubtitleTextStyle = TextStyle(fontSize: 16);
