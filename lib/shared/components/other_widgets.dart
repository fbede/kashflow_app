import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';
import '../responsive.dart';
import '../user_text.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: 24,
        child: RotationTransition(
          turns: _controller,
          child: Assets.svg.spinner.svg(
            theme: SvgTheme(
              currentColor: context.theme().colorScheme.onBackground,
            ),
          ),
        ),
      );
}

class NothingFoundWidget extends StatelessWidget {
  const NothingFoundWidget({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: 250,
              child: Assets.svg.nothing.svg(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                text ?? UserText.nothingFound,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}

class UnderConstructionWidget extends StatelessWidget {
  const UnderConstructionWidget({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: 250,
                child: Assets.svg.comingSoon.svg(),
              ),
              Text(
                text ?? UserText.underConstruction,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
