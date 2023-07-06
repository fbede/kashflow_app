import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:kashflow/gen/assets.gen.dart';
import 'package:kashflow/shared/core/responsive.dart';
import 'package:kashflow/shared/elements/user_text.dart';

import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Assets.svg.nothing.svg()),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  text ?? UserText.nothingFound,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
}

class UnderConstructionWidget extends StatelessWidget {
  const UnderConstructionWidget({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Assets.svg.comingSoon.svg()),
              const SizedBox(height: 16),
              Text(
                text ?? UserText.underConstruction,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.message,
    super.key,
    this.titleText,
  });

  final String? titleText;
  final String message;

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: context.theme().colorScheme.errorContainer,
        icon: Icon(PhosphorIcons.fill.warningCircle),
        iconColor: context.theme().colorScheme.error,
        title: titleText != null ? Text(titleText!) : null,
        content: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size(400, 400)),
          child: SingleChildScrollView(child: Text(message)),
        ),
        actions: [
          TextButton(
            onPressed: context.pop,
            style: TextButton.styleFrom(
              foregroundColor: context.theme().colorScheme.error,
            ),
            child: const Text(UserText.dismiss),
          )
        ],
      );
}
