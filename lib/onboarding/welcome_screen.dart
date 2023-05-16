import 'package:flutter/material.dart';
import 'package:kashflow/gen/assets.gen.dart';
import 'package:kashflow/gen/fonts.gen.dart';
import 'package:kashflow/util/responsive.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final _controller = PageController();

  final duration = const Duration(milliseconds: 250);
  final curve = Curves.linear;
  final maxIndex = 3;
  final minIndex = 0;

  int currentIndex = 0;

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
                  title: 'Welcome To Kashflow',
                  subtitle: "Let's help you manage your finances",
                  content: Assets.images.appLogo.image(height: 128, width: 128),
                ),
                _WelcomeScreenPage(
                  title: 'Record Your Daily Transactions',
                  subtitle:
                      'Enter your daily transactions to find out how much you are making and spending.',
                  content: Assets.svg.dailyTransactions.svg(),
                ),
                _WelcomeScreenPage(
                  title: 'Discover Your Finances',
                  subtitle:
                      'Indepth analysis of your money tells you where you can cut costs and increase income.',
                  content: Assets.svg.incomeExpense.svg(),
                ),
                _WelcomeScreenPage(
                  title: 'Know Your Networth',
                  subtitle:
                      'View and manage your assets and liabilities - stocks, bonds, saving, loans, real estate, crypto, gold, anything. Seriously, anything!',
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
              (maxIndex + 1) * 2,
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
        onTap: () async => gotoPage(index),
        child: AnimatedContainer(
          duration: duration,
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
                scale: currentIndex != minIndex ? 1 : 0,
                duration: duration,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () async => gotoPage(currentIndex - 1),
                  child: Icon(PhosphorIcons.regular.caretLeft),
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                heroTag: null,
                onPressed: () async => gotoPage(currentIndex + 1),
                child: AnimatedSwitcher(
                  duration: duration,
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: currentIndex != maxIndex
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

  Future<void> gotoPage(int page) async {
    if (page < minIndex) return;

    if (page > maxIndex) {
      return;
    }

    currentIndex = page;
    setState(() {});
    await _controller.animateToPage(page, duration: duration, curve: curve);
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
              style: context.theme().textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.dancingScript,
                    color: context.theme().colorScheme.secondary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              subtitle,
              style: context.theme().textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 112),
          ],
        ),
      );
}
