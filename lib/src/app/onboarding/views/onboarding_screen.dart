import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../currency_module/currency_picker_dialog.dart';
import '../../currency/providers/currency_provider.dart';
import '../../../../icons_module/icons.dart';
import '../../../../shared/app_color_mapper.dart';
import '../../../core/core.dart';
import '../../../shared/extensions/build_context_extensions.dart';
import '../interactors/onboarding_interactor.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _duration = fastGlobalAnimationDuration;
  final _curve = Curves.linear;
  final _maxIndex = 3;
  final _minIndex = 0;
  final _prefs = GetIt.I<SharedPreferences>();

  late final _controller = PageController();
  late final _onboardingService = OnboardingInteractor(prefs: _prefs);

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _currentIndex = _controller.page!.toInt();
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
            _OnboardingPages(controller: _controller),
            _BottomIndicator(
              controller: _controller,
              goToPage: (i) async => _gotoPage(i),
            ),
            _NavButtons(
              currentIndex: _currentIndex,
              minIndex: _minIndex,
              duration: _duration,
              maxIndex: _maxIndex,
              controller: _controller,
              goToPage: (i) async => _gotoPage(i),
            ),
          ],
        ),
      );

  Future<void> _gotoPage(int page) async {
    if (page < _minIndex) {
      return;
    }

    final dialogTitle =
        context.t.onboarding_module.onboarding_screen.currency_picker_title;

    if (page > _maxIndex) {
      final router = GoRouter.of(context);
      final defaultCurrency = await showCurrencyPicker(
        context,
        dialogTitle,
      );

      if (defaultCurrency == null) {
        return;
      }

      await ref
          .read(defaultCurrencyProvider.notifier)
          .setDefaultCurrency(defaultCurrency.id);

      unawaited(_onboardingService.completeOnboarding());

      router.goNamed(Routes.home);

      return;
    }

    await _controller.animateToPage(page, duration: _duration, curve: _curve);
  }
}

class _NavButtons extends StatelessWidget {
  const _NavButtons({
    required this.controller,
    required this.goToPage,
    required this.currentIndex,
    required this.minIndex,
    required this.duration,
    required this.maxIndex,
  });

  final int currentIndex;
  final int minIndex;
  final Duration duration;
  final int maxIndex;
  final PageController controller;
  final void Function(int i) goToPage;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 128,
          child: Row(
            children: [
              const SizedBox(width: 16),
              AnimatedScale(
                scale: currentIndex != minIndex ? 1 : 0,
                duration: duration,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () => goToPage(controller.page!.toInt() - 1),
                  child: const Icon(RemixIcons.arrow_left_line),
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                heroTag: null,
                onPressed: () => goToPage(controller.page!.toInt() + 1),
                child: AnimatedSwitcher(
                  duration: duration,
                  transitionBuilder: (child, animation) =>
                      RotationTransition(turns: animation, child: child),
                  child: currentIndex != maxIndex
                      ? const Icon(
                          RemixIcons.arrow_right_line,
                          key: ValueKey(0),
                        )
                      : const Icon(
                          RemixIcons.check_fill,
                          key: ValueKey(1),
                        ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      );
}

class _BottomIndicator extends ConsumerWidget {
  const _BottomIndicator({
    required this.controller,
    required this.goToPage,
  });

  final PageController controller;
  final void Function(int i) goToPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 128,
          child: SmoothPageIndicator(
            controller: controller,
            count: 4,
            effect: ScaleEffect(
              scale: 2,
              activeDotColor: context.colorScheme.primary,
              dotHeight: 12,
              dotWidth: 12,
              spacing: 16,
              dotColor: context.colorScheme.primaryContainer,
            ),
            onDotClicked: goToPage,
          ),
        ),
      );
}

class _OnboardingPages extends StatelessWidget {
  const _OnboardingPages({
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    final colorMapper = SVGColorChanger(
      oldColor: const Color(0xFF008000),
      newColor: context.theme.brightness == Brightness.dark
          ? context.colorScheme.primaryContainer
          : context.colorScheme.primary,
    );

    final userText = context.t.onboarding_module.onboarding_screen.pages;

    return PageView(
      controller: _controller,
      children: [
        _WelcomeScreenPage(
          key: const ValueKey('page1'),
          data: userText[0],
          content: Assets.images.appLogo.image(),
        ),
        _WelcomeScreenPage(
          key: const ValueKey('page2'),
          data: userText[1],
          content: SvgPicture(
            SvgAssetLoader(
              Assets.svg.dailyTransactions.keyName,
              colorMapper: colorMapper,
            ),
          ),
        ),
        _WelcomeScreenPage(
          key: const ValueKey('page3'),
          data: userText[2],
          content: SvgPicture(
            SvgAssetLoader(
              Assets.svg.incomeExpense.keyName,
              colorMapper: colorMapper,
            ),
          ),
        ),
        _WelcomeScreenPage(
          key: const ValueKey('page4'),
          data: userText[3],
          content: SvgPicture(
            SvgAssetLoader(
              Assets.svg.assetsAndLiabilities.keyName,
              colorMapper: colorMapper,
            ),
          ),
        ),
      ],
    );
  }
}

class _WelcomeScreenPage extends StatelessWidget {
  const _WelcomeScreenPage({
    required this.data,
    super.key,
    this.content = const SizedBox(),
  });

  final OnboardingPageData data;
  final Widget content;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(child: SizedBox(height: 32)),
            Flexible(
              fit: FlexFit.tight,
              flex: 10,
              child: content,
            ),
            const Flexible(child: SizedBox(height: 32)),
            Flexible(
              flex: 2,
              child: AutoSizeText(
                data.title,
                style: context.textTheme.displaySmall,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            const Flexible(child: SizedBox(height: 16)),
            Flexible(
              flex: 3,
              child: AutoSizeText(
                data.subtitle,
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 112),
          ],
        ),
      );
}
